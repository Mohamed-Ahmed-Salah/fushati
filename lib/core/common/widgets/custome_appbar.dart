import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/media.dart';
import '../../res/styles/colours.dart';
import '../../utils/constants/size_constatnts.dart';

class CustomAppBar extends StatelessWidget {
  final String? text;
  final bool showBackButton;

  const CustomAppBar({super.key, this.showBackButton = true, this.text});

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
                child: Icon(
                  Media.backIOSIcon,
                  size: SizeConst.iconSize,
                )),
          ),
        SizedBox(
          width: SizeConst.horizontalPaddingFour,
        ),
        if (text == null)
          SvgPicture.asset(
            Media.logoSvg,
            height: 5.h,
            // width: SizeConst.iconSize,
          ),
        if (text != null)
          Text(
            text!,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colours.textBlackColor,
                ),
          ),
      ],
    );
  }
}
