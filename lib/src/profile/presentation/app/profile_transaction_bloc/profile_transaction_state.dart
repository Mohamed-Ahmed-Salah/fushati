part of 'profile_transaction_bloc.dart';

@freezed
sealed class ProfileTransactionState with _$ProfileTransactionState {
  const factory ProfileTransactionState.initial() = _initialState;

  const factory ProfileTransactionState.loading(
      {required List<Transaction> transactions,
      required int currentPage,
      required int maxPage}) = _loadingState;

  const factory ProfileTransactionState.failed(
      {required String message,
      required List<Transaction> transactions,
      required int currentPage,
      required int maxPage}) = _failedState;

  const factory ProfileTransactionState.success(
      {required List<Transaction> transactions,
      required int currentPage,
      required int maxPage}) = _successState;
}
