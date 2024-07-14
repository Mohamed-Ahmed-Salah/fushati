part of 'delete_card_bloc.dart';

@freezed
sealed class DeleteCardState with _$DeleteCardState {
  const factory DeleteCardState.initial() = _initialState;

  const factory DeleteCardState.loading() = _loadingState;

  const factory DeleteCardState.failed(String message) = _failedState;

  const factory DeleteCardState.success() = _success;
}
