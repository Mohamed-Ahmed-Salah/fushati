import 'package:fushati/src/home/domain/entity/transactions_response.dart';
import 'package:fushati/src/home/domain/repos/transactions_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetCardTransactions
    extends UsecaseWithParams<TransactionResponse, TransactionParam> {
  const GetCardTransactions(this._repo);

  final TransactionsRepo _repo;

  @override
  ResultFuture<TransactionResponse> call(TransactionParam params) =>
      _repo.getTransactions(
          userId: params.userId,
          userCard: params.userCard,
          page: params.page);
}

class TransactionParam {
  final int userId;
  final int page;
  final String userCard;

  TransactionParam(
      {required this.userId,
      required this.page,
      required this.userCard,
      });
}
