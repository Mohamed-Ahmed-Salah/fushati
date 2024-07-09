

import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetCards extends UsecaseWithoutParams<List<CardEntity>> {
  const GetCards(this._repo);

  final CardRepo _repo;

  @override
  ResultFuture<List<CardEntity>> call() =>
      _repo.getCards();
}
