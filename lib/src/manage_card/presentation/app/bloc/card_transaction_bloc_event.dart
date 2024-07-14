part of 'card_transaction_bloc.dart';

@freezed
sealed class CardTransactionBlocEvent with _$CardTransactionBlocEvent {
  const factory CardTransactionBlocEvent.getCardTransaction({
    required int id,
    required String cardNumber,
    required DateTime createdAt,
  }) = GetCardTransactionEvent;
}
