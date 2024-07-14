part of 'profile_transaction_bloc.dart';
@freezed

sealed class ProfileTransactionState with _$ProfileTransactionState {

  const factory ProfileTransactionState.loading() = _loadingState;

  const factory ProfileTransactionState.failed(String message) = _failedState;

  const factory ProfileTransactionState.success({required List<Transaction> transactions}) = _successState;
}


