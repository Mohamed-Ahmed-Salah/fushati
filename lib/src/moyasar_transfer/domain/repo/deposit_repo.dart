import '../../../../core/utils/typedefs.dart';

abstract class DepositRepo {
  ResultFuture<void> deposit(
      {required String cardNumber,
      required String paymentId,
      required String paymentStatus,
      required int amount,
      required int fee,
      required String currency,
      required String capturedAt,
      required String invoiceId,
      required String ip});
}
