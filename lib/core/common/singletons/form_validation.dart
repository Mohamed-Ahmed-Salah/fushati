import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

abstract class TextFormValidation {
  TextFormValidation._();

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
    return null;
  }

  static String? saudiPhoneValidation(String? value,
      {required BuildContext context}) {
    if (value == null) return requiredField("", context: context);
    if (value.isEmpty) return requiredField(value, context: context);
    if (!RegExp(r"^[0-9]+$|[.][0-9]+$").hasMatch(value!)) {
      return "${AppLocalizations.of(context)?.fieldOnlyNumbers}";
    }
    if (value.length < 12) {
      return "${AppLocalizations.of(context)?.onlyTwelveNumber}";
    }
    if (value.startsWith("0")) {
      return "${AppLocalizations.of(context)?.fieldDontStartWithZero}";
    }
    if (!value.startsWith("9665")) {
      return "${AppLocalizations.of(context)?.fieldShouldStartWithKsa}";
    }
    return null;
  }

  static String? requiredField(String? value, {required BuildContext context}) {
    if (value == null ||
        value == false ||
        value.isEmpty ||
        ((value is Iterable || value is Map) && value.isEmpty)) {
      return "${AppLocalizations.of(context)?.requiredField}";
    }
    return null;
  }

  static String? minBalance(String? value, {required BuildContext context}) {
    if (value == null) return requiredField("", context: context);
    if (value.isEmpty) return requiredField(value, context: context);

    // Try to parse the value to an integer
    final intValue = int.tryParse(value);
    if (intValue == null) {
      return "${AppLocalizations.of(context)?.invalidNumber}";
    }
    // Validate if the value is greater than or equal to 20
    if (intValue < 20) {
      return "${AppLocalizations.of(context)?.minBalance}";
    }
    return null;
  }

  static String? requiredFieldNoMessage(String? value,
      {required BuildContext context}) {
    if (value == null ||
        value == false ||
        value.isEmpty ||
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
    if (value!.isEmpty) return requiredField(value, context: context);
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
    if (value!.isEmpty) return requiredField(value, context: context);
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
    if (value.isEmpty) {
      return "${AppLocalizations.of(context)?.enterFullName}";
    } else if (!regExp.hasMatch(value!)) {
      return "${AppLocalizations.of(context)?.enterValidFullName}";
    }
    return null;
  }

  static String? otpValidation(String? value, {required BuildContext context}) {
    if (value!.isEmpty) return requiredField(value, context: context);
    if (!RegExp(r"^[0-9]+$|[.][0-9]+$").hasMatch(value!)) {
      return "${AppLocalizations.of(context)?.fieldOnlyNumbers}";
    }
    if (value.length < 4) {
      return "${AppLocalizations.of(context)?.onlyFourNumber}";
    }
    return null;
  }
}
