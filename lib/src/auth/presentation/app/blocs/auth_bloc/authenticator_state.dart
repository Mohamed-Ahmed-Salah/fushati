part of 'authenticator_bloc.dart';

@freezed
sealed class AuthenticatorState with _$AuthenticatorState {
  const factory AuthenticatorState.initial() = _initialState;

  // const factory AuthenticatorState.readyToSubmit()=_readyToSubmit;
  const factory AuthenticatorState.loading() = _loadingState;

  const factory AuthenticatorState.failed(String message) = _failedState;

  const factory AuthenticatorState.loggedInSuccessfully(
      {required String phone}) = _loginSuccessState;

  const factory AuthenticatorState.otpVerifiedSuccessfully() = _otpSuccessState;
}
