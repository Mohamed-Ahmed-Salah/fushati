import '../../../../core/utils/typedefs.dart';

abstract class DepositRepo {
  ResultFuture<void> deposit(
      {required String cardNumber,
      required String paymentId,
      required int amount,
     });
}
