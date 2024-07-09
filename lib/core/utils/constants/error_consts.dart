import '../../common/singletons/cache.dart';

abstract class ErrorConst {
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

  // static const String INVALID_PHONE =
  //     'Error : \n Please Enter a Valid Phone Number Starting 966';
  static const String OTP_NOT_FOUND = 'Invalid OTP. Please try again.';
  static const String OTP_NOT_FOUND_AR = 'Invalid OTP. Please try again.';

  // static const String AUTH_ERROR = 'Please Login Again';

  // static const String UNKNOWN_SERVER_ERROR =
  //     'Unknown Server Error. Please Contact Dev';

  static const String alreadySubscribedEn =
      "You are already subscribed to this package.";
  static const String alreadySubscribedAr = "أنت مشترك بالفعل في هذه الباقة.";
  static const String notEnoughBalanceEn =
      "There is not enough balance in your wallet";
  static const String notEnoughBalanceAr = "الرصيد في محفظتك غير كافٍ";
  static const String platformNotSupportedEn = "Platform not supported";
  static const String platformNotSupportedAr = "المنصة غير مدعومة";
  static const String ValidationErrorEn = "Validation failed";
  static const String ValidationErrorAr = "فشل التحقق";
  static const String wrongPhoneEn = "Wrong phone number";
  static const String wrongPhoneAr = "قم الهاتف خاطئ";
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
  static const String customerNotFoundEn = "Customer not found";
  static const String customerNotFoundAr = "العميل غير موجود";
  static const String failedToDeleteCustomerEn =
      "Failed to delete customer due to an unexpected error";
  static const String failedToDeleteCustomerAr =
      "فشل حذف العميل بسبب خطأ غير متوقع";
  static const String youCannotDropThisMachineEn =
      "You Can not drop from this machine";
  static const String youCannotDropThisMachineAr =
      "لا يمكنك انزال منتج من هذه الآلة";
  static const String NoEnoughProductsEn = "No enough products in machine";
  static const String NoEnoughProductsAr = "لا يوجد منتجات كافية في الآلة";
  static const String failedToDropProductEn = "Faild to drop product";
  static const String failedToDropProductAr = "حدث خطأ في إنزال المنتج";
  static const String cannotFindProductEn = "Can not find product";
  static const String cannotFindProductAr = "لا يمكن العثور على المنتج";
  static const String servererrorEn = "Server error";
  static const String cannotFindThisProcessEn = "Can not find this process";
  static const String cannotFindThisProcessAr =
      "لا يمكن العثور على هذه العملية";

  static const String servererrorAr = "خطأ في الخادم";
  static const String insufficientWalletBalanceEn =
      "Insufficient wallet balance";
  static const String insufficientWalletBalanceAr = "رصيد المحفظة غير كافٍ";
  static const String paymentIsNotSuccessfullEn =
      "Payment status is not successful";
  static const String paymentIsNotSuccessfullAr = "حالة الدفع ليست ناجحة";
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

  static const String otpErrorEn = "OTP Error";
  static const String otpErrorAr = "OTP Error";
  static const String couldNotSubscribeEn = "Could not Subscribe";
  static const String couldNotSubscribeAr = "حدث خطأ عند الاشتراك";
  static const String couldNotConnectToMoyasarEn =
      "Couldn't connect to payment gateway";
  static const String couldNotConnectToMoyasarAr = "تعذر الاتصال ببوابة الدفع ";

  static const String scanningFailedEn = "Scanning Failed";
  static const String scanningFailedAr = "فشل المسح";

  static const String youHaveToChooseOnlyFiveDaysEn =
      "You can only have 5 days subscriptions";

  static const String youHaveToChooseOnlyFiveDaysAr =
      "يجب الاشتراكات لمدة 5 أيام فقط";

  static const String cantSelectFridayOrSaturdayEn =
      "You currently can't subscribe meals on Saturday or Friday";
  static const String cantSelectFridayOrSaturdayAr =
      "حالياً لا مكن الاشتراك في الوجبات يومي السبت أو الجمعة";

  static const String pleaseSelectFiveDaysToSubEn =
      "Please select 5 days to subscribe";
  static const String pleaseSelectFiveDaysToSubAr =
      "يرجى اختيار 5 أيام للاشتراك";

  static const String unCompletedMealSelectionEn = "Uncompleted meal selection";
  static const String unCompletedMealSelectionAr = "اختيار الوجبات غير مكتمل";

  static const String youDidntSelectTheFollowingDaysEn =
      "Oops, it looks like you didn't complete your meal selection for the following days:";
  static const String youDidntSelectTheAllMealsDaysEn =
      "Oops, it looks like you didn't complete your meal selection for one or more days";
  static const String youDidntSelectTheAllMealsDaysAr =
      "عذرًا، يبدو أنك لم تُكمل اختيار وجباتك ليوم أو أكثر";
  static const String youDidntSelectTheFollowingDaysAr =
      "عفوًا، يبدو أنك لم تكمل اختيار وجبتك للأيام التالية:";

  static const String emailAlreadyTakenEn = "The email has already been taken";
  static const String emailAlreadyTakenAr =
      "البريد الإلكتروني تم استخدامه من حساب اخر";
  static const String FAILED_CHANGING_MEAL_MESSAGE =
      "Failed to change subscription product";
  static const String FAILED_CHANGING_MEAL_MESSAGEAR =
      "حدث خطأ في تغيير وجبه الاشتراك";

  static String getErrorBody({required String text}) {
    bool isArabic = Cache.instance.language == "ar";
    return isArabic
        ? getErrorArabicBody(text: text)
        : getErrorEnglishBody(text: text);
  }

  //21
  static String getErrorArabicBody({required String text}) {
    switch (text) {
      case youDidntSelectTheAllMealsDaysEn:
        return youDidntSelectTheAllMealsDaysAr;
      case FAILED_CHANGING_MEAL_MESSAGE:
        return FAILED_CHANGING_MEAL_MESSAGEAR;
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

      case insufficientWalletBalanceEn:
        return insufficientWalletBalanceAr;

      case servererrorEn:
        return servererrorAr;

      case cannotFindProductEn:
        return cannotFindProductAr;

      case failedToDropProductEn:
        return failedToDropProductAr;

      case NoEnoughProductsEn:
        return NoEnoughProductsAr;

      case youCannotDropThisMachineEn:
        return youCannotDropThisMachineAr;

      case customerNotFoundEn:
        return customerNotFoundAr;

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

      case wrongPhoneEn:
        return wrongPhoneAr;

      case ValidationErrorEn:
        return ValidationErrorAr;

      case platformNotSupportedEn:
        return platformNotSupportedAr;
      case notEnoughBalanceEn:
        return notEnoughBalanceAr;
      case alreadySubscribedEn:
        return alreadySubscribedAr;
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

      case youHaveToChooseOnlyFiveDaysEn:
        return youHaveToChooseOnlyFiveDaysAr;
      case pleaseSelectFiveDaysToSubEn:
        return pleaseSelectFiveDaysToSubAr;
      case youDidntSelectTheFollowingDaysEn:
        return youDidntSelectTheFollowingDaysAr;
      case OTP_NOT_FOUND:
        return OTP_NOT_FOUND_AR;

      case cantSelectFridayOrSaturdayEn:
        return cantSelectFridayOrSaturdayAr;

      case cannotFindThisProcessEn:
        return cannotFindThisProcessAr;
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
      case youDidntSelectTheAllMealsDaysEn:
        return youDidntSelectTheAllMealsDaysEn;
      case FAILED_CHANGING_MEAL_MESSAGE:
        return FAILED_CHANGING_MEAL_MESSAGE;
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

      case insufficientWalletBalanceEn:
        return insufficientWalletBalanceEn;

      case servererrorEn:
        return servererrorEn;

      case cannotFindProductEn:
        return cannotFindProductEn;

      case failedToDropProductEn:
        return failedToDropProductEn;

      case NoEnoughProductsEn:
        return NoEnoughProductsEn;

      case youCannotDropThisMachineEn:
        return youCannotDropThisMachineEn;

      case customerNotFoundEn:
        return customerNotFoundEn;

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

      case wrongPhoneEn:
        return wrongPhoneEn;

      case ValidationErrorEn:
        return ValidationErrorEn;

      case platformNotSupportedEn:
        return platformNotSupportedEn;
      case notEnoughBalanceEn:
        return notEnoughBalanceEn;
      case alreadySubscribedEn:
        return alreadySubscribedEn;
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

      case youHaveToChooseOnlyFiveDaysEn:
        return youHaveToChooseOnlyFiveDaysEn;

      case pleaseSelectFiveDaysToSubEn:
        return pleaseSelectFiveDaysToSubEn;
      case youDidntSelectTheFollowingDaysEn:
        return youDidntSelectTheFollowingDaysEn;

      case cantSelectFridayOrSaturdayEn:
        return cantSelectFridayOrSaturdayEn;

      case cannotRecieveOTPnowEnWithSpace:
        return cannotRecieveOTPnowEn;
      case cannotFindThisProcessEn:
        return cannotFindThisProcessEn;
    }
    if (text.contains(emailAlreadyTakenEn)) {
      return emailAlreadyTakenEn;
    }
    return UNKNOWN_ERROR;
  }

  static String getErrorArabicTile({required String title}) {
    switch (title) {
      case otpErrorEn:
        return otpErrorAr;
      case errorEn:
        return errorAr;
      case couldNotSubscribeEn:
        return couldNotSubscribeAr;
      case scanningFailedEn:
        return scanningFailedAr;

      case couldNotConnectToMoyasarEn:
        return couldNotConnectToMoyasarAr;

      case unCompletedMealSelectionEn:
        return unCompletedMealSelectionAr;
    }

    return errorAr;
  }

  static String getErrorEnglishTile({required String title}) {
    switch (title) {
      case otpErrorEn:
        return otpErrorEn;
      case errorEn:
        return errorEn;
      case couldNotSubscribeEn:
        return couldNotSubscribeEn;
      case scanningFailedEn:
        return scanningFailedEn;

      case couldNotConnectToMoyasarEn:
        return couldNotConnectToMoyasarEn;

      case unCompletedMealSelectionEn:
        return unCompletedMealSelectionEn;
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
}
