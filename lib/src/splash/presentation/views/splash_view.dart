import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/media.dart';
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


  @override
  void initState() {
    super.initState();
    context
        .read<AppRedirectionBloc>()
        .add(GetAppDataAndRedirect(context: context));
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [

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

        ],
      ),
    );
  }
}
