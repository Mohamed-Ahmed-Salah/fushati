class User {
  final int id;
  final String? name;
  final String? email;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String userPhone;
  final String? gender;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    required this.userPhone,
    this.gender,
  });



  User copyWith({
    String? name,
    String? email,
    String? gender,
  }) {
    return User(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt,
      userPhone: userPhone,
      updatedAt: DateTime.now(),
      gender: gender ?? this.gender,
      createdAt: createdAt,
    );
  }
}
