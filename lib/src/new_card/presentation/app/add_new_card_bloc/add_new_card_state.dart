part of 'add_new_card_bloc.dart';

@freezed
sealed class AddNewCardState with _$AddNewCardState {
  const factory AddNewCardState.loading() = _loadingState;

  const factory AddNewCardState.failed(String message) = _failedState;

  const factory AddNewCardState.success() = _success;
}
