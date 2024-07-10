import 'package:flutter/material.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';

import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/media.dart';
import '../../res/styles/colours.dart';

class AlertLoadingWidget extends StatelessWidget {
  const AlertLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colours.whiteColor,
            borderRadius: BorderRadius.circular(5.w),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Material(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 7.h,
                      child: CircularProgressIndicator()),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text(
                      "Your transaction is being processed...",
                      textDirection: TextDirection.ltr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colours.textBlackColor.withOpacity(0.72)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text(
                      " ...نقوم الآن بمعالجة طلبك ",
                      textDirection: TextDirection.ltr,

                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colours.textBlackColor.withOpacity(0.72)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
