import 'package:flutter/material.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../manage_card/presentation/views/manage_card_view.dart';
import 'empty_card_list.dart';

class LoadedCardList extends StatelessWidget {
  const LoadedCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: const CardBox(showManage: true,),
          );
        },
        childCount: 10, // Example: 10 builders
      ),
    );
  }
}

class CardBox extends StatelessWidget {
  final bool showManage;
  const CardBox({super.key, this.showManage=false});

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
          if(showManage)
          Positioned(
            bottom: 1.h,
            right: 7.w,
            child: GestureDetector(
              onTap: (){
                context.push(ManageCardView.path);
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
                      fontWeight: FontWeight.w500, color: Colours.brandColorOne),
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
                        "2727253960",
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
                    "Ahmed Mohamed Khalid",
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
