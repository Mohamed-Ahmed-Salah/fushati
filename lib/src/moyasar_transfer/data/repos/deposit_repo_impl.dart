import 'package:dartz/dartz.dart';
import 'package:fushati/src/moyasar_transfer/domain/entity/transaction_response.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';

import '../../domain/repo/deposit_repo.dart';
import '../datasources/deposite_remote_data_src.dart';

class DepositRepoImpl implements DepositRepo {
  const DepositRepoImpl(this._remoteDataSource);

  final DepositRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<TransactionResponse> deposit(
      {required String cardNumber,
      required String paymentId,

      required int amount,
      }) async {
    try {
      final result = await _remoteDataSource.deposit(
          cardNumber: cardNumber,
          paymentId: paymentId,
          amount: amount,
         );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }on PaymentException catch (e) {
      return Left(PaymentFailure.fromException(e));
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
