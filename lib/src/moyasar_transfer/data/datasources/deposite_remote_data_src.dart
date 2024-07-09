import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fushati/src/auth/domain/entities/login_response.dart';
import 'package:fushati/src/home/data/models/card_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class DepositRemoteDataSrcImpl implements DepositRemoteDataSrc {
  static const studentCardsEndpoint = '/parent/students';
  static const addCardEndpoint = '/parent-student';
  static const deleteCardEndpoint = '/parent-student';
  static const getCardDetailsEndpoint = '/parent-student';

  const DepositRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> deposit(
      {required String cardNumber,
      required String paymentId,
      required String paymentStatus,
      required int amount,
      required int fee,
      required String currency,
      required String capturedAt,
      required String invoiceId,
      required String ip}) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .get('${NetworkConstants.parentsUrl}$studentCardsEndpoint',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      bool isSuccess = response.statusCode == 200;

      if (isSuccess) {
        return;
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
}

abstract class DepositRemoteDataSrc {
  const DepositRemoteDataSrc();

  Future<void> deposit(
      {required String cardNumber,
      required String paymentId,
      required String paymentStatus,
      required int amount,
      required int fee,
      required String currency,
      required String capturedAt,
      required String invoiceId,
      required String ip});
}
