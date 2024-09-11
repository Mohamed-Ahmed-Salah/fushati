// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fushati/core/utils/enums/transaction_enum.dart';
import 'package:fushati/src/home/domain/entity/transaction.dart';

class TransactionModel extends Transaction {
  TransactionModel({
    required super.id,
    required super.consumeType,
    required super.amount,
    required super.createdAt,
    required super.orderId,
    super.cardHolderName,
    super.carNumber,
  });

  static TransactionEnum getTransactionType(String type) {
    switch (type.toLowerCase()) {
      case "recharge":
        return TransactionEnum.recharge;
      case "微信充值":
        return TransactionEnum.recharge;
      case "withdrawal":
        return TransactionEnum.withdraw;
      case "deduction":
        return TransactionEnum.withdraw;
      case "normal consumption":
        return TransactionEnum.withdraw;
      case "加款机":
        return TransactionEnum.withdraw;
      case "registration_fees":
        return TransactionEnum.registrationFees;
    }
    return TransactionEnum.undefined;
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json["id"],
        consumeType: getTransactionType(json["type"]),
        amount: double.parse(json["amount"].toString()),
        createdAt: DateTime.parse(json["completedTime"]),
        orderId: json["order_id"] ?? "",
        cardHolderName: json["user"]["name"] ?? "",
        carNumber: json["user"]["user_card"] ?? "",
      );
}
