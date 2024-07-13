import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/widgets/green_background.dart';

class FailedOTPThreeTimesView extends StatelessWidget {
  static const path = '/OTP-failed';
  static const name = '/OTP-failed';
  final String phone;

  const FailedOTPThreeTimesView({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreenBackground(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: const SizedBox(
            height: double.infinity,

          ),
        ),
      ),
    );
  }
}
