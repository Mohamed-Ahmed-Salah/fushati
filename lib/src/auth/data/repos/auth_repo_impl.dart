import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/typedefs.dart';
import '../../domain/entities/otp_response.dart';
import '../../domain/repos/auth_repo.dart';
import '../datasources/auth_remote_data_src.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(this._remoteDataSource);

  final AuthRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<void> loginOrRegister({
    required String phone,
  }) async {
    try {
      await _remoteDataSource.loginOrRegister(phone: phone);
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

  @override
  ResultFuture<OtpResponse> verifyOTP({
    required String phone,
    required String otp,
  }) async {
    try {
      final result = await _remoteDataSource.verifyOTP(phone: phone, otp: otp);

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

  @override
  ResultFuture<void> addCustomerInfo(
      {required String email, required String name}) async {
    try {
      await _remoteDataSource.addCustomerInfo(
        email: email,
        name: name,
      );
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
