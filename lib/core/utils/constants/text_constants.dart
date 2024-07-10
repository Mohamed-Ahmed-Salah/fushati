import '../../common/singletons/cache.dart';

abstract class TextConstants {
  static const String starterLangCode = "en";
  static const String font = "Sans-Arabic";

  static const whatsAppPhoneNumber = "";
  static const closeEn = "Close";
  static const closeAr = "اغلق";
  static const okayAr = "تأكيد";
  static const okayEn = "Okay";

  static String getText({required String text}) {
    bool isArabic = Cache.instance.language == "ar";
    return isArabic ? getArabicText(text: text) : getEnglishText(text: text);
  }

  static String getArabicText({required String text}) {
    switch (text) {
      case closeEn:
        return closeAr;
      case okayEn:
        return okayAr;
    }
    return okayAr;
  }

  static String getEnglishText({required String text}) {
    switch (text) {
      case closeEn:
        return closeEn;
      case okayEn:
        return okayEn;
    }
    return okayEn;
  }
}
