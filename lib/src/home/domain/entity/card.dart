

class CardEntity {
  final int id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String userNumber;
  final String userPhone;
  final String userCard;
  final String balance;
  final bool isNewCard;


  CardEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
    required this.userNumber,
    required this.userPhone,
    required this.isNewCard,

    required this.userCard,

  });

}
