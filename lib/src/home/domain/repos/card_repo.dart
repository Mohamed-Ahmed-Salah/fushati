import 'package:fushati/src/home/domain/entity/home_response.dart';

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

  ResultFuture<void> addCardByNumber({
    required String cardNumber,
  });
  ResultFuture<HomeResponse> getCards(int page);
}
