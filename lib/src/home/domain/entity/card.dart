
class CardEntity {
  final int id;
  final String name;
  final String email;
  final DateTime emailVerifiedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String userNumber;
  final String userPhone;
  final String department;
  final String position;
  final String userCard;
  final String equipment;
  final String identityId;
  final String role;
  final String type;

  CardEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.userNumber,
    required this.userPhone,
    required this.department,
    required this.position,
    required this.userCard,
    required this.equipment,
    required this.identityId,
    required this.role,
    required this.type,
  });

}
