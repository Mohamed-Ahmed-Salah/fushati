import 'package:fushati/core/utils/enums/transaction_enum.dart';

class Transaction {
  final int id;
  final int userId;
  final TransactionEnum type;
  final DateTime completedTime;
  final double amount;
  final DateTime createdAt;
  final DateTime updatedAt;

  Transaction({
    required this.id,
    required this.userId,
    required this.type,
    required this.completedTime,
    required this.amount,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      userId: json["user_id"],
      type: getTransactionType(json["type"]),
      completedTime: DateTime.parse(json["completedTime"]),
      amount: double.parse(json["amount"].toString()),
      createdAt: DateTime.parse(json["created_at"]),
      updatedAt: DateTime.parse(json["updated_at"]),
    );
  }

  static TransactionEnum getTransactionType(String type) {
    switch (type.toLowerCase()) {
      case "recharge":
        return TransactionEnum.recharge;
      case "withdrawal":
        return TransactionEnum.withdraw;
    }
    return TransactionEnum.undefined;
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "type": type,
        "completedTime": completedTime.toIso8601String(),
        "amount": amount,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
