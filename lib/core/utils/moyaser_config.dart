import 'package:moyasar/moyasar.dart';
import 'package:uuid/uuid.dart';

import 'constants/network_constants.dart';

abstract class MoyasarConfig {
  const MoyasarConfig();

  static PaymentConfig config(double amount, String card) {
    var uuid = const Uuid();

    return PaymentConfig(
      publishableApiKey: NetworkConstants.moyasarAPIKey,
      amount: (amount * 100).toInt(),
      metadata: {
        "card_number":card,
        "amount":"$amount",
        "uuid":uuid.v4(),
      },
      // SAR 257.58
      description:
          'Transfer #${uuid.v4()} - for Student CARD NUMBER: $card with AMOUNT $amount SAR',
      creditCard: CreditCardConfig(saveCard: false, manual: false),
      applePay: ApplePayConfig(merchantId: 'merchant.fushati.parents', label: 'Fushati - فسحتي', manual: false),
    );
  }
}
