import 'package:dartz/dartz.dart';
import 'package:fushati/core/errors/exceptions.dart';
import 'package:fushati/core/errors/failures.dart';
import 'package:fushati/core/utils/typedefs.dart';
import 'package:fushati/src/splash/data/datasources/notification_fcm_remote_data_src.dart';
import 'package:fushati/src/splash/domain/repo/notifications_repo.dart';

class NotificationsRepoImpl implements NotificationsRepo {
  const NotificationsRepoImpl(this._remoteDataSource);

  final NotificationFcmRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<void> postFCM(String fcm) async {
    try {
      final result = await _remoteDataSource.postFCM(fcm);
      return const Right(null);
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
