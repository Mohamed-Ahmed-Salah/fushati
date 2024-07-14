import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fushati/src/home/data/models/card_model.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class TransactionsRemoteDataSrcImpl implements TransactionsRemoteDataSrc {
  static const reportsEndpoint = '/reports';
  static const cardsHistoryEndpoint = '/cards-history';

  const TransactionsRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<Transaction>> getTransactions(
      {required int userId,
      required String userCard,
      required DateTime createdAt}) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .get(
              '${NetworkConstants.reportsUrl}?requestId=$userCard&fieldtype=rfkh&Type=1&page=1&limit=1000000000000000000000000000'
              '&startTime=$createdAt&endTime=${DateTime.now()}&$userId',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      bool isSuccess = response.statusCode == 200;

      if (isSuccess) {
        final list = (json.decode(jsonEncode(response.data)) as List)
            .map((i) => Transaction.fromJson(i))
            .toList();
        return list;
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
    } on CardNotFoundException {
      rethrow;
    } catch (e, s) {
      print("E#### ${e.toString()}");
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<List<Transaction>> getUserTransactions() async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .get(
              '${NetworkConstants.parentsUrl}$cardsHistoryEndpoint',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      bool isSuccess = response.statusCode == 200;

      if (isSuccess) {
        final list = (json.decode(jsonEncode(response.data)) as List)
            .map((i) => Transaction.fromJson(i))
            .toList();
        return list;
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
    } on CardNotFoundException {
      rethrow;
    } catch (e, s) {
      print("E#### ${e.toString()}");
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class TransactionsRemoteDataSrc {
  const TransactionsRemoteDataSrc();

  Future<List<Transaction>> getTransactions(
      {required int userId,
      required String userCard,
      required DateTime createdAt});

  Future<List<Transaction>> getUserTransactions();
}
