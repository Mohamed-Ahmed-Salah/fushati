part of 'transfer_money_bloc.dart';

@freezed
sealed class TransferMoneyState with _$TransferMoneyState {
  const factory TransferMoneyState.loading({@Default(0) int amount}) = _loadingState;
  const factory TransferMoneyState.failed(String error) = _failedState;
  const factory TransferMoneyState.successState() = _suceessState;


}


