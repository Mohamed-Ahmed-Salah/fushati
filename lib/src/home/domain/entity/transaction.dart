import 'package:fushati/core/utils/enums/transaction_enum.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Transaction {
  final int id;
  final TransactionEnum consumeType;
  final double amount;
  final String orderId;
  final DateTime createdAt;
  final String? cardHolderName;
  final String? carNumber;

  Transaction({
    required this.orderId,
    required this.id,
    required this.consumeType,
    required this.amount,
    required this.createdAt,
    this.cardHolderName,
    this.carNumber,
  });

//
// factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
//   amount: json["amount"],
//   consumeTime: getTimeFormatted(json["consumeTime"]),
//   equipment: json["equipment"],
//   userNumber: json["user_number"],
//   userCard: json["user_card"],
//   userMoney: json["user_money"],
//   userPermoney: json["user_permoney"],
//   userPersubmoney: json["user_persubmoney"],
//   consumeType: getTransactionType(json["consumeType"]),
//   ordernumber: json["ordernumber"],
// );
//
// static String getTimeFormatted(String time){
//   print("report $time");
//   // Step 1: Parse the input date string
//   DateTime parsedDateTime = DateFormat("yyyy/MM/dd HH:mm:ss").parse(time, true);
//
//   // Step 2: Convert the parsed DateTime to UTC
//   DateTime utcDateTime = parsedDateTime.toUtc();
//
//   return convertToKsaTimezone(utcDateTime);
// }
//
// static String convertToKsaTimezone(DateTime datetime) {
//   print("DATE ${datetime}");
//   // Define the source timezone (Asian Chinese)
//   final tz.Location asiaShanghai = tz.getLocation('Asia/Shanghai');
//
//   // Define the target timezone (KSA)
//   final tz.Location ksaLocation = tz.getLocation('Asia/Riyadh');
//
//   // Convert the UTC DateTime to the Asian Chinese timezone
//   final tz.TZDateTime shanghaiTime = tz.TZDateTime.from(datetime, asiaShanghai);
//   print("shanghaiTime $shanghaiTime");
//
//   // Convert the time to KSA timezone
//   final tz.TZDateTime ksaTime = tz.TZDateTime.from(shanghaiTime, ksaLocation);
//
//   print("ksa $ksaTime");
//   // Format the time
//   // final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
//   // return formatter.format(ksaTime);
//   return ksaTime.toString();
// }
}
