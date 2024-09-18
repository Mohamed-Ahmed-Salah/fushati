part of 'profile_transaction_bloc.dart';
@freezed
sealed class ProfileTransactionEvent with _$ProfileTransactionEvent {
  const factory ProfileTransactionEvent.getUserTransactions({required bool isFromStart}) =
  GetUserTransactionsEvent;
}
