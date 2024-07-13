
import '../../domain/entity/card.dart';
import "transaction_model.dart";

class CardModel extends CardEntity {
  CardModel({
    required super.id,
    required super.name,
    required super.email,
    required super.createdAt,
    required super.updatedAt,
    required super.userNumber,
    required super.userPhone,
    required super.userCard,
    required super.balance,
    required super.transactions,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userNumber: json["user_number"],
        userPhone: json["user_phone"],
        userCard: json["user_card"],
        balance: json["balance"],
        transactions: json["transactions"] != null
            ? List<Transaction>.from(
                json["transactions"].map((x) => Transaction.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_number": userNumber,
        "user_phone": userPhone,
        "user_card": userCard,
      };
}
