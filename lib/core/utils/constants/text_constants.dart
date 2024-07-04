import '../../common/singletons/cache.dart';

abstract class TextConstants {
  static const String starterLangCode = "en";

  static const closeEn = "Close";
  static const closeAr = "اغلق";

  static String getText({required String text}) {
    bool isArabic = Cache.instance.language == "ar";
    return isArabic ? getArabicText(text: text) : getEnglishText(text: text);
  }

  static String getArabicText({required String text}) {
    switch (text) {
      case closeEn:
        return closeAr;
    }
    return "okayAr";
  }

  static String getEnglishText({required String text}) {
    switch (text) {
      case closeEn:
        return closeEn;
    }
    return "okayEn";
  }
}
