part of 'user_info_bloc.dart';

@freezed
sealed class UserInfoState with _$UserInfoState {
  const factory UserInfoState.loading() = _loadingState;

  const factory UserInfoState.failed(String message) = _failedState;

  const factory UserInfoState.success({required User user}) = _successState;
}
