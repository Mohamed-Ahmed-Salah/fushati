import 'package:fushati/core/utils/enums/transaction_enum.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
class Transaction {
  final int amount;
  final String consumeTime;
  final String equipment;
  final String userNumber;
  final String userCard;
  final String userMoney;
  final String userPermoney;
  final String userPersubmoney;
  final TransactionEnum consumeType;
  final String ordernumber;

  Transaction({
    required this.amount,
    required this.consumeTime,
    required this.equipment,
    required this.userNumber,
    required this.userCard,
    required this.userMoney,
    required this.userPermoney,
    required this.userPersubmoney,
    required this.consumeType,
    required this.ordernumber,
  });

  static TransactionEnum getTransactionType(String type) {
    switch (type.toLowerCase()) {
      case "recharge":
        return TransactionEnum.recharge;
      case "微信充值":
        return TransactionEnum.recharge;
      case "withdrawal":
        return TransactionEnum.withdraw;
      case "normal consumption":
        return TransactionEnum.withdraw;
      case "加款机":
        return TransactionEnum.withdraw;
    }
    return TransactionEnum.undefined;
  }

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        amount: json["amount"],
        consumeTime: getTimeFormatted(json["consumeTime"]),
        equipment: json["equipment"],
        userNumber: json["user_number"],
        userCard: json["user_card"],
        userMoney: json["user_money"],
        userPermoney: json["user_permoney"],
        userPersubmoney: json["user_persubmoney"],
        consumeType: getTransactionType(json["consumeType"]),
        ordernumber: json["ordernumber"],
      );

  static String getTimeFormatted(String time){
    print("report $time");
    // Step 1: Parse the input date string
    DateTime parsedDateTime = DateFormat("yyyy/MM/dd HH:mm:ss").parse(time, true);

    // Step 2: Convert the parsed DateTime to UTC
    DateTime utcDateTime = parsedDateTime.toUtc();

    return convertToKsaTimezone(utcDateTime);
  }

  static String convertToKsaTimezone(DateTime datetime) {
    print("DATE ${datetime}");
    // Define the source timezone (Asian Chinese)
    final tz.Location asiaShanghai = tz.getLocation('Asia/Shanghai');

    // Define the target timezone (KSA)
    final tz.Location ksaLocation = tz.getLocation('Asia/Riyadh');

    // Convert the UTC DateTime to the Asian Chinese timezone
    final tz.TZDateTime shanghaiTime = tz.TZDateTime.from(datetime, asiaShanghai);
    print("shanghaiTime $shanghaiTime");

    // Convert the time to KSA timezone
    final tz.TZDateTime ksaTime = tz.TZDateTime.from(shanghaiTime, ksaLocation);

    print("ksa $ksaTime");
    // Format the time
    // final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    // return formatter.format(ksaTime);
    return ksaTime.toString();
  }
}
