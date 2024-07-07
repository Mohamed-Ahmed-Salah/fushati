import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static String path = "/on-boarding";
  static String name = "/on-boarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ONBOARDING")
      ),
    );
  }
}
