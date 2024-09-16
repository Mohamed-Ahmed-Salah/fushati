import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/utils/constants/error_consts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/splash/presentation/app/get_schools_bloc/get_schools_bloc.dart';
import 'package:fushati/src/splash/presentation/app/min_version_bloc/app_min_version_bloc.dart';
import 'package:fushati/src/update_app/presentation/views/update_app_view.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

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
  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    // Start the animation immediately
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppRedirectionBloc, AppRedirectionState>(
      listener: (BuildContext _, state) {
        state.whenOrNull(loadedCache: () {
          context
              .read<AppMinVersionBloc>()
              .add(AppMinVersionEvent.getAppVersion(context: context));
          context
              .read<GetSchoolsBloc>()
              .add(const GetSchoolsEvent.getSchools());
        });
      },
      child: BlocListener<AppMinVersionBloc, AppMinVersionState>(
        listener: (BuildContext _, state) {
          state.whenOrNull(failed: (message) {
            CoreUtils.showMyDialog(
              isRestart: true,
              title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
              subTitle: ErrorConst.getErrorBody(text: message),
              onPressed: () {
                controller.reset();
                controller.forward();
                context
                    .read<AppMinVersionBloc>()
                    .add(AppMinVersionEvent.getAppVersion(context: context));
                Navigator.pop(context);
              },
            );
          }, successShouldUpdate: (_) {
            context.go(UpdateAppView.path);
          }, successNoUpdate: () {
            context
                .read<AppRedirectionBloc>()
                .add(const AppRedirectionEvent.updateLoadedMinVersion());
            context
                .read<AppRedirectionBloc>()
                .add(GetAppDataAndRedirect(context: context));
          });
        },
        child: BlocListener<GetSchoolsBloc, GetSchoolsState>(
          listener: (BuildContext _, state) {
            state.whenOrNull(failed: (message) {
              CoreUtils.showMyDialog(
                isRestart: true,
                title: ErrorConst.getErrorTitle(title: ErrorConst.errorEn),
                subTitle: ErrorConst.getErrorBody(text: message),
                onPressed: () {
                  controller.reset();
                  controller.forward();
                  context
                      .read<GetSchoolsBloc>()
                      .add(const GetSchoolsEvent.getSchools());
                  Navigator.pop(context);
                },
              );
            }, success: (schools) {
              context
                  .read<AppRedirectionBloc>()
                  .add(const AppRedirectionEvent.updateLoadedSchools());
              context
                  .read<AppRedirectionBloc>()
                  .add(GetAppDataAndRedirect(context: context));
            });
          },
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Lottie.asset(
                    Media.splashLottie,
                    controller: controller,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
