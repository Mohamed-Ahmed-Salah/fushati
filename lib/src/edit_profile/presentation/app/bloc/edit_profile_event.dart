part of 'edit_profile_bloc.dart';

@freezed
sealed class EditProfileEvent with _$EditProfileEvent {
  const factory EditProfileEvent.editUserProfile({
    required BuildContext context,
    required String name,
    required String email,
  }) = EditUserAccountProfileEvent;
}
