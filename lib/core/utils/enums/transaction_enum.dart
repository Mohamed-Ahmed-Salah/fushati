enum TransactionEnum {
  recharge('Recharge'),
  withdraw('Withdrawal'),
  undefined('');

  const TransactionEnum(this.state);

  final String state;
}
