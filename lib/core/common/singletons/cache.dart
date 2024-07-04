
import '../../utils/constants/text_constants.dart';

class Cache {
  Cache._internal();

  static final Cache instance = Cache._internal();

  String? _sessionToken;
  String? _name;
  String? _language;

  int? _userId;
  bool? _firstTime;

  String? get sessionToken => _sessionToken;

  int? get userId => _userId;

  String? get language => _language ?? TextConstants.starterLangCode;

  bool get firstTime => _firstTime ?? false;

  String? get name => _name;

  bool isLoggedOut() {
    return ((Cache.instance.sessionToken == null ||
            Cache.instance.userId == null) &&
        !Cache.instance.firstTime);
  }

  void setSessionToken(String? newToken) {
    if (_sessionToken != newToken) _sessionToken = newToken;
  }

  void setLanguage(String? setLanguage) {
    if (_language != setLanguage) _language = setLanguage;
  }

  void setUserName(String? name) {
    if (_name != name) _name = name;
  }

  void setUserId(int? userId) {
    if (_userId != userId) _userId = userId;
  }

  void setFirstTime(bool? firstTime) {
    if (_firstTime != firstTime) _firstTime = firstTime;
  }

  void resetSession() {
    setSessionToken(null);
    setUserId(null);
    setFirstTime(true);
    setUserName(null);
    setLanguage(null);
  }

  void logout() {
    setSessionToken(null);
    setUserId(null);
    // setFirstTime(true);
    setUserName(null);
  }
}
