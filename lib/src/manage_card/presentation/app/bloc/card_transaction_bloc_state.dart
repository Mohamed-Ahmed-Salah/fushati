part of 'card_transaction_bloc.dart';
@freezed

sealed class CardTransactionBlocState with _$CardTransactionBlocState {

  const factory CardTransactionBlocState.loading( {@Default([])
  List<Transaction> transactions}) = _loadingState;

  const factory CardTransactionBlocState.failed(String message) = _failedState;

  const factory CardTransactionBlocState.success({required List<Transaction> transactions,
    required bool hasMoreRecords
  }) = _successState;
}

