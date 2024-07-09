import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';

import '../../domain/repo/deposit_repo.dart';
import '../datasources/deposite_remote_data_src.dart';

class CardRepoImpl implements DepositRepo {
  const CardRepoImpl(this._remoteDataSource);

  final DepositRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<void> deposit(
      {required String cardNumber,
      required String paymentId,
      required String paymentStatus,
      required int amount,
      required int fee,
      required String currency,
      required String capturedAt,
      required String invoiceId,
      required String ip}) async {
    try {
      final result = await _remoteDataSource.deposit(
          cardNumber: cardNumber,
          paymentId: paymentId,
          paymentStatus: paymentStatus,
          amount: amount,
          fee: fee,
          currency: currency,
          capturedAt: capturedAt,
          invoiceId: invoiceId,
          ip: ip);
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
