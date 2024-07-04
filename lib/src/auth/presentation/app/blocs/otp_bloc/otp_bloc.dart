import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fushati/core/res/media.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/common/app/cache_helper.dart';
import '../../../../../../core/services/router.dart';
import '../../../../../../core/utils/constants/error_consts.dart';
import '../../../../../../core/utils/constants/text_constants.dart';
import '../../../../../../core/utils/core_utils.dart';
import '../../../../domain/usecases/auth_usecases.dart';
import '../../../views/login_view.dart';
import '../../../views/resend_otp_after_failure.dart';
import '../../../views/update_user_info_view.dart';
import '../../../views/verify_otp_view.dart';

part 'otp_bloc.freezed.dart';

part 'otp_event.dart';

part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final VerifyOTP _verifyOTP;
  final CacheHelper _cacheHelper;
  final LoginOrRegister _loginOrRegister;

  OtpBloc(
      {required VerifyOTP verifyOTP,
      required LoginOrRegister loginOrRegister,
      required CacheHelper cacheHelper})
      : _verifyOTP = verifyOTP,
        _loginOrRegister = loginOrRegister,
        _cacheHelper = cacheHelper,
        super(const OtpState.initial()) {
    on<AuthVerifyOTP>(_verifyOTPEvent);
    on<AuthResendOTP>(_resendOTPEvent);
  }

  _verifyOTPEvent(event, emit) async {
    BuildContext context = event.context;

    String phone = event.phone;
    // TODO: implement event handler
    try {
      if (phone.length < 9) {
        context.go(LoginView.path);
        return;
      }

      emit(const OtpState.loading());
      final result = await _verifyOTP(
        VerifyOTPParams(phone: phone, otp: event.otp),
      );

      result.fold(
        //to save phone and not be lost from state
        (failure) {
          // if (failure.statusCode == 0) {}
          emit(OtpState.failed(failure.message));
          if (failure.message.contains(ErrorConst.OTP_FAILURE_TRIES_ERROR)) {
            context.pushReplacementNamed(
              FailedOTPThreeTimesView.name,
              queryParameters: {"phone": phone},
            );
          } else {
            CoreUtils.showMyDialog(
              title: ErrorConst.getErrorTitle(title: ErrorConst.otpErrorEn),
              subTitle: ErrorConst.getErrorBody(text: failure.message),
              buttonText: TextConstants.getText(text: TextConstants.closeEn),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Media.infoIcon,
            );
          }
        },
        (user) async {
          emit(const OtpState.success());

          await _cacheHelper.cacheSessionToken(user.apiToken);
          await _cacheHelper.cacheUserId(user.customer.id);
          await _cacheHelper.cacheUsername(user.customer.username);
          // await Future.delayed(Duration(seconds: 1));
          //0 means user is first time and didnt complete his data info
          if (user.customerStatus == 0) {
            router.push(UpdateUserInfoView.path);
          } else if (user.customerStatus == 1) {
            //used to not push until home loading is completed
            // SchedulerBinding.instance.addPostFrameCallback((_) {
            //   router.pushReplacementNamed(HomeView.name,
            //       queryParameters: {HomeView.param: "true"});
            // });
          } else {
            //called if user status is not 0 or 1.....
            CoreUtils.showMyDialog(
              title: ErrorConst.getErrorBody(text: ErrorConst.errorEn),
              subTitle: ErrorConst.getErrorBody(text: ErrorConst.UNKNOWN_ERROR),
              onPressed: () {
                Navigator.pop(context);
              },
              buttonText: TextConstants.getText(text: TextConstants.closeEn),
              icon: Media.infoIcon,
            );
          }
        },
      );
    } catch (e) {
      CoreUtils.showMyDialog(
        title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
        subTitle: ErrorConst.getErrorTitle(title: ErrorConst.UNKNOWN_ERROR),
        onPressed: () {
          Navigator.pop(context);
        },
        buttonText: TextConstants.getText(text: TextConstants.closeEn),
        icon: Media.infoIcon,
      );
    }
  }

  _resendOTPEvent(event, emit) async {
    // TODO: implement event handler
    BuildContext context = event.context;

    // TODO: implement event handler

    String phone = event.phone;
    try {
      if (phone.length < 9 || state == _loadingState) {
        phone = "";
        return;
      }

      emit(const OtpState.loading());
      // await Future.delayed(const Duration(seconds: 2));
      final result = await _loginOrRegister(
        LoginOrRegisterParams(phone: phone),
      );
      result.fold(
        (failure) {
          emit(OtpState.failed(failure.message));
          CoreUtils.showMyDialog(
            title: ErrorConst.getErrorTitle(title: ErrorConst.otpErrorEn),
            subTitle: ErrorConst.getErrorBody(text: failure.message),
            onPressed: () {
              Navigator.pop(context);
            },
            buttonText: TextConstants.getText(text: TextConstants.closeEn),
            icon: Media.infoIcon,
          );
        },
        (user) {
          emit(const OtpState.initial());

          context.pushReplacementNamed(
            VerifyOTPView.path,
            queryParameters: {"phone": event.phone},
          );
        },
      );
    } catch (e) {
      if (phone.length > 9)
        emit(OtpState.failed(
            ErrorConst.getErrorTitle(title: ErrorConst.errorEn)));
      CoreUtils.showMyDialog(
        title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
        subTitle: ErrorConst.getErrorBody(text: ErrorConst.errorOccuredEn),
        onPressed: () {
          Navigator.pop(context);
        },
        buttonText: TextConstants.getText(text: TextConstants.closeEn),
        icon: Media.infoIcon,
      );
    }
  }
}
