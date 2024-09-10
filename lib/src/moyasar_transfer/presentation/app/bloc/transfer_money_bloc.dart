import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:moyasar/moyasar.dart';

import '../../../../../core/common/widgets/loading_alert_widget.dart';
import '../../../../../core/utils/constants/error_consts.dart';
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

  _addingAmountEvent(event, emit) async {
    final BuildContext context = event.context;
    final String cardNumber = event.cardNumber;
    final int amount = event.amount;
    final moyasarResult = event.result;

    if (moyasarResult is PaymentResponse) {

      ///made this because the backage The smallest currency unit.
      ///For example, to charge SAR 257.58 you will have the amount as 25758.
      ///In other words, 10 SAR = 10 * 100 Halalas.

      String paymentId = moyasarResult.id;
      String status = getPaymentStatus(moyasarResult.status);

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return const AlertLoadingWidget();
        },
      );
      final result = await _depositWallet(DepositToCardParam(
          paymentId: paymentId, amount: amount, cardNumber: cardNumber));

      Navigator.pop(context);

      bool success = false;
      String message = ErrorConst.getErrorBody(text: ErrorConst.UNKNOWN_ERROR);
      result.fold(
        (failure) {
          message = ErrorConst.getErrorBody(text: failure.message);
          CoreUtils.showMyDialog(
            title: ErrorConst.getErrorTitle(
                title: ErrorConst.paymentFailedTitleEn),
            subTitle: message,
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
        (newAmount) {
          success = true;
        },
      );
      if (success) {
        emit(const TransferMoneyState.successState());
      } else {
        emit(TransferMoneyState.failed(message));
      }
    } else {
      CoreUtils.showMyDialog(
        title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
        subTitle: ErrorConst.getErrorBody(
            text: ErrorConst.couldNotConnectToMoyasarEn),
        onPressed: () {
          Navigator.pop(context);
        },
      );
    }

    // onPaymentResult(
    //     event.result, event.context, emit, event.cardNumber, event.amount);
  }

  void onPaymentResult(moyasarResult, BuildContext context, emit,
      String cardNumber, int amount) async {}

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
