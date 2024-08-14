import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fushati/src/home/data/models/card_model.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/splash/domain/entities/school.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/network_constants.dart';

class SchoolsRemoteDataSrcImpl implements SchoolsRemoteDataSrc {
  static const schoolsEndpoint = '/schools';

  const SchoolsRemoteDataSrcImpl(this._dio);

  final Dio _dio;

  @override
  Future<List<School>> getSchools() async {
    try {
      final header = await NetworkConstants.getHeaders();
      final response = await _dio
          .get('${NetworkConstants.topBaseUrl}$schoolsEndpoint',
              options: Options(
                headers: header,
              ))
          .timeout(const Duration(seconds: 5));
      bool isSuccess = response.statusCode == 200;

      if (isSuccess) {
        // final list = (json.decode(jsonEncode(response.data)) as List)
        //     .map((i) => CardModel.fromJson(i))
        //     .toList();
        return [];
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

abstract class SchoolsRemoteDataSrc {
  const SchoolsRemoteDataSrc();

  Future<List<School>> getSchools();
}
