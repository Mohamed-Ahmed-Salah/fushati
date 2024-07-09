import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    super.name,
    super.email,
    super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
    required super.userPhone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userPhone: json["user_phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_phone": userPhone,
      };
}
