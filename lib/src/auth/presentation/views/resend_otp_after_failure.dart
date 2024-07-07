import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          child: SizedBox(
            height: double.infinity,

          ),
        ),
      ),
    );
  }
}
