import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../singletons/cache.dart';

class CacheHelper {
  const CacheHelper(this._prefs);

  final SharedPreferences _prefs;
  static const _sessionTokenKey = 'user-session-token';
  static const _userIdKey = 'user-id';
  static const _firstTimerKey = 'is-user-first-timer';
  static const _userNameKey = 'user-name';
  static const _ipBaseUrlKey = 'fushati-ip-base-url';
  static const _language = 'fushati-language';

  Future<bool> setLanguage(String language) async {
    try {
      final result = await _prefs.setString(_language, language);
      Cache.instance.setLanguage(language);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> setBaseUrl(String baseUrl) async {
    try {
      final result = await _prefs.setString(_ipBaseUrlKey, baseUrl);
      Cache.instance.setIpBaseUrl(baseUrl);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> cacheSessionToken(String token) async {
    try {
      final result = await _prefs.setString(_sessionTokenKey, token);
      Cache.instance.setSessionToken(token);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> cacheUsername(String name) async {
    try {
      final result = await _prefs.setString(_userNameKey, name);
      Cache.instance.setUserName(name);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<bool> cacheUserId(int userId) async {
    try {
      final result = await _prefs.setInt(_userIdKey, userId);
      Cache.instance.setUserId(userId);
      return result;
    } catch (_) {
      return false;
    }
  }

  Future<void> cacheFirstTimer() async {
    Cache.instance.setFirstTime(false);
    await _prefs.setBool(_firstTimerKey, false);
  }

  String? getSessionToken() {
    final sessionToken = _prefs.getString(_sessionTokenKey);
    if (sessionToken != null) {
      debugPrint('getSessionToken: Session Token exists');
      Cache.instance.setSessionToken(sessionToken);
    } else {
      debugPrint('getSessionToken: session does not exist');
    }
    return sessionToken;
  }

  String? getBaseUrl() {
    final baseUrl = _prefs.getString(_ipBaseUrlKey);
    if (baseUrl != null) {
      debugPrint('_ipBaseUrlKey: Session _ipBaseUrlKey exists');
      Cache.instance.setIpBaseUrl(baseUrl);
    } else {
      debugPrint('getBaseUrl: session does not exist');
    }
    return baseUrl;
  }

  String? getUserName() {
    // _prefs.remove(_sessionTokenKey);
    // _prefs.remove(_userIdKey);
    // _prefs.remove(_firstTimerKey);
    final username = _prefs.getString(_userNameKey);
    if (username != null) {
      // debugPrint('getSessionToken: Session Token exists');
      Cache.instance.setUserName(username);
    } else {
      // debugPrint('getSessionToken: session does not exist');
    }
    return username;
  }

  String? getLanguage() {
    // _prefs.remove(_sessionTokenKey);
    // _prefs.remove(_userIdKey);
    // _prefs.remove(_firstTimerKey);
    final language = _prefs.getString(_language);
    if (language != null) {
      // debugPrint('language: Session language exists');
      Cache.instance.setLanguage(language);
    } else {
      // debugPrint('language: language language not exist');
    }
    return language;
  }

  int? getUserId() {
    final userId = _prefs.getInt(_userIdKey);
    if (userId != null) {
      Cache.instance.setUserId(userId);
    } else {}
    return userId;
  }

  Future<void> resetSession() async {
    await _prefs.remove(_sessionTokenKey);
    await _prefs.remove(_userIdKey);
    await _prefs.remove(_firstTimerKey);
    await _prefs.remove(_language);

    Cache.instance.resetSession();
  }

  Future<void> logout() async {
    await _prefs.remove(_sessionTokenKey);
    await _prefs.remove(_userIdKey);
    // await _prefs.remove(_firstTimerKey);
    // getUserId();
    Cache.instance.logout();
  }

  bool isFirstTime() {
    bool isFirstTime = _prefs.getBool(_firstTimerKey) ?? true;
    Cache.instance.setFirstTime(isFirstTime);
    return isFirstTime;
  }
}
