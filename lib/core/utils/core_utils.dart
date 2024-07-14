import 'package:flutter/material.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:intl/intl.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/widgets/error_alert_dialog.dart';
import '../common/widgets/success_alert_dialog.dart';
import '../res/styles/colours.dart';
import '../services/router.dart';

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
        builder: (context) => const CustomCircularProgressIndicator());
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


// Function to format the complete date and time
  static String formatDateTime(String date) {
    print("formatDateTime $date");
    DateFormat inputFormat = DateFormat("yyyy/M/d HH:mm:ss");
    final dateTime= inputFormat.parse(date);

    DateFormat outputFormat = DateFormat('dd MMM yyyy hh:mm:ss a');
    String formattedDate = outputFormat.format(dateTime);
    return formattedDate;
  }

// Function to get the date part only
  static String getFormattedDate(String date) {
    print("getFormattedDate $date");
    DateFormat inputFormat = DateFormat("yyyy/M/d HH:mm:ss");

    final dateTime= inputFormat.parse(date);

    // DateTime dateTime = DateTime.parse(dateTimeString);
    DateFormat dateFormat = DateFormat('dd MMM yyyy');
    String formattedDate = dateFormat.format(dateTime);
    return formattedDate;
  }

// Function to get the time part only
  static String getFormattedTime(String date) {
    print("getFormattedTime $date");
    DateFormat inputFormat = DateFormat("yyyy/M/d HH:mm:ss");

    final dateTime= inputFormat.parse(date);

    DateFormat timeFormat = DateFormat('hh:mm:ss a');
    String formattedTime = timeFormat.format(dateTime);
    return formattedTime;
  }

  static String getAmOrPm(String date) {
    DateFormat inputFormat = DateFormat("yyyy/M/d HH:mm:ss");

    print("getAmOrPm $date");
   final dateTime= inputFormat.parse(date);
    // Define the output format to get only the AM or PM part
    DateFormat amPmFormat = DateFormat('a');

    // Format the DateTime object to get only the AM or PM part
    String amOrPm = amPmFormat.format(dateTime);
    String formattedAmOrPm = "${amOrPm.split('').join('.').toUpperCase()}.";


    return formattedAmOrPm;
  }
}
