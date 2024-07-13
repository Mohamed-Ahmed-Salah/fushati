import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/common/app/cache_helper.dart';
import '../../../../../../core/utils/constants/error_consts.dart';
import '../../../../../../core/utils/core_utils.dart';
import '../../../../domain/usecases/auth_usecases.dart';
import '../../../views/verify_otp_view.dart';

part 'authenticator_bloc.freezed.dart';

part 'authenticator_event.dart';

part 'authenticator_state.dart';

class AuthenticatorBloc extends Bloc<AuthenticatorEvent, AuthenticatorState> {
  final LoginOrRegister _loginOrRegister;

  final CacheHelper _cacheHelper;

  AuthenticatorBloc(
      {required LoginOrRegister loginOrRegister,
      required CacheHelper cacheHelper})
      : _loginOrRegister = loginOrRegister,
        _cacheHelper = cacheHelper,
        super(const AuthenticatorState.initial()) {
    on<AuthLoginOrRegister>(_loginOrRegisterEvent);
    on<AuthResendOTP>(_resendOTPEvent);

  }

//todo add context or save phone in OTP
  _loginOrRegisterEvent(event, emit) async {
    // TODO: implement event handler
    BuildContext context = event.context;

    String phone = "${event.phone}";
    if (event.phone.length < 9) {
      return;
    }
    emit(const AuthenticatorState.loading());
    final result = await _loginOrRegister(
      LoginOrRegisterParams(phone: phone),
    );
    result.fold(
      (failure) {

        emit(AuthenticatorState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
        CoreUtils.showMyDialog(
            // message: ,
            title: ErrorConst.getErrorBody(text: ErrorConst.errorEn),
            subTitle: ErrorConst.getErrorBody(text: failure.message),
            onPressed: () {
              Navigator.pop(context);
            },
            );
      },
      (user) {
        emit(AuthenticatorState.loggedInSuccessfully(phone: phone));
        // getCartCount(Cache.instance.userId!);
        BuildContext context = event.context;
        context.pushNamed(
          VerifyOTPView.name,
          queryParameters: {"phone": phone},
        );
      },
    );
  }



  _resendOTPEvent(event, emit) async {
    // TODO: implement event handler
    BuildContext context = event.context;

    String phone = "${event.phone}";
    if (event.phone.length < 9) {
      return;
    }
    emit(const AuthenticatorState.loading());
    final result = await _loginOrRegister(
      LoginOrRegisterParams(phone: phone),
    );
    result.fold(
          (failure) {

        emit(AuthenticatorState.failed(
            ErrorConst.getErrorBody(text: failure.message)));
        CoreUtils.showMyDialog(
          // message: ,
            title: ErrorConst.getErrorBody(text: ErrorConst.errorEn),
            subTitle: ErrorConst.getErrorBody(text: failure.message),
            onPressed: () {
              Navigator.pop(context);
            },
           );
      },
          (user) {
        emit(AuthenticatorState.loggedInSuccessfully(phone: phone));
        // getCartCount(Cache.instance.userId!);
        // BuildContext context = event.context;
        // context.pushNamed(
        //   VerifyOTPView.name,
        //   queryParameters: {"phone": phone},
        // );
      },
    );
  }
}
