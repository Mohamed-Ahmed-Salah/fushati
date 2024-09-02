import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/manage_card/presentation/app/bloc/card_transaction_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../res/styles/colours.dart';
import '../../utils/constants/size_constatnts.dart';
import '../../../src/manage_card/presentation/views/manage_card_view.dart';
import '../../../src/home/domain/entity/card.dart';
import '../../../src/home/presentation/widgets/empty_card_list.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardBox extends StatelessWidget {
  final bool showManage;
  final CardEntity card;
  final int? userId;

  // const CardBox(
  //     {super.key, this.showManage = false, required this.card, this.userId});

  const CardBox.withoutManage({
    super.key,
    this.showManage = false,
    required this.card,
  }) : userId = null;

  // Constructor that asserts userId is not null
  const CardBox.withManage({
    super.key,
    this.showManage = true,
    required this.card,
    required this.userId,
  }) : assert(userId != null);

  @override
  Widget build(BuildContext context) {
    return CardContainerDesign(
      child: Stack(
        children: [
          const Positioned(
            bottom: 0,
            right: 0,
            child: BubbleImage(),
          ),
          if (showManage)
            Positioned(
              bottom: 1.h,
              right: 7.w,
              child: GestureDetector(
                onTap: () {
                  context.read<CardTransactionBlocBloc>().add(
                      const CardTransactionBlocEvent.resetCardTransaction());

                  context
                      .read<CardTransactionBlocBloc>()
                      .add(CardTransactionBlocEvent.getCardTransaction(
                        id: userId!,
                        cardNumber: card.userCard,
                      ));
                  context.push(ManageCardView.path, extra: card);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConst.horizontalPaddingFour * 2,
                    vertical: SizeConst.horizontalPaddingFour,
                  ),
                  decoration: BoxDecoration(
                      color: Colours.whiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(20.w))),
                  child: Text(
                    "${AppLocalizations.of(context)?.manage}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colours.brandColorOne),
                  ),
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConst.horizontalPadding,
              vertical: SizeConst.verticalPadding,
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "CARD NUMBER",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colours.textBlackColor.withOpacity(0.5),
                            letterSpacing: 3),
                      ),
                      Text(
                        card.userCard,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: Colours.brandColorOne),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    card.name,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    CoreUtils.formatNumberString(card.userPhone),
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    "${AppLocalizations.of(context)?.balance}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "${AppLocalizations.of(context)?.balanceRS(card.balance)}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Colours.brandColorOne,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
