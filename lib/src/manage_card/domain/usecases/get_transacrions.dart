import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:fushati/src/home/domain/entity/transaction.dart';
import 'package:fushati/src/home/domain/repos/transactions_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetCardTransactions
    extends UsecaseWithParams<List<Transaction>, TransactionParam> {
  const GetCardTransactions(this._repo);

  final TransactionsRepo _repo;

  @override
  ResultFuture<List<Transaction>> call(TransactionParam params) =>
      _repo.getTransactions(
          userId: params.userId,
          userCard: params.userCard,
          createdAt: params.createdAt,
          page: params.page);
}

class TransactionParam {
  final int userId;
  final int page;
  final String userCard;
  final DateTime createdAt;

  TransactionParam(
      {required this.userId,
      required this.page,
      required this.userCard,
      required this.createdAt});
}
