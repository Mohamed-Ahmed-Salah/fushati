import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fushati/core/common/widgets/green_background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PolicyView extends StatelessWidget {
  const PolicyView({super.key});

  static String path = "/policy";
  static String name = "/policy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreenBackground(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConst.horizontalPadding),
        child: ListView(
          children: [
            SizedBox(
              height: SizeConst.verticalPaddingFour,
            ),
            Row(
              children: [
                Image.asset(Media.policyImg),
                SizedBox(
                  width: SizeConst.horizontalPadding,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)?.termsAndCondition}",
                        style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: Colours.primaryGreenColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConst.verticalPadding,
            ),
            Text(
              "- ${AppLocalizations.of(context)?.p1}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
            SizedBox(
              height: SizeConst.verticalPadding,
            ),
            Text(
              "${AppLocalizations.of(context)?.p2}",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colours.primaryGreenColor),
            ),
            SizedBox(
              height: SizeConst.verticalPadding,
            ),
            Text(
              "1.${AppLocalizations.of(context)?.p3}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colours.primaryGreenColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text("${AppLocalizations.of(context)?.p4}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colours.textBlackColor)),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "${AppLocalizations.of(context)?.p5}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400, color: Colours.textBlackColor),
            ),
            SizedBox(
              height: SizeConst.verticalPadding,
            ),
            Text(
              "2.${AppLocalizations.of(context)?.p6}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colours.primaryGreenColor),
            ),
            SizedBox(
              height: SizeConst.verticalPadding,
            ),
            Text(
              "${AppLocalizations.of(context)?.p7}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400, color: Colours.textBlackColor),
            ),
            SizedBox(
              height: SizeConst.verticalPadding,
            ),
            Text(
              "3.${AppLocalizations.of(context)?.p8}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colours.primaryGreenColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "${AppLocalizations.of(context)?.p9}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400, color: Colours.textBlackColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "${AppLocalizations.of(context)?.p10}",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colours.primaryGreenColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "${AppLocalizations.of(context)?.p11}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400, color: Colours.textBlackColor),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "${AppLocalizations.of(context)?.p12}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400, color: Colours.textBlackColor),
            ),
          ],
        ),
      )),
    );
  }
}
