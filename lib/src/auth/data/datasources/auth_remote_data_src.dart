import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fushati/core/common/app/cache_helper.dart';
import 'package:fushati/core/services/injection_container.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';
import '../../domain/entities/otp_response.dart';
import '../models/otp_response_model.dart';

const loginEndpoint = '/login';
const addUserInfoEndpoint = '/login';

class AuthRemoteDataSrcImpl implements AuthRemoteDataSrc {
  const AuthRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> loginOrRegister({
    required String phone,
  }) async {
    try {
      final String url="${sl<CacheHelper>().getBaseUrl()??""}/parent";

      final header = await NetworkConstants.getHeaders();
      final response = await _dio
          .post('$url$loginEndpoint',
              data: {"phone": phone},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      bool isSuccess = response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202;

      debugPrint("login ${response.data}");
      if (isSuccess) {
        return;
      } else {
        if (response.statusCode == 401) {
          throw AuthenticationException(
              message: ErrorConst.OTP_NOT_SENT_EN,
              statusCode: response.statusCode ?? 0);
        }
        throw ServerException(
            message: response.data['message'] ?? '',
            statusCode: response.statusCode ?? 0);
      }
    } on DioException catch (e) {
      debugPrint("login DioException ${e.response?.data}");

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
      debugPrint("ERROR CATCH ${e.toString()}");

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
      final String url="${sl<CacheHelper>().getBaseUrl()??""}/parent";

      final response = await _dio
          .post('$url$loginEndpoint',
              data: {"phone": phone, "code": otp},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      debugPrint("verifyOTP ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        return OtpResponseModel.fromJson(response.data);
      }
      if (response.statusCode == 401) {
        throw AuthenticationException(
            message: ErrorConst.OTP_NOT_FOUND,
            statusCode: response.statusCode ?? 0);
      }
      if (response.data['message']
              .toString()
              .toLowerCase()
              .contains("invalid code") ||
          response.statusCode == 422) {
        throw const AuthenticationException(
            message: ErrorConst.invalidOtpEn, statusCode: 0);
      }

      throw AuthenticationException(
          message: ErrorConst.getError(statusCode: response.statusCode ?? 500),
          statusCode: 0);
    } on DioException catch (e) {
      debugPrint("verifyOTP DioException ${e.response?.data}");

      if (e.response?.statusCode == 401 || e.response?.statusCode == 422) {
        throw const AuthenticationException(
            message: ErrorConst.invalidOtpEn, statusCode: 0);
      }
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
      debugPrint(e.toString());
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
      final String url="${sl<CacheHelper>().getBaseUrl()??""}/parent";

      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .post('$url$addUserInfoEndpoint',
              data: {
                "email": email,
                "username": name,
              },
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
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

  Future<void> loginOrRegister({
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
