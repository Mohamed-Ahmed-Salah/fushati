import 'dart:convert';

import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repo/deposit_repo.dart';

class TransferAmount extends UsecaseWithParams<void, DepositToCardParam> {
  const TransferAmount(this._repo);

  final DepositRepo _repo;

  @override
  ResultFuture<void> call(DepositToCardParam params) => _repo.deposit(
      cardNumber: params.cardNumber,
      paymentId: params.paymentId,
      amount: params.amount,


  );
}

class DepositToCardParam {
  final String cardNumber;
  final String paymentId;
  final int amount;


  DepositToCardParam({
    required this.cardNumber,
    required this.paymentId,
    required this.amount,

  });

  factory DepositToCardParam.fromRawJson(String str) =>
      DepositToCardParam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepositToCardParam.fromJson(Map<String, dynamic> json) =>
      DepositToCardParam(
        paymentId: json["payment_id"],
        amount: json["amount"],

        cardNumber: '',
      );

  Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "payment_id": paymentId,
        "amount": amount,

      };
}
