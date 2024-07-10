part of 'delete_user_bloc.dart';
@freezed
sealed class DeleteUserState with _$DeleteUserState {
  const factory DeleteUserState.initial() = _initialState;

  const factory DeleteUserState.loading() = _loadingState;

  const factory DeleteUserState.failed(String message) = _failedState;

  const factory DeleteUserState.success() = _successState;
}

