import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CardDetailError extends StatelessWidget {
  final String message;

  const CardDetailError({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: SizeConst.verticalPaddingFour,
        ),
        SvgPicture.asset(Media.deleteCardSvg),
        SizedBox(
          height: SizeConst.verticalPadding,
        ),
        Text(
          "${AppLocalizations.of(context)?.cardConfirmationFailed}",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colours.yellowWarningColor, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 1.h,
        ),
        Text(
          message,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colours.textBlackColor.withOpacity(0.7)),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: SizeConst.verticalPadding,
        ),
        ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text("${AppLocalizations.of(context)?.confirm}")),
        SizedBox(
          height: SizeConst.verticalPadding,
        ),
      ],
    );
  }
}
