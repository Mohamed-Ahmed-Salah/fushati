import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/styles/colours.dart';
import '../app/app_redirection_bloc/app_redirection_bloc.dart';

class SplashView extends StatefulWidget {
  static String path = "/";
  static String name = "/";

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context
        .read<AppRedirectionBloc>()
        .add(GetAppDataAndRedirect(context: context));
    return Scaffold(
      backgroundColor: Colours.primaryGreenColor,

    );
  }
}
