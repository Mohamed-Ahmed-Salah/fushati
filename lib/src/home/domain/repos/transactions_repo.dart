import 'package:fushati/src/home/domain/entity/transactions_response.dart';

import '../../../../core/utils/typedefs.dart';

abstract class TransactionsRepo {

  ResultFuture<TransactionResponse> getTransactions(
      {required int userId,
        required String userCard,
        required int page,

      });

  ResultFuture<TransactionResponse> getUserTransactions(int page);
}
