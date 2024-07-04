part of 'customer_info_bloc.dart';

@freezed
sealed class CustomerInfoEvent with _$CustomerInfoEvent {


  const factory CustomerInfoEvent.updateUserInfo({
    required String email,
    required BuildContext context,
    required String name,
    required String birthdate,
    required int workAtId,
    required int gender,
  }) = AuthAddUserInfo;
// const factory AuthenticatorEvent.keyboardTyping({required String number})=AuthKeyboardTyping;
}
