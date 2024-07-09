part of 'transfer_money_bloc.dart';

@freezed
sealed class TransferMoneyEvent with _$TransferMoneyEvent {
  const factory TransferMoneyEvent.addWallet({required int amount}) =
      AddWalletEvent;

  const factory TransferMoneyEvent.addingAmount({required dynamic result,required BuildContext context, required String cardNumber}) =
  AddingAmountEvent;
}
