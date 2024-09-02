// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fushati/src/home/domain/entity/transaction.dart';

class TransactionResponse {
  final int currentPage;
  final List<Transaction> transactions;
  final int lastPage;

  TransactionResponse({
    required this.currentPage,
    required this.transactions,
    required this.lastPage,
  });
}
