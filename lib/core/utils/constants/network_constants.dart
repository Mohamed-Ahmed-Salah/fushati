import 'package:flutter/cupertino.dart';

import '../../common/app/cache_helper.dart';
import '../../services/injection_container.dart';

abstract class NetworkConstants {
  static const String topBaseUrl = 'https://schools.fushati.com/api/v1/schools';
  ///updated from cache singleton depending on cached or chosen value in login
  static String baseUrl = '';
  static String parentUrl = '$baseUrl/parent';
  static String reportsUrl = '$baseUrl/reports';
  static String usersUrl = '$baseUrl/users';
  static String parentsUrl = '$baseUrl/parents';

  static const String moyasarAPIKey =
      "pk_live_EiP5kYnxaHbmVSSrjCpoMiBhinvZJF4yyJjnqV9L";

  static const headers = {'Content-Type': 'application/json; charset=UTF-8'};
  static const pageSize = 15;
  static const timeout = 60;

  static Future<Map<String, String>> getHeaders(
      {String contentType = "application/json"}) async {
    Map<String, String> headers = <String, String>{
      "Cache-Control": "no-cache",
      "Content-Type": contentType,
      "x-api-key": "",
      "Accept": contentType,
      "x-request-timestamp": "",
      "x-request-timezone": "",
    };
    return headers;
  }

  static Future<Map<String, String>> getHeadersWithAuth(
      {String contentType = "application/json"}) async {
    Map<String, String> headers = await getHeaders(contentType: contentType);
    CacheHelper cacheHelper = CacheHelper(sl());
    String token = cacheHelper.getSessionToken() ?? '';
    headers["Authorization"] = 'Bearer ${token.replaceAll("\"", "")}';
    debugPrint("token: $token");
    return headers;
  }
}
