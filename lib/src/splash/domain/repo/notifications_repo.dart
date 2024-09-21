
import 'package:fushati/core/utils/typedefs.dart';

abstract class NotificationsRepo {

  ResultFuture<void> postFCM(String FCMToken);

}
