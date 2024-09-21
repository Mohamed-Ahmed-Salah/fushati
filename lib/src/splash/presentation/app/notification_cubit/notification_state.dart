part of 'notification_cubit.dart';
@freezed
sealed class NotificationState with _$NotificationState {
  const factory NotificationState.initial() = _initialState;
  const factory NotificationState.loading() = _loadingState;

  const factory NotificationState.failed({required String message}) = _failedState;

  const factory NotificationState.success() = _successState;
}

