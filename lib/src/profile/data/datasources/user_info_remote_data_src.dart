import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fushati/src/profile/data/models/user_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';
import '../../domain/entities/user.dart';

class UserInfoRemoteDataSrcImpl implements UserInfoRemoteDataSrc {
  const UserInfoRemoteDataSrcImpl(this._dio);

  final Dio _dio;
  static const String getUser = "/user";
  static const String editUser = "/update-profile";
  static const String deleteUser = "/delete/user/";

  @override
  Future<User> getUserInfo() async {
    // TODO: implement fetchPlans
    try {
      final header = await NetworkConstants.getHeadersWithAuth();

      final response = await _dio
          .get("${NetworkConstants.usersUrl}$getUser",
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data["user"]);
      } else {
        throw ServerException(
            message: response.data["message"], statusCode: 500);
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

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> editUserInfo({
    String? email,
    String? gender,
    required String name,
  }) async {
    // TODO: implement fetchPlans
    try {
      final header = await NetworkConstants.getHeadersWithAuth();

      final response = await _dio
          .post("${NetworkConstants.usersUrl}$editUser",
              data: {
                "name": name,
                "email": email,
                "gender":gender
              },
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw ServerException(
            message: response.data["message"], statusCode: 500);
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
      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> deleteProfile({required int id}) async {
    try {
      final header = await NetworkConstants.getHeadersWithAuth();

      final response = await _dio
          .delete('${NetworkConstants.usersUrl}$deleteUser$id',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: NetworkConstants.timeout));

      debugPrint("response delete ${response.data}");
      if (response.statusCode == 204 || response.statusCode == 200) {
        return;
      } else {
        throw ServerException(
            message: response.data["message"].toString(), statusCode: 500);
      }
    } on DioException catch (e) {
      debugPrint("DioException response delete ${e.response?.data}");

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
      debugPrint("Catch response delete ${e.toString()}");

      throw const ServerException(
          message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class UserInfoRemoteDataSrc {
  const UserInfoRemoteDataSrc();

  Future<User> getUserInfo();

  Future<void> deleteProfile({required int id});

  Future<void> editUserInfo({
    String? email,
    String? gender,
    required String name,
  });
}
