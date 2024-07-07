import 'package:flutter/material.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'empty_card_list.dart';

class LoadedCardList extends StatelessWidget {
  const LoadedCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.symmetric(vertical: 1.h),
            child: CardContainerDesign(
              child: Stack(
                children: [
                  const Positioned(
                    bottom: 0,
                    right: 0,
                    child: BubbleImage(),
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
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Card Number",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w300),
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
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
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
            ),
          );
        },
        childCount: 10, // Example: 10 builders
      ),
    );
  }
}
