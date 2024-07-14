import 'package:dartz/dartz.dart';
import 'package:fushati/src/home/domain/repos/transactions_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entity/card.dart';
import '../../domain/repos/card_repo.dart';
import '../datasources/cards_remote_data_src.dart';
import '../datasources/transaction_remote_data_src.dart';
import '../models/transaction_model.dart';

class TransactionsRepoImpl implements TransactionsRepo {
  const TransactionsRepoImpl(this._remoteDataSource);

  final TransactionsRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<List<Transaction>> getTransactions(
      {required int userId,
      required String userCard,
      required DateTime createdAt}) async {
    try {
      final result = await _remoteDataSource.getTransactions(
          userId: userId, userCard: userCard, createdAt: createdAt);
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
  ResultFuture<List<Transaction>> getUserTransactions() async {
    try {
      final result = await _remoteDataSource.getUserTransactions();
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
