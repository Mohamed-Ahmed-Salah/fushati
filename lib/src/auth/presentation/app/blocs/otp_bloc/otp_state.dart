part of 'otp_bloc.dart';

@freezed
sealed class OtpState with _$OtpState {
  const factory OtpState.initial() = _initialState;

  // const factory AuthenticatorState.readyToSubmit()=_readyToSubmit;
  const factory OtpState.loading() = _loadingState;

  const factory OtpState.failed(String message) = _failedState;

  const factory OtpState.success() = _success;

}
