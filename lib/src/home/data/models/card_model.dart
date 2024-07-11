import 'package:flutter/material.dart';

import '../../domain/entity/card.dart';

class CardModel extends CardEntity {
  CardModel({
    required super.id,
    required super.name,
    required super.email,
    super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.userNumber,
    required super.userPhone,
    super.department,
    super.position,
    required super.userCard,
    super.equipment,
    super.identityId,
    super.role,
    super.type,
    required super.balance,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"] == null
            ? null
            : DateTime.parse(json["email_verified_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userNumber: json["user_number"],
        userPhone: json["user_phone"],
        department: json["department"],
        position: json["position"],
        userCard: json["user_card"],
        equipment: json["equipment"],
        identityId: json["identity_id"],
        role: json["role"],
        type: json["type"],
        balance: json["balance"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt?.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_number": userNumber,
        "user_phone": userPhone,
        "department": department,
        "position": position,
        "user_card": userCard,
        "equipment": equipment,
        "identity_id": identityId,
        "role": role,
        "type": type,
      };
}
