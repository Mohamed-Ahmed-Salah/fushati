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
    required String cardNumber,
  });

  ResultFuture<List<CardEntity>> getCards();
}
