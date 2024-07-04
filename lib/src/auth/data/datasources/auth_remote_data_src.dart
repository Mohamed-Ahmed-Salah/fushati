import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';
import '../models/user_model.dart';

const REGISTER_ENDPOINT = '/register';
const LOGIN_ENDPOINT = '/login';
const PROFILE = "/profile";
const FORGOT_PASSWORD_ENDPOINT = '/forgot-password';
const VERIFY_OTP_ENDPOINT = '/verify-otp';
const RESET_PASSWORD_ENDPOINT = '/reset-password';
const VERIFY_TOKEN_ENDPOINT = '/verify-token';

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  const AuthRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> loginOrRegister({
    required String phone,
  }) async {
    try {
      final header = await NetworkConstants.getHeaders();
      final response = await _dio
          .post('${NetworkConstants.customerUrl}$LOGIN_ENDPOINT',
              data: {"phone": phone},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      bool isSuccess = response.data["success"] ?? false;
      String status = response.data["status"] ?? response.data["message"] ?? "";

      if (isSuccess) {
        return;
      } else {
        throw ServerException(
            message: status, statusCode: response.statusCode ?? 0);
      }

      // CoreUtils.showErrorSnackBar(message: "Success");
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw TimeOutException(
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
    } on TimeOutException {
      rethrow;
    } on TimeoutException {
      throw throw TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } catch (e, s) {
      throw ServerException(message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<UserModel> verifyOTP({
    required String phone,
    required String otp,
  }) async {
    try {
      final header = await NetworkConstants.getHeaders();
      final response = await _dio
          .post('${NetworkConstants.customerUrl}$VERIFY_OTP_ENDPOINT',
              data: {"phone": phone, "otp": int.parse(otp)},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));

      String status = response.data["status"] ?? response.data["message"] ?? "";
      bool isSuccess = response.data["success"] ?? false;
      if (response.statusCode == 200) {
        if (isSuccess) {
          return UserModel.fromJson(response.data);
        } else {
          throw ServerException(message: status, statusCode: 0);
        }
      }
      if (response.statusCode == 401) {
        throw AuthenticationException(message: status, statusCode: 0);
      }
      throw ServerException(
          message: ErrorConst.UNKNOWN_ERROR,
          statusCode: response.statusCode ?? 404);
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw TimeOutException(
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
      throw throw TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } on TimeOutException {
      rethrow;
    } catch (e, s) {
      throw ServerException(message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
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
          .post('${NetworkConstants.customerUrl}$PROFILE',
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
          return null;
        } else {
          throw ServerException(message: status, statusCode: 500);
        }
      } else {
        throw ServerException(message: status, statusCode: 500);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw TimeOutException(
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
      throw throw TimeOutException(
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
      throw ServerException(message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class AuthRemoteDataSrc {
  const AuthRemoteDataSrc();

  Future<void> loginOrRegister({
    required String phone,
  });

  Future<UserModel> verifyOTP({
    required String phone,
    required String otp,
  });

  Future<void> addCustomerInfo({
    required String email,
    required String name,
  });
}
