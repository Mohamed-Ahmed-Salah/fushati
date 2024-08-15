import '../../../../core/utils/typedefs.dart';
import '../../data/models/transaction_model.dart';

abstract class TransactionsRepo {

  ResultFuture<List<Transaction>> getTransactions(
      {required int userId,
        required String userCard,
        required DateTime createdAt,
        required int page,

      });

  ResultFuture<List<Transaction>> getUserTransactions();
}
