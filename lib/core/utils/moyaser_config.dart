import 'package:moyasar/moyasar.dart';
import 'package:uuid/uuid.dart';

import 'constants/network_constants.dart';

abstract class MoyasarConfig {
  const MoyasarConfig();

  static PaymentConfig config(int amount, String card) {
    var uuid = const Uuid();

    return PaymentConfig(
      publishableApiKey: NetworkConstants.MoyasarAPIKey,
      amount: amount * 100,
      // SAR 257.58
      description:
          'Transfer #${uuid.v4()} - for Student CARD NUMBER: $card with AMOUNT $amount SAR',
      creditCard: CreditCardConfig(saveCard: false, manual: false),
      applePay: ApplePayConfig(merchantId: '', label: '', manual: false),
    );
  }
}
