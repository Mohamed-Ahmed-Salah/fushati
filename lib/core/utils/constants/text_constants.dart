import '../../common/singletons/cache.dart';

abstract class TextConstants {
  static const String starterLangCode = "en";
  static const String font = "Sans-Arabic";

  static const whatsAppPhoneNumber = "";
  static const closeEn = "Close";
  static const closeAr = "اغلق";
  static const okayAr = "تأكيد";
  static const okayEn = "Okay";
  static const doneAr = "تأكيد";
  static const doneEn = "Done";
  static const amountAddedEn = "SAR have been credited to your card";
  static const amountAddedAr = "تم إضافة المبلغ إلى بطاقتك";


  static const successPaymentEn = "Successful Payment";
  static const successPaymentAr = "تم التحويل بنجاح";

  static const successEn = "Success";
  static const successAr = "نجاح";
  static const userEditedSuccessEn = "User edited Successfully!!";
  static const userEditedSuccessAr = "تم التعديل بنجاح!";

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
      case doneEn:
        return doneAr;
      case successPaymentEn:
        return successPaymentAr;
      case amountAddedEn:
        return amountAddedAr;
      case successEn:
        return successAr;
      case userEditedSuccessEn:
        return userEditedSuccessAr;




    }
    return okayAr;
  }

  static String getEnglishText({required String text}) {
    switch (text) {
      case closeEn:
        return closeEn;
      case okayEn:
        return okayEn;
      case doneEn:
        return doneEn;
      case successPaymentEn:
        return successPaymentEn;
      case amountAddedEn:
        return amountAddedEn;
      case successEn:
        return successEn;

      case userEditedSuccessEn:
        return userEditedSuccessEn;
    }
    return okayEn;
  }
}
