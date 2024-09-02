import 'package:fushati/core/utils/enums/transaction_enum.dart';

class Transaction {
  final int id;
  final TransactionEnum consumeType;
  final double amount;
  final String orderId;
  final DateTime createdAt;
  final String? cardHolderName;
  final String? carNumber;

  Transaction({
    required this.orderId,
    required this.id,
    required this.consumeType,
    required this.amount,
    required this.createdAt,
    this.cardHolderName,
    this.carNumber,
  });

}
