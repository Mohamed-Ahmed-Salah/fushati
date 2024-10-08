import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fushati/core/common/app/cache_helper.dart';
import 'package:fushati/core/services/injection_container.dart';
import 'package:fushati/src/home/data/models/card_model.dart';
import 'package:fushati/src/home/data/models/home_response_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/home/domain/entity/home_response.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class CardRemoteDataSrcImpl implements CardRemoteDataSrc {
  static const studentCardsEndpoint = '/parent/students';
  static const addCardEndpoint = '/users/new/user';
  static const addCardByNumberEndpoint = '/parents/parent-student';
  static const reportsEndpoint = '/reports';
  static const deleteCardEndpoint = '/parent-student';
  static const getCardDetailsEndpoint = '/student-card';

  const CardRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<void> addCard({
    required String name,
    required String email,
    required String phoneNumber,
    required String cardNumber,
    required String studentNumber,
  }) async {
    try {
      final String url=sl<CacheHelper>().getBaseUrl()??"";

      final header = await NetworkConstants.getHeadersWithAuth(
          location: "addCard with full details");
      final response = await _dio
          .post('$url$addCardEndpoint',
              data: {
                "user_card": cardNumber,
                "name": name,
                "email": email,
                "user_number": studentNumber,
                "user_phone": phoneNumber,
                "type": "student"
              },
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      debugPrint("response ${response.data} ${response.statusCode}");
      bool isSuccess = response.statusCode == 200 || response.statusCode == 201;

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
    } on DioException catch (e) {
      debugPrint(
          "error Dio  ${e.response?.data} ${e.response?.statusCode}");

      String status = e.response?.data["message"] ??
          e.response?.data['errors']?["user_phone"]?[0] ??
          e.response?.data['errors']?["user_number"]?[0] ??
          e.response?.data['errors']?["email"]?[0] ??
          ErrorConst.getError(statusCode: e.response?.statusCode ?? 0);

      debugPrint("error status response $status");
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
    } catch (e) {
      debugPrint("CATCH ERROR addCard ${e.toString()}");
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> addCardByNumber({
    required String cardNumber,
  }) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth(
          location: "addCardByNumber");
      final String url=sl<CacheHelper>().getBaseUrl()??"";

      final response = await _dio
          .post('$url$addCardByNumberEndpoint',
              data: {"student_card": cardNumber, "type": "student"},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      log("response ${response.data} ${response.statusCode}");
      bool isSuccess = response.statusCode == 200 || response.statusCode == 201;

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
    } on DioException catch (e) {
      log("error DioException addCardByNumber ${e.response?.data['errors']} ${e.response?.statusCode}");

      String status = e.response?.data["message"] ??
          e.response?.data['errors']["user_phone"][0] ??
          e.response?.data['errors']["user_number"][0] ??
          e.response?.data['errors']["email"][0] ??
          ErrorConst.getError(statusCode: e.response?.statusCode ?? 0);

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
    } catch (e) {
      log("CATCH ${e.toString()}");
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> deleteCard({required int id}) async {
    try {
      final String url="${sl<CacheHelper>().getBaseUrl()??""}/parents";

      final header =
          await NetworkConstants.getHeadersWithAuth(location: "deleteCard");
      final response = await _dio
          .delete('$url$deleteCardEndpoint',
              data: {"student_id": id},
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
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
    } catch (e) {
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<CardEntity> getCard({required String cardNumber}) async {
    try {
      final String url="${sl<CacheHelper>().getBaseUrl()??""}/parents";

      final header =
          await NetworkConstants.getHeadersWithAuth(location: "GET CARD");

      final response = await _dio
          .get(
              '$url$getCardDetailsEndpoint/$cardNumber',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      bool isSuccess = response.statusCode == 200;
      debugPrint("getCard ${response.data}");
      if ((response.data["message"] ?? "").contains("Student not found")) {
        throw const CardNotFoundException(statusCode: 422);
      }
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
    } on DioException catch (e) {
      debugPrint("getCard DioException ${e.response?.data}");
      if ((e.response?.data["message"] ?? "").contains("Student not found")) {
        throw const CardNotFoundException(statusCode: 422);
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
      debugPrint("getCard ServerException ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<HomeResponse> getCards(int page) async {
    try {
      final String url="${sl<CacheHelper>().getBaseUrl()??""}/parents";

      final header =
          await NetworkConstants.getHeadersWithAuth(location: "getCards");
      debugPrint(
        '$url$studentCardsEndpoint/?page=$page',
      );
      final response = await _dio
          .get(
              '$url$studentCardsEndpoint/?page=$page',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));
      bool isSuccess = response.statusCode == 200 || response.statusCode == 206;

      debugPrint("getCards page=$page ${response.statusCode} ${response.data}");
      if (isSuccess) {
        final data = HomeResponseModel.fromJson(response.data["data"]);
        return data;
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
      debugPrint("getCards DioException ${e.response?.data}");

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
      log("catch ${e.toString()}");
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

  Future<void> addCardByNumber({
    required String cardNumber,
  });

  Future<void> deleteCard({
    required int id,
  });

  Future<void> addCard({
    required String name,
    required String email,
    required String phoneNumber,
    required String cardNumber,
    required String studentNumber,
  });

  Future<HomeResponse> getCards(int page);
}
