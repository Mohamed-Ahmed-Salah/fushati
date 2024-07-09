import 'dart:convert';

import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';
import '../repo/deposit_repo.dart';

class TransferAmount extends UsecaseWithParams<void, DepositToWalletParam> {
  const TransferAmount(this._repo);

  final DepositRepo _repo;

  @override
  ResultFuture<void> call(DepositToWalletParam params) => _repo.deposit(
      cardNumber: params.cardNumber,
      paymentId: params.paymentId,
      paymentStatus: params.paymentStatus,
      amount: params.amount,
      fee: params.fee,
      currency: params.currency,
      capturedAt: params.capturedAt,
      invoiceId: params.invoiceId,
      ip: params.ip);
}

class DepositToWalletParam {
  final String cardNumber;
  final String paymentId;
  final String paymentStatus;
  final int amount;
  final int fee;
  final String currency;
  final String capturedAt;
  final String invoiceId;
  final String ip;

  DepositToWalletParam({
    required this.cardNumber,
    required this.paymentId,
    required this.paymentStatus,
    required this.amount,
    required this.fee,
    required this.currency,
    required this.capturedAt,
    required this.invoiceId,
    required this.ip,
  });

  factory DepositToWalletParam.fromRawJson(String str) =>
      DepositToWalletParam.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepositToWalletParam.fromJson(Map<String, dynamic> json) =>
      DepositToWalletParam(
        paymentId: json["payment_id"],
        paymentStatus: json["payment_status"],
        amount: json["amount"],
        fee: json["fee"],
        currency: json["currency"],
        capturedAt: json["capturedAt"],
        invoiceId: json["invoiceId"],
        ip: json["ip"],
        cardNumber: '',
      );

  Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "payment_id": paymentId,
        "payment_status": paymentStatus,
        "amount": amount,
        "fee": fee,
        "currency": currency,
        "capturedAt": capturedAt,
        "invoiceId": invoiceId,
        "ip": ip,
      };
}
