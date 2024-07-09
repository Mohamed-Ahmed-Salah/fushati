import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/common/widgets/custome_appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/size_constatnts.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> drawerKey;

  const CustomHomeAppBar({super.key, required this.drawerKey});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConst.horizontalPadding,
            vertical: SizeConst.verticalPadding),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                drawerKey.currentState?.openDrawer();
              },
              child: Container(
                padding: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Colours.blackColor.withOpacity(0.1)),
                    borderRadius: BorderRadius.all(Radius.circular(2.w))),
                child: const Icon(
                  Media.menuIcon,
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
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(100.w, 10.h);
}
