import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/media.dart';
import '../../res/styles/colours.dart';
import '../../utils/constants/size_constatnts.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pop(),
      child: Container(
        padding: EdgeInsets.all(1.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colours.borderGreyColor),
            borderRadius:
                BorderRadius.all(Radius.circular(SizeConst.borderRadius))),
        child: Icon(
          Media.closeIcon,
          color: Colours.blackColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
