import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fushati/src/auth/domain/entities/login_response.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';
import '../../domain/entities/otp_response.dart';
import '../models/login_response_model.dart';
import '../models/otp_response_model.dart';
import '../models/user_model.dart';

const loginEndpoint = '/login';
const addUserInfoEndpoint = '/login';

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  const AuthRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<LoginResponse> loginOrRegister({
    required String phone,
  }) async {
    try {
      final header = await NetworkConstants.getHeaders();
      final response = await _dio
          .post('${NetworkConstants.parentUrl}$loginEndpoint',
              data: {"phone": phone},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      bool isSuccess = response.statusCode == 200;

      print(response.data);
      if (isSuccess) {
        print("-------------------------------------------");
        print(response.data["verification_code"]);
        return LoginResponseModel.fromJson(response.data);
      } else {
        if (response.statusCode == 401) {
          throw AuthenticationException(
              message: ErrorConst.OTP_NOT_FOUND,
              statusCode: response.statusCode ?? 0);
        }
        throw ServerException(
            message: response.data['message'],
            statusCode: response.statusCode ?? 0);
      }

      // CoreUtils.showErrorSnackBar(message: "Success");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const TimeOutException(
            message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 0);
      }
      if (e.response == null) {
        if (e.error.runtimeType == SocketException) {
          throw NoInternetException(
              message: ErrorConst.NO_INTERNET_MESSAGE,
              statusCode: e.response?.statusCode ?? 400);
        }
      }
      String status = e.response?.data["message"] ??
          ErrorConst.getError(statusCode: e.response?.statusCode ?? 0);
      throw ServerException(message: status, statusCode: 500);
    } on ServerException {
      rethrow;
    } on AuthenticationException {
      rethrow;
    } on CacheException {
      rethrow;
    } on NoInternetException {
      rethrow;
    } on TimeOutException {
      rethrow;
    } on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } catch (e, s) {
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<OtpResponse> verifyOTP({
    required String phone,
    required String otp,
  }) async {
    try {
      final header = await NetworkConstants.getHeaders();
      final response = await _dio
          .post('${NetworkConstants.parentUrl}$loginEndpoint',
              data: {"phone": phone, "code": otp},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        return OtpResponseModel.fromJson(response.data);
      }
      if (response.statusCode == 401) {
        throw AuthenticationException(
            message: ErrorConst.OTP_NOT_FOUND,
            statusCode: response.statusCode ?? 0);
      }
      throw AuthenticationException(
          message: ErrorConst.getError(statusCode: response.statusCode ?? 500),
          statusCode: 0);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const TimeOutException(
            message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 0);
      }
      if (e.response == null) {
        if (e.error.runtimeType == SocketException) {
          throw NoInternetException(
              message: ErrorConst.NO_INTERNET_MESSAGE,
              statusCode: e.response?.statusCode ?? 400);
        }
      }
      String status = e.response?.data["status"] ??
          e.response?.data["message"] ??
          ErrorConst.getError(statusCode: e.response?.statusCode ?? 0);
      throw ServerException(message: status, statusCode: 500);
    } on ServerException {
      rethrow;
    } on AuthenticationException {
      rethrow;
    } on CacheException {
      rethrow;
    } on NoInternetException {
      rethrow;
    } on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } on TimeOutException {
      rethrow;
    } catch (e, s) {
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> addCustomerInfo({
    required String email,
    required String name,
  }) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .post('${NetworkConstants.parentUrl}$addUserInfoEndpoint',
              data: {
                "email": email,
                "username": name,
              },
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      String status = response.data["status"] ??
          response.data["message"] ??
          ErrorConst.UNKNOWN_ERROR;
      bool isSuccess = response.data["success"] ?? false;
      if (response.statusCode == 200) {
        if (isSuccess) {
          return;
        } else {
          throw ServerException(message: status, statusCode: 500);
        }
      } else {
        throw ServerException(message: status, statusCode: 500);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const TimeOutException(
            message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 0);
      }
      if (e.response == null) {
        if (e.error.runtimeType == SocketException) {
          throw NoInternetException(
              message: ErrorConst.NO_INTERNET_MESSAGE,
              statusCode: e.response?.statusCode ?? 400);
        }
      }
      String status = e.response?.data["status"] ??
          e.response?.data["message"] ??
          ErrorConst.getError(statusCode: e.response?.statusCode ?? 0);
      throw ServerException(message: status, statusCode: 500);
    } on ServerException {
      rethrow;
    } on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } on AuthenticationException {
      rethrow;
    } on CacheException {
      rethrow;
    } on NoInternetException {
      rethrow;
    } on TimeOutException {
      rethrow;
    } catch (e, s) {
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class AuthRemoteDataSrc {
  const AuthRemoteDataSrc();

  Future<LoginResponse> loginOrRegister({
    required String phone,
  });

  Future<OtpResponse> verifyOTP({
    required String phone,
    required String otp,
  });

  Future<void> addCustomerInfo({
    required String email,
    required String name,
  });
}
