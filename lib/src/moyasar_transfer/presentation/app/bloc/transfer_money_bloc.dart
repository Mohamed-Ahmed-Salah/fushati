import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moyasar/moyasar.dart';

import '../../../../../core/common/widgets/loading_alert_widget.dart';
import '../../../../../core/utils/constants/error_consts.dart';
import '../../../../../core/utils/constants/text_constants.dart';
import '../../../../../core/utils/core_utils.dart';
import '../../../domain/usecases/transfer_to_card.dart';

part 'transfer_money_event.dart';

part 'transfer_money_state.dart';

part 'transfer_money_bloc.freezed.dart';

class TransferMoneyBloc extends Bloc<TransferMoneyEvent, TransferMoneyState> {
  final TransferAmount _depositWallet;

  TransferMoneyBloc({required TransferAmount depositWallet})
      : _depositWallet = depositWallet,
        super(const TransferMoneyState.loading()) {
    // on<AddWalletEvent>(_addToWalletEvent);
    on<AddingAmountEvent>(_addingAmountEvent);
  }

  // _addToWalletEvent(event, emit) {
  //   // TODO: implement event handler
  // }

  _addingAmountEvent(event, emit) {
    onPaymentResult(event.result, event.context, emit,event.cardNumber);
    // emit(TransferMoneyState.initial(amount: event.amount));
    // TODO: implement event handler
  }

  void onPaymentResult(moyasarResult, BuildContext context, emit, String cardNumber) async {
    if (moyasarResult is PaymentResponse) {
      // emit(TransferMoneyState.loading());

      String status = await getPaymentStatus(moyasarResult.status);
      String refunded = await moyasarResult.refunded.toString();
      int fee = await moyasarResult.fee;
      int amount = await moyasarResult.amount ~/ 100;

      ///made this because the backage The smallest currency unit.
      ///For example, to charge SAR 257.58 you will have the amount as 25758.
      ///In other words, 10 SAR = 10 * 100 Halalas.

      String paymentId = await moyasarResult.id;
      String currency = await moyasarResult.currency;
      String capturedAt = await moyasarResult.createdAt;
      String ip = moyasarResult.ip = "empty";
      String invoiceId = await moyasarResult.invoiceId ?? "empty";

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertLoadingWidget();
        },
      );
      final result = await _depositWallet(DepositToWalletParam(
          paymentId: paymentId,
          paymentStatus: status,
          amount: amount,
          fee: fee,
          currency: currency,
          capturedAt: capturedAt,
          invoiceId: invoiceId,
          ip: ip, cardNumber: cardNumber));

      Navigator.pop(context);

      result.fold(
        (failure) {
          CoreUtils.showMyDialog(
            title:
                ErrorConst.getErrorTitle(title: ErrorConst.couldNotSubscribeEn),
            subTitle: failure.message,
            //ErrorConst.getErrorBody(text: failure.message)
            onPressed: () {
              Navigator.pop(context);
            },
            buttonText: TextConstants.getText(text: TextConstants.closeEn),
            icon: CupertinoIcons.clear_circled_solid,
          );
        },
        (newAmount) {
          Navigator.pop(context);

          //todo
          // CoreUtils.showMyDialog(
          //   title: TextConstants.getText(text: TextConstants.successPaymentEn),
          //   subTitle: TextConstants.getText(
          //       text: TextConstants.thanksForPatronizingUsEn),
          //   onPressed: () {
          //     Navigator.pop(rootNavigatorKey.currentState?.context ?? context);
          //   },
          //   state: StateEnum.success,
          //   buttonText: TextConstants.getText(text: TextConstants.closeEn),
          //   icon: Icons.check_circle_rounded,
          // );
          // context
          //     .read<WalletBalanceBloc>()
          //     .add(WalletEvent.addNewBalanceWallet(newBalance: newAmount));
          // context.read<WalletHistoryBloc>().add(
          //     WalletHistoryEvent.addSingleTransaction(
          //         walletSingleTransaction: WalletTransactionHistory(
          //             id: 0,
          //             processType: "DEPOSITE",
          //             amount: amount.toString(),
          //             date: DateTime.now())));
          // emit(TransferMoneyState.successState());
        },
      );
    } else {
      CoreUtils.showMyDialog(
        title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
        subTitle: ErrorConst.getErrorBody(
            text: ErrorConst.couldNotConnectToMoyasarEn),
        onPressed: () {
          Navigator.pop(context);
        },
        buttonText: TextConstants.getText(text: TextConstants.closeEn),
        icon: CupertinoIcons.clear_circled_solid,
      );
    }
  }

  String getPaymentStatus(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.paid:
        // handle success.
        return "Success";

      case PaymentStatus.failed:
        return "Failed";

      case PaymentStatus.initiated:
        return "initiated";

      // TODO: Handle this case.
      case PaymentStatus.authorized:
        return "authorized";

      // TODO: Handle this case.

      case PaymentStatus.captured:
        return "captured";

      // TODO: Handle this case.
    }
  }
}
