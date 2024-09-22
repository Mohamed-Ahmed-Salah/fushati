import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/common/app/cache_helper.dart';
import '../../../../../../core/services/router.dart';
import '../../../../../../core/utils/constants/error_consts.dart';
import '../../../../../../core/utils/core_utils.dart';
import '../../../../../home/presentation/views/home_view.dart';
import '../../../../domain/usecases/auth_usecases.dart';
import '../../../views/login_view.dart';

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
          emit(OtpState.failed(failure.message));
          CoreUtils.showMyDialog(
            title: ErrorConst.getErrorTitle(title: ErrorConst.otpErrorEn),
              subTitle:  ErrorConst.getErrorBody(text: failure.message),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
        (response) async {
          emit(const OtpState.success());
          await _cacheHelper.cacheSessionToken(response.token);
          SchedulerBinding.instance.addPostFrameCallback((_) {
            router.go(HomeView.name, extra: true);
          });
        },
      );
    } catch (e) {
      CoreUtils.showMyDialog(
        title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
        subTitle: ErrorConst.getErrorTitle(title: ErrorConst.UNKNOWN_ERROR),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }
  }
}
