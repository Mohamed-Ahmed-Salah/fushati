import 'package:fushati/src/moyasar_transfer/domain/entity/transaction_response.dart';

import '../../../../core/utils/typedefs.dart';

abstract class DepositRepo {
  ResultFuture<TransactionResponse> deposit(
      {required String cardNumber,
      required String paymentId,
      required int amount,
     });
}
