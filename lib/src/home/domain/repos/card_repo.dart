import '../../../../core/utils/typedefs.dart';
import '../entity/card.dart';

abstract class CardRepo {
  ResultFuture<CardEntity> getCard({
    required String cardNumber,
  });

  ResultFuture<void> deleteCard({
    required int id,
  });

  ResultFuture<void> addCard({
    required String name,
    required String email,
    required String phoneNumber,
    required String cardNumber,
    required String studentNumber,
  });

  ResultFuture<List<CardEntity>> getCards();
}
