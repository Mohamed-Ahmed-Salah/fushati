import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/media.dart';
import '../../res/styles/colours.dart';
import '../../utils/constants/size_constatnts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomAppBar extends StatelessWidget {
  final bool showBackButton;

  const CustomAppBar({super.key, this.showBackButton = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (showBackButton)
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Container(
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colours.blackColor.withOpacity(0.1)),
                  borderRadius: BorderRadius.all(Radius.circular(2.w))),
              child: AppLocalizations.of(context)?.localeName == "en"
                  ? Icon(
                Media.backIOSIcon,
                size: SizeConst.iconSize,
              )
                  : Icon(
                Media.backIOSARIcon,
                size: SizeConst.iconSize,
              ),
            ),
          ),
        SizedBox(
          width: SizeConst.horizontalPaddingFour,
        ),
        SvgPicture.asset(
          Media.logoSvg,
          height: 5.h,
          // width: SizeConst.iconSize,
        ),
      ],
    );
  }
}
