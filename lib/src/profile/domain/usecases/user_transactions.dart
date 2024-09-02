import 'package:fushati/src/home/domain/entity/transactions_response.dart';
import 'package:fushati/src/home/domain/repos/transactions_repo.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedefs.dart';

class GetUserTransactions extends UsecaseWithParams<TransactionResponse,int> {
  const GetUserTransactions(this._repo);

  final TransactionsRepo _repo;

  @override
  ResultFuture<TransactionResponse> call(int params) =>
      _repo.getUserTransactions(params);
}
