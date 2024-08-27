import 'package:dartz/dartz.dart';
import 'package:fushati/src/home/data/datasources/registration_fees_remote_data_src.dart';
import 'package:fushati/src/home/domain/repos/registration_fees_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entity/card.dart';
import '../../domain/repos/card_repo.dart';
import '../datasources/cards_remote_data_src.dart';

class RegistrationFeesRepoImpl implements RegistrationFeesRepo {
  const RegistrationFeesRepoImpl(this._remoteDataSource);

  final RegistrationFeesRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<double> getRegistrationFees() async {
    try {
      final result = await _remoteDataSource.getRegistrationFees();
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
