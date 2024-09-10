part of 'app_redirection_bloc.dart';

@freezed
sealed class AppRedirectionState with _$AppRedirectionState {
  const factory AppRedirectionState.initial() = _initialState;
  const factory AppRedirectionState.loadedCache() = _loadedCacheState;
  const factory AppRedirectionState.done() = _doneState;

}




