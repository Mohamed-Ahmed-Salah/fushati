enum TransactionEnum {
  recharge('Recharge'),
  withdraw('Withdrawal'),
  registrationFees('registration_fees'),
  undefined('');

  const TransactionEnum(this.state);

  final String state;
}
