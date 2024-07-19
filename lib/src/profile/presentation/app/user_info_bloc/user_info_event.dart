part of 'user_info_bloc.dart';

@freezed
sealed class UserInfoEvent with _$UserInfoEvent {
  const factory UserInfoEvent.getUserInfo() =
      GetUserInfoEvent;

  const factory UserInfoEvent.EditUserInfo({
    required String name,
     String? email,
    String? gender,


  }) = LocalUserInfoEvent;
}
