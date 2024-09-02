part of 'card_transaction_bloc.dart';

@freezed
sealed class CardTransactionBlocState with _$CardTransactionBlocState {
  const factory CardTransactionBlocState.initial() = _initialState;

  const factory CardTransactionBlocState.loading({
    required List<Transaction> transactions,
    required int currentPage,
    required int maxPage,
  }) = _loadingState;

  const factory CardTransactionBlocState.failed({
    required String message,
    required List<Transaction> transactions,
    required int currentPage,
    required int maxPage,
  }) = _failedState;

  const factory CardTransactionBlocState.success({
    required List<Transaction> transactions,
    required int currentPage,
    required int maxPage,
  }) = _successState;
}
