import 'package:fushati/src/moyasar_transfer/domain/entity/transaction_response.dart';

class TransactionResponseModel extends TransactionResponse {


  TransactionResponseModel({
    required super.fee,
    required super.amount,
  });

  factory TransactionResponseModel.fromJson(Map<String, dynamic> json) => TransactionResponseModel(
    fee: json["fee"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "fee": fee,
    "amount": amount,
  };
}
