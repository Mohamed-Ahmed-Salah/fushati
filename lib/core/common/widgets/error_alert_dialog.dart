import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/media.dart';
import '../../res/styles/colours.dart';
import '../../utils/constants/size_constatnts.dart';

class ErrorAlertDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onPressed;

  const ErrorAlertDialog(
      {super.key, required this.title, required this.subtitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colours.whiteColor,
                border: Border.all(color: Colours.borderGreyColor),
                boxShadow: [
                  BoxShadow(
                    color: Colours.blackColor.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConst.borderRadius),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeConst.horizontalPadding),
                child: Material(
                  color: Colors.transparent,
                  elevation: 0,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(SizeConst.horizontalPadding),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(Media.warningSvg),
                          SizedBox(
                            height: SizeConst.verticalPadding,
                          ),
                          Text(
                            title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                    color: Colours.yellowWarningColor,
                                    fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: Colours.textBlackColor
                                        .withOpacity(0.7)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: SizeConst.verticalPadding,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: Colours.lightGreyButton,
                                  ),
                                  onPressed: () {
                                    context.pop();
                                  },
                                  child: Text(
                                    "${AppLocalizations.of(context)?.cancel}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: SizeConst.horizontalPadding,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: onPressed,
                                  child: Text(
                                    "${AppLocalizations.of(context)?.tryAgian}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
