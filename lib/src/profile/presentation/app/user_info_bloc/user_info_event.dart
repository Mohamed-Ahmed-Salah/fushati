part of 'user_info_bloc.dart';

@freezed
sealed class UserInfoEvent with _$UserInfoEvent {
  const factory UserInfoEvent.getUserInfo({required BuildContext context}) =
      GetUserInfoEvent;

  const factory UserInfoEvent.EditUserInfo({
    required String name,
    required String email,
    required String workplace,
    required String birthday,

    required int workPlaceId,
    required String gender,
  }) = LocalUserInfoEvent;
}
