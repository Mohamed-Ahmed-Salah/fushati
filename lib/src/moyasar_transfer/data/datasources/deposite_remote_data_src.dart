import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fushati/core/common/app/cache_helper.dart';
import 'package:fushati/core/services/injection_container.dart';
import 'package:fushati/src/moyasar_transfer/data/models/transaction_response_model.dart';
import 'package:fushati/src/moyasar_transfer/domain/entity/transaction_response.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class DepositRemoteDataSrcImpl implements DepositRemoteDataSrc {
  static const rechargeEndpoint = '/recharge';

  const DepositRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<TransactionResponse> deposit({
    required String cardNumber,
    required String paymentId,
    required int amount,
  }) async {
    try {
      final String url="${sl<CacheHelper>().getBaseUrl()??""}/parents";

      final header = await NetworkConstants.getHeadersWithAuth(location: "DEPOSITE TRANSACTION");
      final response = await _dio.post(
        '$url$rechargeEndpoint',
        options: Options(
          headers: header,
        ),
        data: {
          "user_card": cardNumber,
          "amount": amount,
          "payment_id": paymentId
        },
      ).timeout(const Duration(seconds: NetworkConstants.timeout));
      debugPrint("deposit ${response.data}");
      bool isSuccess = response.statusCode == 200 || response.statusCode == 201;
      if (isSuccess) {
        return TransactionResponseModel.fromJson(response.data["data"]["transaction"]);
      } else {
        if (response.statusCode == 400) {
          throw PaymentException(
              message: ErrorConst.paymentFailedEn,
              statusCode: response.statusCode ?? 0);
        }
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
      debugPrint("DioException deposit ${e.response?.data}");

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw const TimeOutException(
            message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 0);
      }
      if (e.response?.statusCode == 400 || e.response?.statusCode == 402) {
        throw PaymentException(
            message: ErrorConst.paymentFailedEn,
            statusCode: e.response?.statusCode ?? 0);
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
    } on PaymentException {
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
      debugPrint("catch deposit ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class DepositRemoteDataSrc {
  const DepositRemoteDataSrc();

  Future<TransactionResponse> deposit({
    required String cardNumber,
    required String paymentId,
    required int amount,
  });
}
