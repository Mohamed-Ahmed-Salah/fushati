import 'package:dartz/dartz.dart';
import 'package:fushati/src/home/domain/entity/home_response.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entity/card.dart';
import '../../domain/repos/card_repo.dart';
import '../datasources/cards_remote_data_src.dart';

class CardRepoImpl implements CardRepo {
  const CardRepoImpl(this._remoteDataSource);

  final CardRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<CardEntity> getCard({
    required String cardNumber,
  }) async {
    try {
      final result = await _remoteDataSource.getCard(cardNumber: cardNumber);
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
  ResultFuture<void> deleteCard({
    required int id,
  }) async {
    try {
      final result = await _remoteDataSource.deleteCard(id: id);

      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    } on AuthenticationException catch (e) {
      return Left(AuthenticationFailure.fromException(e));
    } on NoInternetException catch (e) {
      return Left(NoInternetFailure.fromException(e));
    } on CardNotFoundException catch (e) {
      return Left(CardNotFoundFailure.fromException(e));
    } on TimeOutException catch (e) {
      return Left(TimeOutFailure.fromException(e));
    } catch (e) {
      return Left(ServerFailure.fromException(
          ServerException(message: e.toString(), statusCode: 1)));
    }
  }

  @override
  ResultFuture<void> addCard({
    required String name,
    required String email,
    required String phoneNumber,
    required String cardNumber,
    required String studentNumber,
  }) async {
    try {
      final result = await _remoteDataSource.addCard(
        cardNumber: cardNumber,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        studentNumber: studentNumber,
      );
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
  ResultFuture<HomeResponse> getCards(int page) async {
    try {
      final result = await _remoteDataSource.getCards(page);
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
