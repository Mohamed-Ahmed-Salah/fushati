import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fushati/core/errors/exceptions.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/core/utils/constants/network_constants.dart';
import 'package:fushati/src/splash/data/model/min_version_response_model.dart';
import 'package:fushati/src/splash/domain/entities/min_version_response.dart';

class AppVersionRemoteDataSrcImpl implements AppVersionRemoteDataSrc {
  const AppVersionRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<MinVersionResponse> getAppVersion(String platform) async {
    try {
      final header = await NetworkConstants.getHeaders();
      final response = await _dio
          .get(
              'https://schools.fushati.com/api/v1/settings/platform-info?platform=$platform',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      debugPrint("RESPONSE getAppVersion= ${response.data}");

      String message =
          response.data["status"] ?? response.data["message"] ?? "";
      if (response.statusCode == 200) {
        final MinVersionResponse model =
            MinVersionResponseModel.fromJson(response.data["data"]);
        return model;
      } else {
        throw ServerException(message: message, statusCode: 500);
      }
    } on DioException catch (e) {
      debugPrint("DioException getAppVersion= ${e.response?.data}");

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
    } on TimeOutException {
      rethrow;
    } on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } catch (e, s) {
      debugPrint("catch getAppVersion= ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class AppVersionRemoteDataSrc {
  const AppVersionRemoteDataSrc();

  Future<MinVersionResponse> getAppVersion(String platform);
}
