import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/media.dart';
import '../../res/styles/colours.dart';
import '../../utils/constants/error_consts.dart';

class ErrorView extends StatelessWidget {
  final String message;
  final Function()? onPressed;

  const ErrorView({super.key, required this.onPressed, required this.message});

  @override
  Widget build(BuildContext context) {
    bool isInternetError = message == ErrorConst.TIMEOUT_MESSAGE ||
        message == ErrorConst.TIMEOUT_MESSAGE_AR;
    return Padding(
      padding: EdgeInsets.all(5.w),
      child: SizedBox(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: SizedBox(
                width: double.infinity,
                child: SvgPicture.asset(
                  isInternetError ? Media.warningSvg : Media.warningSvg,
                  alignment: Alignment.center,
                ),
              ),
            ),
            if (isInternetError)
              Text(
                "${AppLocalizations.of(context)?.connectionLost}",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            Text(
                isInternetError
                    ? "${AppLocalizations.of(context)?.connectionLostDesc}"
                    : "$message",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colours.blackColor,
                    fontWeight: FontWeight.w400)),
            Spacer(),
            ElevatedButton(
                onPressed: onPressed,
                child: Text("${AppLocalizations.of(context)?.tryAgian}"))
          ],
        ),
      ),
    );
  }
}
