part of 'cards_bloc.dart';

@freezed
sealed class CardsState with _$CardsState {

  // const factory AuthenticatorState.readyToSubmit()=_readyToSubmit;
  const factory CardsState.loading() = _loadingState;

  const factory CardsState.emptyList() = _emptyListState;

  const factory CardsState.failed(String message) = _failedState;

  const factory CardsState.success({required List<CardEntity> cards}) = _success;
}

