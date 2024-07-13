import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fushati/src/home/data/models/card_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class CardRemoteDataSrcImpl implements CardRemoteDataSrc {
  static const studentCardsEndpoint = '/parent/students';
  static const addCardEndpoint = '/parent-student';
  static const deleteCardEndpoint = '/parent-student';
  static const getCardDetailsEndpoint = '/student-card';

  const CardRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> addCard({required String cardNumber}) async {
    try {
      print("NEW CARD ADDING $cardNumber");
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .post('${NetworkConstants.parentsUrl}$addCardEndpoint',
              data: {"student_card": cardNumber},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      bool isSuccess = response.statusCode == 200 || response.statusCode == 201;
      print("responseeeeeeee------ ${response.data}");

      if (isSuccess) {
        return;
      } else {
        if (response.statusCode == 401) {
          throw AuthenticationException(
              message: ErrorConst.NO_TOKEN,
              statusCode: response.statusCode ?? 0);
        }
        if (response.statusCode == 422) {
          throw const CardNotFoundException(statusCode: 422);
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
    } on CardNotFoundException {
      rethrow;
    } on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } catch (e, s) {
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> deleteCard({required int id}) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .delete('${NetworkConstants.parentsUrl}$deleteCardEndpoint',
              data: {"student_id": id},
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
    } on CardNotFoundException {
      rethrow;
    } on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } catch (e, s) {
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<CardEntity> getCard({required String cardNumber}) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();

      final response = await _dio
          .get(
              '${NetworkConstants.parentsUrl}$getCardDetailsEndpoint/$cardNumber',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      bool isSuccess = response.statusCode == 200;
      if (response.data["id"] == null) {
        throw const CardNotFoundException(statusCode: 422);
      }
      if (isSuccess) {
        return CardModel.fromJson(response.data);
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
      print("SERRRR ${e.toString()}");
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<List<CardEntity>> getCards() async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final response = await _dio
          .get('${NetworkConstants.parentsUrl}$studentCardsEndpoint',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      bool isSuccess = response.statusCode == 200;

      print(response.data);
      if (isSuccess) {
        final list = (json.decode(jsonEncode(response.data)) as List)
            .map((i) => CardModel.fromJson(i))
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

abstract class CardRemoteDataSrc {
  const CardRemoteDataSrc();

  Future<CardEntity> getCard({
    required String cardNumber,
  });

  Future<void> deleteCard({
    required int id,
  });

  Future<void> addCard({
    required String cardNumber,
  });

  Future<List<CardEntity>> getCards();
}
