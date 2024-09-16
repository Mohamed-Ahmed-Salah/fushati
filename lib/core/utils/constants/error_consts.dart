import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/singletons/cache.dart';

abstract class ErrorConst {
  static const String paymentFailedMessage = "auth.Payment not found";
  static const String paymentFailedMessageEn =
      "The transaction was not successful. Please try again";
  static const String paymentFailedMessageAr =
      "التحويل لم تنجح. يرجى المحاولة مرة أخرى";
  static const String failedToStartAppConnectionEn =
      "Connection error. Check your internet and restart the app.";
  static const String failedToStartAppEn =
      "App failed to start. Check your connection and try again.";

  static const String failedToStartAppConnectionAr =
      "خطأ في الاتصال. تحقق من الإنترنت وأعد تشغيل التطبيق.";
  static const String failedToStartAppAr =
      "فشل في تشغيل التطبيق. تحقق من الاتصال وحاول مرة أخرى.";

  static const String PROFILE_NOT_COMPLETED_MESSAGE =
      "please complete your profile";

  static const String PROFILE_NOT_COMPLETED_MESSAGE_AR =
      "يرجى استكمال الحساب الشخصي الخاص بك";

  //
  static const String NO_INTERNET_MESSAGE =
      'Connection Error. Please try again';
  static const String NO_TOKEN = 'Unauthorized please try to login again.';

  static const String NO_TOKEN_AR =
      'غير مصرح لك. يرجى محاولة تسجيل الدخول مرة أخرى.';

  static const String TIMEOUT_MESSAGE = 'Connection Error. Please try again';

  static const String TIMEOUT_MESSAGE_AR =
      'حدث خطأ في الإتصال الرجاء اعاده المحاوله';
  static const String UNKOWN_MIN_VERSION_MESSAGE =
      'Version Error: Something Went Wrong Please try again Later.';
  static const String UNKOWN_MIN_VERSION_MESSAGE_AR =
      'خطأ في الإصدار: حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقًا.';
  static const String somethignWentWrongEn =
      'Something Went Wrong Please try again.';
  static const String somethignWentWrongAr = "حدث خطأ ما. أعد المحاولة مجددا";

  static const String CACHE_NOT_FOUND_MESSAGE =
      'Your session has expired please login again';

  static const String CACHE_NOT_FOUND_MESSAGE_AR =
      'لقد انتهت جلستك يرجى تسجيل الدخول مرة أخرى';

  static const String UNKNOWN_ERROR = 'Unknown Error. Please Contact Support';

  static const String UNKNOWN_ERROR_AR =
      'حدث خطأ غير معروف. يرجى الاتصال بالدعم';

  static const String OTP_FAILURE_TRIES_ERROR = OTPWrongThreeTimeEn;

  static const String OTP_NOT_SENT_EN = 'Failed To Send OTP. Please try again.';
  static const String OTP_NOT_SENT_AR = 'حدث خطأ في إرسال OTP. حاول مرة اخرى';

  static const String OTP_NOT_FOUND = 'Invalid OTP. Please try again.';
  static const String OTP_NOT_FOUND_AR = 'Invalid OTP. Please try again.';

  static const String platformNotSupportedEn = "Platform not supported";
  static const String platformNotSupportedAr = "المنصة غير مدعومة";
  static const String ValidationErrorEn = "Validation failed";
  static const String ValidationErrorAr = "فشل التحقق";

  static const String OTPWrongThreeTimeEn =
      "You have exceeded 3 times of attempts. Please try logging in again";
  static const String OTPWrongThreeTimeAr =
      "لقد تجاوزت العدد المسموح به من المحاولات ثلاث مرات. يرجى محاولة تسجيل الدخول مرة أخرى";
  static const String invalidOtpEn = "Invalid OTP. Please try again";
  static const String invalidOtpAr =
      "رمز التحقق غير صحيح. يرجى المحاولة مرة أخرى";
  static const String serverErrorForOtpEn =
      "Server error, unable to verify OTP at this time";
  static const String serverErrorForOtpAr =
      "خطأ في الخادم، لا يمكن التحقق من رمز التحقق في هذا الوقت";
  static const String errorEn = "Error";
  static const String errorAr = "خطأ";

  static const String failedToDeleteCustomerEn =
      "Failed to delete customer due to an unexpected error";
  static const String failedToDeleteCustomerAr =
      "فشل حذف العميل بسبب خطأ غير متوقع";

  static const String servererrorAr = "خطأ في الخادم";
  static const String servererrorEn = "Server Error";
  static const String couldNotLoadStudentDataEn =
      "Could not retrieve student history records.";
  static const String couldNotLoadStudentRecordsAr =
      "تعذر الحصول على سجلات تاريخ الطالب.";

  static const String couldNotLoadAllStudentDataEn =
      "Failed to retrieve history data for all students.";
  static const String couldNotLoadAllStudentRecordsAr =
      "تعذر الحصول على سجلات تاريخ الطلاب.";

  static const String failedToFecthMoyayasarDetailsEn =
      "Failed to fetch payment details from Moyasa";
  static const String failedToFecthMoyayasarDetailsAr =
      "فشل في جلب تفاصيل الدفع من مويسار";
  static const String errorOccuredEn = "An error occurred";
  static const String errorOccuredAr = "حدث خطأ";
  static const String cannotRecieveOTPnowEn = "Can not receive OTP message now";
  static const String cannotRecieveOTPnowEnWithSpace =
      " Can not recieve OTP message now";
  static const String cannotRecieveOTPnowEnWithWrongSpelling =
      "Can not recieve OTP message now";
  static const String cannotRecieveOTPnowAr =
      "لا يمكن تلقي رسالة OTP الآن الرجاء المحاوله لاحقا";

  static const String otpErrorEn = "Not Verified";
  static const String otpErrorAr = "غير مصرح لك بالدخول";

  static const String couldNotConnectToMoyasarEn =
      "Couldn't connect to payment gateway";
  static const String couldNotConnectToMoyasarAr = "تعذر الاتصال ببوابة الدفع ";

  static const String emailAlreadyTakenEn = "The email has already been taken";
  static const String emailAlreadyTakenAr =
      "البريد الإلكتروني تم استخدامه من حساب اخر";

  static const String CANNOT_FIND_CARD_EN =
      "Cannot find card, please make sure to insert a correct card number";
  static const String CANNOT_FIND_CARD_AR =
      "لا يمكن العثور على البطاقة، يرجى التأكد من إدخال رقم البطاقة الصحيح";

  static const String paymentFailedEn =
      "We were unable to process your transaction at this time. Please check your account details and try again later.";
  static const String paymentFailedAr =
      "فشل التحويل: لم نتمكن من معالجة المعاملة في هذا الوقت. يرجى التحقق من تفاصيل الحساب والمحاولة مرة أخرى لاحقًا.";
  static const String paymentIsNotSuccessfullEn =
      "Payment status is not successful";
  static const String paymentIsNotSuccessfullAr = "التحويل لم يتم بنجاح";
  static const String paymentFailedTitleEn = "Payment Failed";
  static const String paymentFailedTitleAr = "التحويل لم يتم بنجاح";

  static const String failedToCreateRelationship = "relationship_not_created";
  static const String failedToCreateRelationshipEn =
      "Unable to link card. Please check details and try again.";
  static const String failedToCreateRelationshipAr =
      "لم نتمكن نت ربط البطاقة. يرجى التحقق من ان البطاقه صحيحه والمحاولة مرة أخرى";
  static const String studentNotFound = "student_not_found";
  static const String couldNotReadCardNumberEn = "Could not read card number";
  static const String couldNotReadCardNumberAr =
      "لم نتمكن من قراءة رقم البطاقة";

  static String getErrorBody({required String text}) {
    bool isArabic = Cache.instance.language == "ar";
    print("TESETT $text");
    return isArabic
        ? getErrorArabicBody(text: text)
        : getErrorEnglishBody(text: text);
  }

  static String getErrorArabicBody({required String text}) {
    switch (text) {
      case paymentFailedMessage:
        return paymentFailedMessageAr;
      case failedToStartAppConnectionEn:
        return failedToStartAppConnectionAr;
      case failedToStartAppEn:
        return failedToStartAppAr;
      case couldNotReadCardNumberEn:
        return couldNotReadCardNumberAr;
      case failedToCreateRelationship:
        return failedToCreateRelationshipAr;
      case studentNotFound:
        return CANNOT_FIND_CARD_AR;
      case couldNotLoadAllStudentDataEn:
        return couldNotLoadAllStudentRecordsAr;
      case couldNotLoadStudentDataEn:
        return couldNotLoadStudentRecordsAr;
      case paymentFailedEn:
        return paymentFailedAr;
      case OTP_NOT_SENT_EN:
        return OTP_NOT_SENT_AR;
      case CANNOT_FIND_CARD_EN:
        return CANNOT_FIND_CARD_AR;

      case cannotRecieveOTPnowEnWithWrongSpelling:
        return cannotRecieveOTPnowAr;
      case cannotRecieveOTPnowEn:
        return cannotRecieveOTPnowAr;

      case errorOccuredEn:
        return errorOccuredAr;

      case failedToFecthMoyayasarDetailsEn:
        return failedToFecthMoyayasarDetailsAr;

      case paymentIsNotSuccessfullEn:
        return paymentIsNotSuccessfullAr;

      case servererrorEn:
        return servererrorAr;

      case failedToDeleteCustomerEn:
        return failedToDeleteCustomerAr;

      case errorEn:
        return errorAr;

      case serverErrorForOtpEn:
        return serverErrorForOtpAr;

      case invalidOtpEn:
        return invalidOtpAr;

      case OTPWrongThreeTimeEn:
        return OTPWrongThreeTimeAr;

      case ValidationErrorEn:
        return ValidationErrorAr;

      case platformNotSupportedEn:
        return platformNotSupportedAr;

      //--------------------------
      case UNKNOWN_ERROR:
        return UNKNOWN_ERROR_AR;

      case CACHE_NOT_FOUND_MESSAGE:
        return CACHE_NOT_FOUND_MESSAGE_AR;
      case somethignWentWrongEn:
        return somethignWentWrongAr;

      case UNKOWN_MIN_VERSION_MESSAGE:
        return UNKOWN_MIN_VERSION_MESSAGE_AR;
      case TIMEOUT_MESSAGE:
        return TIMEOUT_MESSAGE_AR;

      case NO_TOKEN:
        return NO_TOKEN_AR;

      case PROFILE_NOT_COMPLETED_MESSAGE:
        return PROFILE_NOT_COMPLETED_MESSAGE_AR;

      case couldNotConnectToMoyasarEn:
        return couldNotConnectToMoyasarAr;

      case OTP_NOT_FOUND:
        return OTP_NOT_FOUND_AR;

      case cannotRecieveOTPnowEnWithSpace:
        return cannotRecieveOTPnowAr;
    }

    if (text.contains(emailAlreadyTakenEn)) {
      return emailAlreadyTakenAr;
    }

    return UNKNOWN_ERROR_AR;
  }

  static String getErrorEnglishBody({required String text}) {
    switch (text) {
      case paymentFailedMessage:
        return paymentFailedMessageEn;
      case failedToStartAppConnectionEn:
        return failedToStartAppConnectionEn;
      case failedToStartAppEn:
        return failedToStartAppEn;

      case couldNotReadCardNumberEn:
        return couldNotReadCardNumberEn;
      case failedToCreateRelationship:
        return failedToCreateRelationshipEn;
      case studentNotFound:
        return CANNOT_FIND_CARD_EN;
      case couldNotLoadAllStudentDataEn:
        return couldNotLoadAllStudentDataEn;
      case couldNotLoadStudentDataEn:
        return couldNotLoadStudentDataEn;
      case paymentFailedEn:
        return paymentFailedEn;
      case OTP_NOT_SENT_EN:
        return OTP_NOT_SENT_EN;
      case CANNOT_FIND_CARD_EN:
        return CANNOT_FIND_CARD_EN;

      case cannotRecieveOTPnowEnWithWrongSpelling:
        return cannotRecieveOTPnowEn;
      case OTP_NOT_FOUND:
        return OTP_NOT_FOUND;
      case cannotRecieveOTPnowEn:
        return cannotRecieveOTPnowEn;

      case errorOccuredEn:
        return errorOccuredEn;

      case failedToFecthMoyayasarDetailsEn:
        return failedToFecthMoyayasarDetailsEn;

      case paymentIsNotSuccessfullEn:
        return paymentIsNotSuccessfullEn;

      case servererrorEn:
        return servererrorEn;

      case failedToDeleteCustomerEn:
        return failedToDeleteCustomerEn;

      case errorEn:
        return errorEn;

      case serverErrorForOtpEn:
        return serverErrorForOtpEn;

      case invalidOtpEn:
        return invalidOtpEn;

      case OTPWrongThreeTimeEn:
        return OTPWrongThreeTimeEn;

      case ValidationErrorEn:
        return ValidationErrorEn;

      case platformNotSupportedEn:
        return platformNotSupportedEn;

      //--------------------------
      case UNKNOWN_ERROR:
        return UNKNOWN_ERROR;

      case CACHE_NOT_FOUND_MESSAGE:
        return CACHE_NOT_FOUND_MESSAGE;
      case somethignWentWrongEn:
        return somethignWentWrongEn;

      case UNKOWN_MIN_VERSION_MESSAGE:
        return UNKOWN_MIN_VERSION_MESSAGE;
      case TIMEOUT_MESSAGE:
        return TIMEOUT_MESSAGE;

      case NO_TOKEN:
        return NO_TOKEN;

      case PROFILE_NOT_COMPLETED_MESSAGE:
        return PROFILE_NOT_COMPLETED_MESSAGE;

      case couldNotConnectToMoyasarEn:
        return couldNotConnectToMoyasarEn;

      case cannotRecieveOTPnowEnWithSpace:
        return cannotRecieveOTPnowEn;
    }
    if (text.contains(emailAlreadyTakenEn)) {
      return emailAlreadyTakenEn;
    }
    return UNKNOWN_ERROR;
  }

  static String getErrorArabicTile({required String title}) {
    switch (title) {
      case paymentFailedTitleEn:
        return paymentFailedTitleAr;
      case otpErrorEn:
        return otpErrorAr;
      case errorEn:
        return errorAr;

      case couldNotConnectToMoyasarEn:
        return couldNotConnectToMoyasarAr;
    }

    return errorAr;
  }

  static String getErrorEnglishTile({required String title}) {
    switch (title) {
      case paymentFailedTitleEn:
        return paymentFailedTitleEn;
      case otpErrorEn:
        return otpErrorEn;
      case errorEn:
        return errorEn;

      case couldNotConnectToMoyasarEn:
        return couldNotConnectToMoyasarEn;
    }

    return errorEn;
  }

  static String getErrorTitle({required String title}) {
    bool isArabic = Cache.instance.language == "ar";
    return isArabic
        ? getErrorArabicTile(title: title)
        : getErrorEnglishTile(title: title);
  }

  static String getError({required int statusCode}) {
    switch (statusCode) {
      case 200:
        return UNKNOWN_ERROR;
      case 401:
        return OTP_NOT_FOUND;
      case 402:
        return NO_TOKEN;
      case 403:
        return NO_TOKEN;
      case 429:
        return OTP_FAILURE_TRIES_ERROR;
      case 500:
        return UNKNOWN_ERROR;

      default:
        return UNKNOWN_ERROR;
    }
  }

  static String? localErrorValidation(BuildContext context, String message) {
    final localization = AppLocalizations.of(context);
    switch (message) {
      case 'validation.name_required':
        return localization?.validationNameRequired;
      case 'validation.name_string':
        return localization?.validationNameString;
      case 'validation.name_max':
        return localization?.validationNameMax;
      case 'validation.email_invalid':
        return localization?.validationEmailInvalid;
      case 'validation.email_max':
        return localization?.validationEmailMax;
      case 'validation.email_unique':
        return localization?.validationEmailUnique;
      case 'validation.password_string':
        return localization?.validationPasswordString;
      case 'validation.password_min':
        return localization?.validationPasswordMin;
      case 'validation.user_phone_required':
        return localization?.validationUserPhoneRequired;
      case 'validation.user_phone_string':
        return localization?.validationUserPhoneString;
      case 'validation.user_phone_max':
        return localization?.validationUserPhoneMax;
      case 'validation.user_phone_unique':
        return localization?.validationUserPhoneUnique;
      case 'validation.user_phone_invalid':
        return localization?.validationUserPhoneInvalid;
      case 'validation.department_string':
        return localization?.validationDepartmentString;
      case 'validation.department_max':
        return localization?.validationDepartmentMax;
      case 'validation.position_string':
        return localization?.validationPositionString;
      case 'validation.position_max':
        return localization?.validationPositionMax;
      case 'validation.user_number_max':
        return localization?.validationUserNumberMax;
      case 'validation.user_number_unique':
        return localization?.validationUserNumberUnique;
      case 'validation.user_card_required':
        return localization?.validationUserCardRequired;
      case 'validation.user_card_max':
        return localization?.validationUserCardMax;
      case 'validation.user_card_unique':
        return localization?.validationUserCardUnique;
      case 'validation.equipment_string':
        return localization?.validationEquipmentString;
      case 'validation.equipment_max':
        return localization?.validationEquipmentMax;
      case 'validation.identity_id_string':
        return localization?.validationIdentityIdString;
      case 'validation.identity_id_max':
        return localization?.validationIdentityIdMax;
      case 'validation.identity_id_unique':
        return localization?.validationIdentityIdUnique;
      case 'validation.role_string':
        return localization?.validationRoleString;
      case 'validation.type_required':
        return localization?.validationTypeRequired;
      case 'validation.type_string':
        return localization?.validationTypeString;
      case 'validation.type_invalid':
        return localization?.validationTypeInvalid;
      case 'validation.face_images_image':
        return localization?.validationFaceImagesImage;
      case 'validation.face_images_mimes':
        return localization?.validationFaceImagesMimes;
      case 'validation.face_images_max':
        return localization?.validationFaceImagesMax;
      default:
        return getErrorBody(text: message);
    }
  }
}
