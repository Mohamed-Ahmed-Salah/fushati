

import 'package:fushati/src/home/domain/entity/home_response.dart';
import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetCards extends UsecaseWithParams<HomeResponse,int> {
  const GetCards(this._repo);

  final CardRepo _repo;

  @override
  ResultFuture<HomeResponse> call(int params) =>
      _repo.getCards(params);
}
