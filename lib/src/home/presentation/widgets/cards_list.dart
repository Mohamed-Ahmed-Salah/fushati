import 'package:flutter/material.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../manage_card/presentation/views/manage_card_view.dart';
import '../../../new_card/presentation/views/new_card_view.dart';
import '../../domain/entity/card.dart';
import 'empty_card_list.dart';

class LoadedCardList extends StatelessWidget {
  final List<CardEntity> cards;

  const LoadedCardList({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == cards.length) {
            return GestureDetector(
              onTap: () {
                context.push(NewCardView.path);
              },
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: SizeConst.verticalPadding),
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: SizeConst.verticalPadding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(SizeConst.borderRadius),
                      ),
                      border: Border.all(color: Colours.borderGreyColor)),
                  child: Column(
                    children: [
                      const AddCardButton(),
                      Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Text(
                          "${AppLocalizations.of(context)?.addNewCard}",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: Colours.textBlackColor.withOpacity(0.5)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: CardBox(
              showManage: true,
              card: cards[index],
            ),
          );
        },
        childCount: cards.length + 1, // Example: 10 builders
      ),
    );
  }
}

class CardBox extends StatelessWidget {
  final bool showManage;
  final CardEntity card;

  const CardBox({super.key, this.showManage = false, required this.card});

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
                    "065  55  210  37",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    "Balance",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "60.00 R.S",
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
