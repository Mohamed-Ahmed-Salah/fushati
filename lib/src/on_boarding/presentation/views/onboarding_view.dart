import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/src/auth/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/app/cache_helper.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/services/injection_container.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  static String path = "/on-boarding";
  static String name = "/on-boarding";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("ONBOARDING"),
          ElevatedButton(
              onPressed: () {
                final CacheHelper cacheHelper= sl();
                cacheHelper.cacheFirstTimer();
                context.go(LoginView.path);
              },
              child: const Text("Go login")),
        ],
      ),
    );
  }
}
