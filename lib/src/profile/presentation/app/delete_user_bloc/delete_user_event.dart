part of 'delete_user_bloc.dart';

@freezed
sealed class DeleteUserEvent with _$DeleteUserEvent {
  const factory DeleteUserEvent.deleteUser({required BuildContext context,
    required int id
  }) =
      DeleteUserInfoEvent;
}
