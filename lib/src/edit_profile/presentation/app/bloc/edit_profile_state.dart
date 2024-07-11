part of 'edit_profile_bloc.dart';
@freezed
sealed class EditProfileState with _$EditProfileState {

  const factory EditProfileState.initial() = _initialState;

  const factory EditProfileState.loading() = _loadingState;

  const factory EditProfileState.failed(String message) = _failedState;

  const factory EditProfileState.success() = _successState;}

