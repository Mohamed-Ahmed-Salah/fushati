import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/src/auth/presentation/views/login_view.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:mesh_gradient/mesh_gradient.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/green_background.dart';
import '../../../../core/res/styles/colours.dart';
import '../app/app_redirection_bloc/app_redirection_bloc.dart';

class SplashView extends StatefulWidget {
  static String path = "/";
  static String name = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final MeshGradientController _controller;
  late bool animated;

  @override
  void initState() {
    super.initState();
    context.read<AppRedirectionBloc>().add(GetAppData(context: context));
    animated = false;
    _controller = MeshGradientController(points: [
      MeshGradientPoint(
        position: const Offset(
          0.5,
          -0.2,
        ),
        color: Colours.primaryGreenColor.withOpacity(0.2),
      ),
      MeshGradientPoint(
        position: const Offset(
          0.5,
          1.3,
        ),
        color: Colours.primaryGreenColor.withOpacity(0.2),
      ),
      MeshGradientPoint(
        position: const Offset(
          0.5,
          0.5,
        ),
        color: Colours.whiteColor,
      ),
      MeshGradientPoint(
        position: const Offset(
          0.5,
          0.5,
        ),
        color: Colours.whiteColor,
      ),
    ], vsync: this);
    animate();
    // TODO: implement initState
  }

  animate() async {
    await _controller.animateSequence(
      duration: const Duration(seconds: 5),
      sequences: [
        AnimationSequence(
          pointIndex: 0,
          newPoint: MeshGradientPoint(
            position: const Offset(
              0.5,
              0.2,
            ),
            color: _controller.points.value[0].color,
          ),
          interval: const Interval(
            0.5,
            0.8,
            curve: Curves.easeInOut,
          ),
        ),
        AnimationSequence(
          pointIndex: 1,
          newPoint: MeshGradientPoint(
            position: const Offset(
              1.8,
              -0.5,
            ),
            color: _controller.points.value[1].color,
          ),
          interval: const Interval(
            0.0,
            0.7,
            curve: Curves.easeInBack,
          ),
        ),
      ],
    );

    setState(() {
      animated = true;
    });

    context
        .read<AppRedirectionBloc>()
        .add(GetAppDataAndRedirect(context: context));
  }

  @override
  Widget build(BuildContext context) {
    const animatedDuration = Duration(seconds: 1);

    return Scaffold(
      body: Stack(
        children: [
          // AnimatedPositioned(
          //   duration: animatedDuration,
          //
          //   top: animated ? -5.h : 0,
          //   // key: Key(animated.toString()),
          //   child: AnimatedOpacity(
          //     curve: Curves.easeInOut,
          //     opacity: 0,
          //     duration: animatedDuration,
          //     child: SizedBox(
          //       height: 100.h,
          //       width: 100.w,
          //       child: MeshGradient(
          //         controller: _controller,
          //         options: MeshGradientOptions(),
          //       ),
          //     ),
          //   ),
          // ),
          Positioned.fill(
            child: Lottie.asset(
              Media.splashLottie,
              repeat: false,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(Media.logoSvg),
              ],
            ),
          ),
          AnimatedPositioned(
              duration: animatedDuration,
              bottom: animated ? 7.h : 0,
              curve: Curves.easeIn,
              child: AnimatedOpacity(
                curve: Curves.easeInOut,
                opacity: animated ? 1 : 0,
                duration: animatedDuration,
                child: SizedBox(
                  width: 100.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)?.newExperience}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${AppLocalizations.of(context)?.forSchool}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
