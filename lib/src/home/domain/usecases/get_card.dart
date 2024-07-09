import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetCardDetails extends UsecaseWithParams<CardEntity, String> {
  const GetCardDetails(this._repo);

  final CardRepo _repo;

  @override
  ResultFuture<CardEntity> call(String params) =>
      _repo.getCard(cardNumber: params);
}
