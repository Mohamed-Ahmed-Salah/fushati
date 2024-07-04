part of 'otp_bloc.dart';

@freezed
sealed class OtpEvent with _$OtpEvent {


  const factory OtpEvent.resendOTP({required BuildContext context, required String phone}) =
      AuthResendOTP;

  const factory OtpEvent.verifyOTP(
      {required String otp, required String phone , required BuildContext context}) = AuthVerifyOTP;

// const factory AuthenticatorEvent.keyboardTyping({required String number})=AuthKeyboardTyping;
}
