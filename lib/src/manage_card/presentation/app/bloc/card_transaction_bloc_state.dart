part of 'card_transaction_bloc.dart';
@freezed

sealed class CardTransactionBlocState with _$CardTransactionBlocState {

  const factory CardTransactionBlocState.loading() = _loadingState;

  const factory CardTransactionBlocState.failed(String message) = _failedState;

  const factory CardTransactionBlocState.success({required List<Transaction> transactions}) = _successState;
}

