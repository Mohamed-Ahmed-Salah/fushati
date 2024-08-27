import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class RegistrationFeesRemoteDataSrcImpl
    implements RegistrationFeesRemoteDataSrc {
  static const feesEndpoint = '/settings/registration-fees';

  const RegistrationFeesRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<double> getRegistrationFees() async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();

      final response = await _dio
          .get('${NetworkConstants.baseUrl}$feesEndpoint',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));

      debugPrint("registration fees ${response.data}");
      bool isSuccess = response.statusCode == 200;

      if (isSuccess) {
        final String fees = response.data["registration_fees"];
        return double.parse(fees);
      } else {
        if (response.statusCode == 401) {
          throw AuthenticationException(
              message: ErrorConst.NO_TOKEN,
              statusCode: response.statusCode ?? 0);
        }
        throw ServerException(
            message: response.data['message'],
            statusCode: response.statusCode ?? 0);
      }
    } on DioException catch (e) {
      debugPrint("DioException registration fees ${e.response?.data}");

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
    } on CardNotFoundException {
      rethrow;
    } catch (e) {
      debugPrint("catch registration fees ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class RegistrationFeesRemoteDataSrc {
  Future<double> getRegistrationFees();
}
