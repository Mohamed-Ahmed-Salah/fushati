import 'package:fushati/core/utils/enums/transaction_enum.dart';

class Transaction {
  final int amount;
  final String consumeTime;
  final String equipment;
  final String userNumber;
  final String userCard;
  final String userMoney;
  final String userPermoney;
  final String userPersubmoney;
  final TransactionEnum consumeType;
  final String ordernumber;

  Transaction({
    required this.amount,
    required this.consumeTime,
    required this.equipment,
    required this.userNumber,
    required this.userCard,
    required this.userMoney,
    required this.userPermoney,
    required this.userPersubmoney,
    required this.consumeType,
    required this.ordernumber,
  });

  static TransactionEnum getTransactionType(String type) {
    switch (type.toLowerCase()) {
      case "recharge":
        return TransactionEnum.recharge;
      case "微信充值":
        return TransactionEnum.recharge;
      case "withdrawal":
        return TransactionEnum.withdraw;
      case "normal consumption":
        return TransactionEnum.withdraw;
      case "加款机":
        return TransactionEnum.withdraw;
    }
    return TransactionEnum.undefined;
  }

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        amount: json["amount"],
        consumeTime: json["consumeTime"],
        equipment: json["equipment"],
        userNumber: json["user_number"],
        userCard: json["user_card"],
        userMoney: json["user_money"],
        userPermoney: json["user_permoney"],
        userPersubmoney: json["user_persubmoney"],
        consumeType: getTransactionType(json["consumeType"]),
        ordernumber: json["ordernumber"],
      );
}
