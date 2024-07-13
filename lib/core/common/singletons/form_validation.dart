import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class TextFormValidation {
  // TextFormValidation._();

  static String? phoneValidation(String? value,
      {required BuildContext context}) {
    if (value == null) return requiredField("", context: context);
    if (value.isEmpty) return requiredField(value, context: context);
    if (!RegExp(r"^[0-9]+$|[.][0-9]+$").hasMatch(value!)) {
      return "${AppLocalizations.of(context)?.fieldOnlyNumbers}";
    }
    if (value.length < 9) {
      return "${AppLocalizations.of(context)?.onlyNineNumber}";
    }
    if (value.startsWith("0")) {
      return "${AppLocalizations.of(context)?.fieldDontStartWithZero}";
    }
  }

  static String? requiredField(String? value, {required BuildContext context}) {
    if (value == null ||
        value == false ||
        value.length == 0 ||
        ((value is Iterable || value is Map) && value.isEmpty)) {
      return "${AppLocalizations.of(context)?.requiredField}";
    }
    return null;
  }

  static String? requiredFieldNoMessage(String? value,
      {required BuildContext context}) {
    if (value == null ||
        value == false ||
        value.length == 0 ||
        ((value is Iterable || value is Map) && value.isEmpty)) {
      return "";
    }
    return null;
  }

  static String? optionalEmailValidation(String? value,
      {required BuildContext context}) {
    if (value!.isEmpty) return null;
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!(regex.hasMatch(value!))) {
      return "${AppLocalizations.of(context)?.enterValidEmail}";
    }
    return null;
  }

  static String? emailValidation(String? value,
      {required BuildContext context}) {
    if (value!.length == 0) return requiredField(value, context: context);
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!(regex.hasMatch(value!))) {
      return "${AppLocalizations.of(context)?.enterValidEmail}";
    }
    return null;
  }

  static String? fullNameValidation(String? value,
      {required BuildContext context}) {
    if (value!.length == 0) return requiredField(value, context: context);
    // WhitelistingTextInputFormatter(RegExp("[a-z\u0621-\u064a-\ ]",unicode: true));

    bool hasNumbers = RegExp(r'[0-9]').hasMatch(value);
    bool hasNumbersAr = RegExp(r'[٠-٩]').hasMatch(value);

    bool hasSpecialChar = RegExp(r'[!@#%^&*(),.?":{}|<>]').hasMatch(value);

    if (hasSpecialChar) {
      return "${AppLocalizations.of(context)?.enterValidFullName}";
    }

    if (hasNumbers || hasNumbersAr) {
      return "${AppLocalizations.of(context)?.enterNameWithNoNumber}";
    }
    String pattern = "[a-z\u0621-\u064a-\ ]";
    RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "${AppLocalizations.of(context)?.enterFullName}";
    } else if (!regExp.hasMatch(value!)) {
      return "${AppLocalizations.of(context)?.enterValidFullName}";
    }
    return null;
  }

  static String? otpValidation(String? value, {required BuildContext context}) {
    if (value!.length == 0) return requiredField(value, context: context);
    if (!RegExp(r"^[0-9]+$|[.][0-9]+$").hasMatch(value!)) {
      return "${AppLocalizations.of(context)?.fieldOnlyNumbers}";
    }
    if (value.length < 4) {
      return "${AppLocalizations.of(context)?.onlyFourNumber}";
    }
  }
}
