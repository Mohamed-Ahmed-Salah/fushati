
import 'package:fushati/core/utils/typedefs.dart';
import 'package:fushati/src/splash/domain/entities/min_version_response.dart';

abstract class MinAppVersionRepo {

  ResultFuture<MinVersionResponse> getAppVersion(String platform);

}
