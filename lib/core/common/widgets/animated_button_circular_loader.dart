import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/styles/colours.dart';

class AnimatedButtonCircularLoader extends StatelessWidget {
  final bool loading;

  final Color? color;
  const AnimatedButtonCircularLoader({super.key, required this.loading ,this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(milliseconds: 300),
      secondCurve: Curves.easeInOut,
      firstCurve: Curves.easeInOut,
      firstChild: Container(
        height: 2.5.h,
        width: 2.5.h,
        margin: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(
          color:color?? Colours.whiteColor.withOpacity(0.7),
        ),
      ),
      secondChild: const SizedBox.shrink(),
      crossFadeState:
      loading ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}
