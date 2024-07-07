import 'package:flutter/material.dart';
import 'package:fushati/core/utils/constants/text_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utils/constants/size_constatnts.dart';
import '../styles/colours.dart';

abstract class CustomTheme {

  static const textFieldTextStyle = TextStyle(fontWeight: FontWeight.w400);
  static final notSelectedDaysBoxDecoration = BoxDecoration(
      color: Colours.greyColor.withOpacity(0.16),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      shape: BoxShape.rectangle);

  static AppBarTheme appBarLightTheme = const AppBarTheme(
    backgroundColor: Colours.whiteColor,
    elevation: 0,
    iconTheme: IconThemeData(color: Colours.textBlackColor),
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colours.textBlackColor,
    ),
  );

  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colours.primaryGreenColor,
      disabledBackgroundColor: Colours.primaryGreenColor,
      disabledForegroundColor: Colours.blackColor,
      foregroundColor: Colours.blackColor,
      //change background color of button
      minimumSize: Size(100.w, 6.h),
      textStyle: TextStyle(
          fontSize: 16.px,
          fontWeight: FontWeight.w500,
          color: Colours.blackColor),
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.all(Radius.circular(SizeConst.horizontalPaddingFour)),
      ),
    ),
  );

  static TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colours.primaryGreenColor,
      textStyle: const TextStyle(
          color: Colours.primaryGreenColor, fontFamily: TextConstants.font),
    ),
  );

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    fillColor: Colours.whiteColor,
    filled: true,

    labelStyle: const TextStyle(
        color: Colours.blackColor,
        fontWeight: FontWeight.w500,
        fontFamily: TextConstants.font),
    hintStyle:  TextStyle(
        color: Colours.hintTextColor,
        fontWeight: FontWeight.w500,
        fontFamily: TextConstants.font),

      errorStyle:  TextStyle(
      color: Colours.errorColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      fontFamily: TextConstants.font),
    contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),

    // prefixIconColor: AppColors.primaryColor,
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(SizeConst.horizontalPaddingFour)),
      borderSide:  BorderSide(
        width: 1.5,
        color: Colours.borderGreyColor,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(SizeConst.horizontalPaddingFour)),
      borderSide:  BorderSide(
        width: 1.5,
        color: Colours.borderGreyColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(SizeConst.horizontalPaddingFour)),
      borderSide: const BorderSide(
        width: 1.5,
        color: Colours.blackColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.all(Radius.circular(SizeConst.horizontalPaddingFour)),
      borderSide: const BorderSide(
        width: 1.5,
        color: Colours.errorColor,
      ),
    ),
  );

  static RadioThemeData radioThemeData = RadioThemeData(
    fillColor: WidgetStateProperty.all(Colours.primaryGreenColor),
  );

  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      // accentColor: Colors.blue,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(secondary: Colours.primaryGreenColor),
      bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent, elevation: 0),
      fontFamily: TextConstants.font,
      primaryColor: Colours.primaryGreenColor,
      scaffoldBackgroundColor: Colours.whiteColor,
      appBarTheme: appBarLightTheme,
      iconTheme: const IconThemeData(color: Colours.textBlackColor),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 18.sp),
        displaySmall: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
        displayMedium: TextStyle(
          color: Colours.blackColor,
          fontFamily: TextConstants.font,
          fontSize: 25.sp,
        ),
        bodySmall: TextStyle(
            color: Colours.textBlackColor,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500),
        displayLarge: TextStyle(
            color: Colours.blackColor,
            fontFamily: TextConstants.font,
            fontSize: 31.sp,
            fontWeight: FontWeight.w900),
        titleMedium: TextStyle(
            fontFamily: TextConstants.font,
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
            color: Colours.textBlackColor),
        headlineLarge: TextStyle(
          fontFamily: TextConstants.font,
          fontWeight: FontWeight.w700,
          fontSize: 23.sp,
        ),
        headlineMedium: TextStyle(
            fontFamily: TextConstants.font,
            fontWeight: FontWeight.w500,
            fontSize: 23.sp,
            color: Colours.textBlackColor),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        headlineSmall: TextStyle(
            fontSize: 23.5.sp,
            fontWeight: FontWeight.w500,
            color: Colours.textBlackColor),
        titleSmall: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: Colours.textBlackColor),
        bodyMedium: TextStyle(color: Colours.textBlackColor, fontSize: 14.5.sp),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colours.textBlackColor,
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      // outlinedButtonTheme: outlinedButtonTheme(),
      textButtonTheme: textButtonThemeData,
      inputDecorationTheme: lightInputDecorationTheme,
      radioTheme: radioThemeData,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colours.primaryGreenColor,
        // Set the default background color
        foregroundColor: Colors.white,
        // Set the default icon color
        shape: CircleBorder(),
      ),
    );
  }
}
