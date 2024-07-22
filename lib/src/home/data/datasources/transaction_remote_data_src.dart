import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fushati/src/home/data/models/card_model.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:intl/intl.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class TransactionsRemoteDataSrcImpl implements TransactionsRemoteDataSrc {
  static const reportsEndpoint = '/reports';
  static const cardsHistoryEndpoint = '/cards-history';

  const TransactionsRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<Transaction>> getTransactions({
    required int userId,
    required String userCard,
    required DateTime createdAt,
    required int page,
  }) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      DateTime currentDate = DateTime.now();

      // Define the date format with fractional seconds
      DateFormat dateFormat = DateFormat('yyyy-MM-dd');

      // Format the current date
      String formattedDate = dateFormat.format(currentDate);

      // Remove the fractional seconds by finding the last dot and taking the substring
      int dotIndex = formattedDate.lastIndexOf('.');
      if (dotIndex != -1) {
        formattedDate = formattedDate.substring(0, dotIndex);
      }

      final response = await _dio
          .get(
              '${NetworkConstants.reportsUrl}?requestId=$userCard&fieldtype=rfkh&Type=1&page=$page&limit=${NetworkConstants.pageSize}&startTime=2024-01-01 00:00:00&endTime=$formattedDate 00:00:00&parent_id=$userId',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));

      print(
          '${NetworkConstants.reportsUrl}?requestId=$userCard&fieldtype=rfkh&Type=1&page=1&limit=5000&startTime=${dateFormat.format(createdAt)} 00:00:00&endTime=$formattedDate 00:00:00&parent_id=$userId');
      print("AAAAAAAAAAAa ${response.data}");
      bool isSuccess = response.statusCode == 200;

      if (isSuccess) {
        final list = (json.decode(jsonEncode(response.data['data'])) as List)
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
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<List<Transaction>> getUserTransactions() async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .get('${NetworkConstants.parentsUrl}$cardsHistoryEndpoint',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      bool isSuccess = response.statusCode == 200;

      print("${response.data}");
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
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class TransactionsRemoteDataSrc {
  const TransactionsRemoteDataSrc();

  Future<List<Transaction>> getTransactions({
    required int userId,
    required String userCard,
    required DateTime createdAt,
    required int page,
  });

  Future<List<Transaction>> getUserTransactions();
}
