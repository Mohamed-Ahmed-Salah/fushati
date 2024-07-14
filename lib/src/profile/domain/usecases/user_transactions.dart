import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/home/domain/repos/card_repo.dart';
import 'package:fushati/src/home/domain/repos/transactions_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetUserTransactions extends UsecaseWithoutParams<List<Transaction>> {
  const GetUserTransactions(this._repo);

  final TransactionsRepo _repo;

  @override
  ResultFuture<List<Transaction>> call() =>
      _repo.getUserTransactions();
}
