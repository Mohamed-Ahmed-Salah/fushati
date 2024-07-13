import 'package:flutter/material.dart';
import 'package:fushati/core/res/media.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CustomCircularProgressIndicator());
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Lottie.asset(Media.loadingLottie, height: 9.h),
    );
  }
}
