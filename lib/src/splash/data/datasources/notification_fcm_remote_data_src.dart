import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fushati/core/common/app/cache_helper.dart';
import 'package:fushati/core/errors/exceptions.dart';
import 'package:fushati/core/services/injection_container.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/core/utils/constants/network_constants.dart';

class NotificationFcmRemoteDataSrcImpl implements NotificationFcmRemoteDataSrc {
  const NotificationFcmRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> postFCM(String fcm) async {
    try {
      final String url=sl<CacheHelper>().getBaseUrl()??"";

      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .post('$url/users/update-fcm',
              data: {"fcm_token": fcm},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      debugPrint("RESPONSE postFCM= ${response.data}");

      String message =
          response.data["status"] ?? response.data["message"] ?? "";
      if (response.statusCode == 200) {
        return;
      } else {
        throw ServerException(message: message, statusCode: 500);
      }
    } on DioException catch (e) {
      debugPrint("DioException postFCM= ${e.response?.data}");

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const TimeOutException(
            message: ErrorConst.failedToStartAppConnectionEn, statusCode: 0);
      }
      if (e.response == null) {
        if (e.error.runtimeType == SocketException) {
          throw NoInternetException(
              message: ErrorConst.failedToStartAppConnectionEn,
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
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } catch (e, s) {
      debugPrint("catch postFCM= ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class NotificationFcmRemoteDataSrc {
  const NotificationFcmRemoteDataSrc();

  Future<void> postFCM(String fcm);
}
