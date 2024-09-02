part of 'cards_bloc.dart';

@freezed
sealed class CardsState with _$CardsState {
  const factory CardsState.initial() = initialState;

  const factory CardsState.loading({
    required List<CardEntity> cards,
    required int currentPage,
    required int maxPage,
  }) = loadingState;

  const factory CardsState.emptyList() = _emptyListState;

  const factory CardsState.failed({
    required String message,
    required List<CardEntity> cards,
    required int currentPage,
    required int maxPage,
  }) = _failedState;

  const factory CardsState.success(
      {required List<CardEntity> cards,
      required int currentPage,
      required int maxPage}) = _success;
}
