import '../../domain/entity/card.dart';


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
    required super.isNewCard,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        name: json["name"],
        email: json["email"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
        userNumber: json["user_number"] ?? "",
        userPhone: json["user_phone"] ?? "",
        isNewCard: json["new_user"],
        userCard: json["user_card"]??"AAAAAAAAAA",
        balance: (json["balance"]??0).toString(),
      );
}
