import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    super.name,
    super.email,
    super.emailVerifiedAt,
    super.gender,
    required super.createdAt,
    required super.updatedAt,
    required super.userPhone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
    gender: json['gender'],

    userPhone: json["user_phone"],
      );

}
