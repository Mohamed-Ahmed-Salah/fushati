part of 'card_transaction_bloc.dart';

@freezed
sealed class CardTransactionBlocEvent with _$CardTransactionBlocEvent {
  const factory CardTransactionBlocEvent.getCardTransaction({
    required String cardNumber,
  }) = GetCardTransactionEvent;

  const factory CardTransactionBlocEvent.resetCardTransaction() =
      ResetRecievedCardTransactionsEvent;
}
