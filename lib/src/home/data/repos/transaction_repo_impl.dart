import 'package:dartz/dartz.dart';
import 'package:fushati/src/home/domain/entity/transactions_response.dart';
import 'package:fushati/src/home/domain/repos/transactions_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../datasources/transaction_remote_data_src.dart';

class TransactionsRepoImpl implements TransactionsRepo {
  const TransactionsRepoImpl(this._remoteDataSource);

  final TransactionsRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<TransactionResponse> getTransactions({
    required String userCard,
    required int page,
  }) async {
    try {
      final result = await _remoteDataSource.getTransactions(
          page: page, userCard: userCard, );
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

  @override
  ResultFuture<TransactionResponse> getUserTransactions(int page) async {
    try {
      final result = await _remoteDataSource.getUserTransactions(page);
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
