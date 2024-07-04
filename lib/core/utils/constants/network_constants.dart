import '../../common/app/cache_helper.dart';
import '../../services/injection_container.dart';

abstract class NetworkConstants {
  static const baseUrl = 'https://dev.app.saladbar.sa/api/v1';
  static const String customerUrl = '$baseUrl/customers';
  static const String packageUrl = '$baseUrl/packages';
  static const String walletUrl = '$baseUrl/wallet';
  static const String workPlacesUrl = '$baseUrl/workplaces';
  static const String platformUrl = '$baseUrl/minimum-version';


  static const String productImgUrl =
      "https://ourvend-image.oss-cn-qingdao.aliyuncs.com/Regular/";
  static const String packageImgUrl = "https://dev.app.saladbar.sa/storage/";
  static const String TestAPIKey =
      "asdfghjkl12334";

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
