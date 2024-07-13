import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/res/styles/colours.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../app/bloc/cubit/page_cubit.dart';

class BottomPageIndicator extends StatelessWidget {
  const BottomPageIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingPageCubit, PageState>(builder: (_, state) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: DotsIndicator(
          dotsCount: 3,
          position: state.currentIndexPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            color: Colours.brandColorTwo.withOpacity(0.2),
            // Inactive color
            activeColor: Colours.brandColorTwo,
          ),
        ),
      );
    });
  }
}
