import 'package:fushati/core/utils/typedefs.dart';

abstract class RegistrationFeesRepo {
  ResultFuture<double> getRegistrationFees();

}