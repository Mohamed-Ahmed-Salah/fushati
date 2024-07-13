import 'package:fushati/src/home/domain/repos/card_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class DeleteCard extends UsecaseWithParams<void, int> {
  const DeleteCard(this._repo);

  final CardRepo _repo;

  @override
  ResultFuture<void> call(int params) =>
      _repo.deleteCard(id: params);
}
