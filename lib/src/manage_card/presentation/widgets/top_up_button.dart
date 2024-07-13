import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'pick_amount_bottomsheet.dart';
import '../../../../core/res/media.dart';
import '../../../home/domain/entity/card.dart';

class TopUpButton extends StatelessWidget {
  final CardEntity card;

  const TopUpButton({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return PickAmountBottomSheet(
                card: card,
              );
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConst.borderRadius),
              ),
              border: Border.all(color: Colours.borderGreyColor)),
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(SizeConst.horizontalPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConst.borderRadius),
                      ),
                      color: Colours.primaryGreenColor),
                  child: SvgPicture.asset(
                    Media.boltSvg,
                    height: SizeConst.iconSize,
                  ),
                ),
                Expanded(
                  child: Text("${AppLocalizations.of(context)?.topUpCard}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
