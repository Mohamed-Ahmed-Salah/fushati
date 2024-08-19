import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/utils/constants/size_constatnts.dart';

class NfcLoader extends StatelessWidget {
  const NfcLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: SizeConst.horizontalPadding),
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
              color: Colours.whiteColor,
              borderRadius: BorderRadius.all(
                  Radius.circular(SizeConst.borderDoubleRadius))),
          child: Material(
            color: Colors.transparent,
            elevation: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: SizeConst.verticalPadding,
                ),
                Lottie.asset(Media.nfcLottie, height: 25.h),
                SizedBox(
                  height: SizeConst.verticalPadding,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConst.horizontalPadding),
                  child: Text(
                    "${AppLocalizations.of(context)?.readingNfc}",
                    style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: SizeConst.verticalPaddingFour,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
