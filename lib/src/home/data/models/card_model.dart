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
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        name: json["name"],
        email: json["email"] ?? "",
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        userNumber: json["user_number"] ?? "",
        userPhone: json["user_phone"] ?? "",
        userCard: json["user_card"],
        balance: json["balance"],
      );
}
