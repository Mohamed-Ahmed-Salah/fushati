class User {
  final int id;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String userPhone;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    required this.userPhone,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        userPhone: json["user_phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "user_phone": userPhone,
      };

  User copyWith({
    String? name,
    String? email,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt,
      userPhone: userPhone,
      updatedAt: DateTime.now(),
      createdAt: createdAt,
    );
  }
}
