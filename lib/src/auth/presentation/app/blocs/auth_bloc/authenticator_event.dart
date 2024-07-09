part of 'authenticator_bloc.dart';

@freezed
sealed class AuthenticatorEvent with _$AuthenticatorEvent {
  const factory AuthenticatorEvent.loginOrRegister(
      {required String phone,
      required BuildContext context}) = AuthLoginOrRegister;


  const factory AuthenticatorEvent.resendOTP({required BuildContext context, required String phone}) =
  AuthResendOTP;
// const factory AuthenticatorEvent.keyboardTyping({required String number})=AuthKeyboardTyping;
}
