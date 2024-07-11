
import 'package:fushati/core/utils/enums/transaction_enum.dart';

class Transaction {
  final int id;
  final int userId;
  final int actionBy;
  final TransactionEnum type;
  final int waltype;
  final DateTime completedTime;
  final int amount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.actionBy,
    required this.type,
    required this.waltype,
    required this.completedTime,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    userId: json["user_id"],
    actionBy: json["action_by"],
    type: getTransactionType(json["type"]),
    waltype: json["waltype"],
    completedTime: DateTime.parse(json["completedTime"]),
    amount: json["amount"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  static TransactionEnum getTransactionType(String type) {
    switch (type.toLowerCase()) {
      case "recharge":
        return TransactionEnum.withdraw;
      case "withdrawal":
        return TransactionEnum.recharge;

    }
    return TransactionEnum.undefined;
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "action_by": actionBy,
    "type": type,
    "waltype": waltype,
    "completedTime": completedTime.toIso8601String(),
    "amount": amount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}