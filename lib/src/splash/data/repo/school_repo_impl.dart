import 'package:dartz/dartz.dart';
import 'package:fushati/src/splash/data/datasources/schools_remote_data_src.dart';
import 'package:fushati/src/splash/domain/entities/school.dart';
import 'package:fushati/src/splash/domain/repo/schools_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';


class SchoolRepoImpl implements SchoolsRepo {
  const SchoolRepoImpl(this._remoteDataSource);

  final SchoolsRemoteDataSrc _remoteDataSource;


  @override
  ResultFuture<List<School>> getSchools() async {
    try {
      final result = await _remoteDataSource.getSchools();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure.fromException(e));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure.fromException(e));
    } on TimeOutException catch (e) {
      return Left(TimeOutFailure.fromException(e));
    } on CardNotFoundException catch (e) {
      return Left(CardNotFoundFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure.fromException(
          ServerException(message: e.toString(), statusCode: 1)));
    }
  }
}
