import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class AddCardByNumberUsecase extends UsecaseWithParams<void, String> {
  const AddCardByNumberUsecase(this._repo);

  final CardRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.addCardByNumber(
      cardNumber: params,
    );
}
