
import 'package:fushati/core/usecase/usecase.dart';
import 'package:fushati/core/utils/typedefs.dart';
import 'package:fushati/src/splash/domain/entities/min_version_response.dart';
import 'package:fushati/src/splash/domain/repo/min_app_version_repo.dart';

class GetMinAppVersion extends UsecaseWithParams<MinVersionResponse, String> {
  const GetMinAppVersion(this._repo);

  final MinAppVersionRepo _repo;

  @override
  ResultFuture<MinVersionResponse> call(String params) => _repo.getAppVersion(params);
}
