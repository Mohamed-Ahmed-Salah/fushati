import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/common/widgets/green_background.dart';
import '../../../home/presentation/views/home_view.dart';

class AuthenticatedSuccessfully extends StatefulWidget {
  static const path = '/auth-success';

  const AuthenticatedSuccessfully({super.key});

  @override
  State<AuthenticatedSuccessfully> createState() => _AuthenticatedSuccessfullyState();
}

class _AuthenticatedSuccessfullyState extends State<AuthenticatedSuccessfully> {
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    goHome();

  }
  goHome()async{
    await Future.delayed(const Duration(seconds: 3));
    context.go(HomeView.path);
  }
  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: GreenBackground(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConst.horizontalPaddingFour),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Media.okaySvg,
              ),
              Text(
                "${AppLocalizations.of(context)?.allSet}",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                "${AppLocalizations.of(context)?.weRedirectToHome}",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Colours.blackColor.withOpacity(0.7),
                    ),
              ),
            ],
          ),
        ),
      ),
    );




  }
}
