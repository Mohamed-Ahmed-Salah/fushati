import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/utils/constants/size_constatnts.dart';

class TransactionHistoryRowText extends StatelessWidget {
  const TransactionHistoryRowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${AppLocalizations
              .of(context)
              ?.transactionHistory}",
          style: Theme
              .of(context)
              .textTheme
              .titleMedium
              ?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colours.textBlackColor
                  .withOpacity(0.7)),
        ),
        SizedBox(
          width: SizeConst.horizontalPadding,
        ),
        Expanded(
          child: Divider(
            color: Colours.borderGreyColor,
            height: 5,
          ),
        ),
      ],
    );
  }
}
