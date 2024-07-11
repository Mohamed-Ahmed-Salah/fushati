import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/widgets/close_button.dart';
import '../common/widgets/error_alert_dialog.dart';
import '../common/widgets/success_alert_dialog.dart';
import '../res/media.dart';
import '../res/styles/colours.dart';
import '../services/router.dart';
import 'constants/size_constatnts.dart';

abstract class CoreUtils {
  const CoreUtils();

  static void showSnackBar({required String message, Widget? widget}) {
    final snackBar = SnackBar(
      backgroundColor: Colours.yellowWarningColor,
      // backgroundColor: Colours.lightThemePrimaryColour,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: [
          const Icon(
            Icons.info,
            color: Colours.whiteColor,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                message,
                style: TextStyle(color: Colours.whiteColor, fontSize: 16.sp),
              ),
            ),
          ),
          if (widget != null) widget,
        ],
      ),
      duration: _calculateDuration(message),
    );
    scaffoldKey.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
    //
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //
    //
    //
    //     // ..showSnackBar(snackBar);
    //   //
    //   // showSnackBar(SnackBar(content: Text(content)));
    //   //
    //   // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   //
    //   //   ScaffoldMessenger.of(context)
    //   //     ..removeCurrentSnackBar()
    //   //     ..showSnackBar(snackBar);
    //   // });
    // });
  }

  static void showSuccessSnackBar(
      {required String title, required String subtitle}) {
    final snackBar = SnackBar(
      backgroundColor: Colours.whiteColor,
      // backgroundColor: Colours.lightThemePrimaryColour,
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Colours.primaryGreenColor,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colours.textBlackColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colours.textBlackColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      duration: _calculateDuration("$title $subtitle"),
    );
    scaffoldKey.currentState
      ?..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
    //
    // SchedulerBinding.instance.addPostFrameCallback((_) {
    //
    //
    //
    //     // ..showSnackBar(snackBar);
    //   //
    //   // showSnackBar(SnackBar(content: Text(content)));
    //   //
    //   // SchedulerBinding.instance.addPostFrameCallback((_) {
    //   //
    //   //   ScaffoldMessenger.of(context)
    //   //     ..removeCurrentSnackBar()
    //   //     ..showSnackBar(snackBar);
    //   // });
    // });
  }

  static Duration _calculateDuration(String message) {
    // Average reading speed in words per minute
    const int averageWPM = 200;

    // Average word length in characters
    const int averageWordLength = 10;

    // Calculate milliseconds per character based on average reading speed
    const int millisecondsPerWord = (150 * 1000) ~/ averageWPM;
    const int millisecondsPerCharacter =
        millisecondsPerWord ~/ averageWordLength;

    // Calculate the duration based on the length of the message
    final int durationInMilliseconds =
        message.length * millisecondsPerCharacter;

    // Limit the duration to a reasonable maximum
    const int maxDurationMilliseconds = 5000; // 5 seconds
    final int finalDuration =
        durationInMilliseconds.clamp(1000, maxDurationMilliseconds);

    return Duration(milliseconds: finalDuration);
  }

  static void showMyDialog({
    required String title,
    required String subTitle,
    required Function()? onPressed,
  }) {
    showDialog(
        context: rootNavigatorKey.currentContext!,
        builder: (context) => ErrorAlertDialog(
              title: title,
              subtitle: subTitle,
              onPressed: onPressed,
            ));
  }

  static void showLoadingDialog() {
    showDialog(
        context: rootNavigatorKey.currentContext!,
        builder: (context) => const CircularProgressIndicator());
  }

  static String todayDate() {
    DateFormat format = DateFormat("dd/MM/yyyy");
    DateTime today = DateTime.now();
    final dateFormated = format.format(today);

    return dateFormated;
  }

  static String formatNumberString(String input) {
    // Ensure the input is a numeric string
    // if (!RegExp(r'^\d+$').hasMatch(input)) {
    //   throw const FormatException('Input must be a numeric string');
    // }

    // Split the input string into chunks
    List<String> chunks = [];

    // Add the first chunk (3 digits)
    if (input.length >= 3) {
      chunks.add(input.substring(0, 3));
      input = input.substring(3);
    }

    // Add the second chunk (2 digits)
    if (input.length >= 2) {
      chunks.add(input.substring(0, 2));
      input = input.substring(2);
    }

    // Add the third chunk (3 digits)
    if (input.length >= 3) {
      chunks.add(input.substring(0, 3));
      input = input.substring(3);
    }

    // Add the remaining chunk (if any)
    if (input.isNotEmpty) {
      chunks.add(input);
    }

    // Join the chunks with spaces
    return chunks.join('  ');
  }

  static void showSuccess({
    required String title,
    required String subTitle,
    required Function()? onPressed,
  }) {
    showDialog(
        context: rootNavigatorKey.currentContext!,
        builder: (context) => SuccessAlertDialog(
          title: title,
          subtitle: subTitle,
          onPressed: onPressed,
        ));

  }
}
