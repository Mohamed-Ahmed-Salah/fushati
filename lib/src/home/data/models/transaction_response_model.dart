// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:fushati/src/home/domain/entity/transaction.dart';
import 'package:fushati/src/home/domain/entity/transactions_response.dart';

class TransactionResponseModel extends TransactionResponse{


  TransactionResponseModel({
    required super.currentPage,
    required super.transactions,
    required super.lastPage,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) =>
      TransactionResponseModel(
        currentPage: json["current_page"],
        transactions: List<Transaction>.from(
            json["data"].map((x) => TransactionModel.fromJson(x))),
        lastPage: json["last_page"],
      );
}
