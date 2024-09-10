part of 'app_min_version_bloc.dart';

@freezed
sealed class AppMinVersionState with _$AppMinVersionState {

  const factory AppMinVersionState.loading() = _loadingState;

  const factory AppMinVersionState.failed(String message) = _failedState;

  const factory AppMinVersionState.successShouldUpdate({required MinVersionResponse response}) = _successShouldUpdateState;
  const factory AppMinVersionState.successNoUpdate() = _successNoUpdateState;

}
