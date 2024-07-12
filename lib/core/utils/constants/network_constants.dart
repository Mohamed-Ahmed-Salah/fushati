import '../../common/app/cache_helper.dart';
import '../../services/injection_container.dart';

abstract class NetworkConstants {
  static const baseUrl = 'http://66.42.54.81:8080/api';
  static const String parentUrl = '$baseUrl/parent';
  static const String usersUrl = '$baseUrl/users';
  static const String parentsUrl = '$baseUrl/parents';



  static const String productImgUrl =
      "https://ourvend-image.oss-cn-qingdao.aliyuncs.com/Regular/";
  static const String packageImgUrl = "https://dev.app.saladbar.sa/storage/";
  static const String MoyasarAPIKey =
      "pk_test_TzNwxV5x7e1oofUcPGwQHHcP4HFUN8zUgrMx2ycL";

  static const apiUrl = '/api/v1';
  static const headers = {'Content-Type': 'application/json; charset=UTF-8'};
  static const pageSize = 10;

  static Future<Map<String, String>> getHeaders(
      {String contentType = "application/json"}) async {
    DateTime now = DateTime.now();
    // String date = DateFormat('yyyy-MM-dd').format(now);
    Map<String, String> headers = <String, String>{
      "Cache-Control": "no-cache",
      "Content-Type": contentType,
      "x-api-key": "",
      "Accept":contentType,
      // "x-request-date": date,
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
    // log(headers.toString());
    return headers;
  }
}
