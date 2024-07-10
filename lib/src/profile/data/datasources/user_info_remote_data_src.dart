import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fushati/src/auth/data/models/user_model.dart';

import '../../../../core/common/singletons/cache.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';
import '../../../auth/domain/entities/user.dart';




class UserInfoRemoteDataSrcImpl implements UserInfoRemoteDataSrc {
  const UserInfoRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<User> getUserInfo() async {
    // TODO: implement fetchPlans
    try {
      final header = await NetworkConstants.getHeadersWithAuth();

      final response = await _dio
          .get(NetworkConstants.parentUrl,
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));
      if (response.statusCode == 200) {
        String status = response.data["status"] ??
            response.data["message"] ??
            ErrorConst.getError(statusCode: response.statusCode ?? 0);
        bool isSuccess = response.data["success"] ?? false;
        if (isSuccess) {
          return UserModel.fromJson(response.data);
        }
        if (status == ErrorConst.PROFILE_NOT_COMPLETED_MESSAGE) {
          throw const ServerException(
              message: ErrorConst.PROFILE_NOT_COMPLETED_MESSAGE,
              statusCode: 500);
        }
        
      } else {
        throw ServerException(
            message: response.data.toString(), statusCode: 500);
      }
      throw const ServerException(message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
      
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
    }

    on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    }
    catch (e, s) {
      
      throw const ServerException(message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> editUserInfo({
    required String email,
    required String name,
  }) async {
    // TODO: implement fetchPlans
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final userId = Cache.instance.userId ?? 0;
      if (userId == 0) {
        throw const ServerException(
            message: ErrorConst.CACHE_NOT_FOUND_MESSAGE, statusCode: 500);
      }
      final response = await _dio
          .post(NetworkConstants.parentUrl,
              data: {
                "name": name,
                "email": email,

              },
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));

      String status = response.data["status"] ??
          response.data["message"] ??
          ErrorConst.UNKNOWN_ERROR;
      bool isSuccess = response.data["success"] ?? false;
      if (response.statusCode == 200) {
        if (status == ErrorConst.PROFILE_NOT_COMPLETED_MESSAGE) {
          throw const ServerException(
              message: ErrorConst.PROFILE_NOT_COMPLETED_MESSAGE,
              statusCode: 500);
        }
        // return UserInfoModel.fromJson(response.data[0]);
      } else {
        throw ServerException(
            message: response.data.toString(), statusCode: 500);
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
    }
    on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    }
    catch (e, s) {
     
      throw const ServerException(message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }

  @override
  Future<void> deleteProfile() async {
// TODO: implement fetchPlans
    try {
      final header = await NetworkConstants.getHeadersWithAuth();
      final token = Cache.instance.sessionToken ?? 0;

      final response = await _dio
          .delete('${NetworkConstants.parentUrl}',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 10));

      if(response.statusCode==204){
        return;
      }
      String status =
          response.data["message"] ??response.data["status"] ??
          ErrorConst.UNKNOWN_ERROR;
      bool isSuccess = response.data["success"] ?? false;
      if (response.statusCode == 200) {
        if (status == ErrorConst.PROFILE_NOT_COMPLETED_MESSAGE) {
          throw const ServerException(
              message: ErrorConst.PROFILE_NOT_COMPLETED_MESSAGE,
              statusCode: 500);
        }
// return UserInfoModel.fromJson(response.data[0]);
      } else {
        throw ServerException(
            message: response.data.toString(), statusCode: 500);
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
    }on TimeoutException {
      throw throw const TimeOutException(
          message: ErrorConst.TIMEOUT_MESSAGE, statusCode: 500);
    } catch (e, s) {
      throw const ServerException(message: ErrorConst.UNKNOWN_ERROR, statusCode: 500);
    }
  }
}

abstract class UserInfoRemoteDataSrc {
  const UserInfoRemoteDataSrc();

  Future<User> getUserInfo();

  Future<void> deleteProfile();

  Future<void> editUserInfo({
    required String email,

    required String name,
  });
}
