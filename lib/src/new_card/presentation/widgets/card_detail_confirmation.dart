import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/new_card/presentation/app/add_new_card_bloc/add_new_card_bloc.dart';
import 'package:fushati/src/new_card/presentation/app/get_card_details_bloc/get_card_details_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/theme/app_theme.dart';
import '../views/add_card_loader.dart';

class CardDetail extends StatelessWidget {
  final CardEntity card;

  const CardDetail({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: SizeConst.verticalPadding,
        ),
        Text(
          "${AppLocalizations.of(context)?.fushatiVerifivation}",
          style: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 1.h),
        Text(
          "${AppLocalizations.of(context)?.verifyCardInfo}",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colours.textBlackColor.withOpacity(0.5)),
        ),
        SizedBox(height: SizeConst.verticalPaddingFour),
        ValidationTextRow(
          text: "${AppLocalizations.of(context)?.name}",
          detail: card.name,
        ),
        SizedBox(height: SizeConst.verticalPadding),
        ValidationTextRow(
          text: "${AppLocalizations.of(context)?.phoneNo}",
          detail: card.userPhone,
        ),
        SizedBox(height: SizeConst.verticalPadding),
        ValidationTextRow(
          text: "${AppLocalizations.of(context)?.dateCreated}",
          detail: "${card.createdAt}",
        ),
        SizedBox(height: SizeConst.verticalPadding),
        ValidationTextRow(
          text: "${AppLocalizations.of(context)?.cardNo}",
          detail: card.userCard,
        ),
        SizedBox(height: SizeConst.verticalPadding),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colours.lightGreyButton),
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("${AppLocalizations.of(context)?.cancel}")),
            ),
            SizedBox(
              width: SizeConst.horizontalPadding,
            ),
            Expanded(
              child: ElevatedButton(
                  onPressed: () {
                    context.read<AddNewCardBloc>().add(
                        AddNewCardEvent.addCard(cardNumber: card.userCard));
                    context.pushNamed(AddCardLoaderView.path);
                  },
                  child: Text("${AppLocalizations.of(context)?.confirm}")),
            )
          ],
        )
      ],
    );
  }
}

class ValidationTextRow extends StatelessWidget {
  final String text, detail;

  const ValidationTextRow(
      {super.key, required this.text, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colours.textBlackColor.withOpacity(0.5),
              fontWeight: FontWeight.w400),
        ),
        Text(
          detail,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Colours.textBlackColor.withOpacity(0.5),
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
