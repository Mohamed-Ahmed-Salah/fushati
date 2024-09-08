import 'dart:async';
import 'dart:io';
import 'package:fushati/src/home/data/models/transaction_response_model.dart';
import 'package:fushati/src/home/domain/entity/transactions_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class TransactionsRemoteDataSrcImpl implements TransactionsRemoteDataSrc {
  static const reportsEndpoint = '/reports';
  static const cardsHistoryEndpoint = '/cards-history';

  const TransactionsRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<TransactionResponse> getTransactions({
    required int userId,
    required String userCard,
    required int page,
  }) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();

      final response = await _dio
          .get(
              '${NetworkConstants.reportsUrl}?card_number=$userCard&page=$page&limit=${NetworkConstants.pageSize}&parent_id=$userId',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));

      debugPrint("getTransactions cards ${response.data["data"]["data"]}");
      bool isSuccess = response.statusCode == 200;

      if (isSuccess) {
        final data = TransactionResponseModel.fromJson(response.data["data"]);
        return data;
      } else {
        if (response.statusCode == 206 || response.statusCode == 502) {
          throw const ServerException(
              message: ErrorConst.couldNotLoadStudentDataEn, statusCode: 500);
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
      debugPrint("DioException getTransactions cards ${e.response?.data}");
      if (e.response?.statusCode == 206 || e.response?.statusCode == 502) {
        throw const ServerException(
            message: ErrorConst.couldNotLoadStudentDataEn, statusCode: 500);
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
      debugPrint("catch getTransactions cards ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<TransactionResponse> getUserTransactions(int page) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .get('${NetworkConstants.parentsUrl}$cardsHistoryEndpoint/?page=$page',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      bool isSuccess = response.statusCode == 200 || response.statusCode == 206;
      debugPrint("getUserTransactions ${response.data['data']}");

      if (isSuccess) {
        final data =TransactionResponseModel.fromJson(response.data['data']);
        return data;
      } else {
        if (response.statusCode == 502) {
          throw const ServerException(
              message: ErrorConst.couldNotLoadStudentDataEn, statusCode: 500);
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
      debugPrint(
          "DioException getUserTransactions transactions ${e.response?.data}");

      if (e.response?.statusCode == 206 || e.response?.statusCode == 502) {
        throw const ServerException(
            message: ErrorConst.couldNotLoadStudentDataEn, statusCode: 500);
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
      debugPrint("catch getUserTransactions transactions ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class TransactionsRemoteDataSrc {
  const TransactionsRemoteDataSrc();

  Future<TransactionResponse> getTransactions({
    required int userId,
    required String userCard,
    required int page,
  });

  Future<TransactionResponse> getUserTransactions(int page);
}
