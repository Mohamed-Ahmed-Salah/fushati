import 'package:dartz/dartz.dart';
import 'package:fushati/core/errors/exceptions.dart';
import 'package:fushati/core/errors/failures.dart';
import 'package:fushati/core/utils/typedefs.dart';
import 'package:fushati/src/splash/data/datasources/app_version_remote_data_src.dart';
import 'package:fushati/src/splash/domain/entities/min_version_response.dart';
import 'package:fushati/src/splash/domain/repo/min_app_version_repo.dart';

class MinAppVersionRepoImpl implements MinAppVersionRepo {
  const MinAppVersionRepoImpl(this._remoteDataSource);

  final AppVersionRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<MinVersionResponse> getAppVersion(String platform) async {
    try {
      final result = await _remoteDataSource.getAppVersion(platform);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure.fromException(e));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure.fromException(e));
    } on TimeOutException catch (e) {
      return Left(TimeOutFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure.fromException(
          ServerException(message: e.toString(), statusCode: 1)));
    }
  }
}
