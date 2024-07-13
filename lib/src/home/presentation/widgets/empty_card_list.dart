import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/utils/constants/size_constatnts.dart';
import '../../../new_card/presentation/views/new_card_view.dart';

class EmptyCardsList extends StatelessWidget {
  const EmptyCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(NewCardView.path);
      },
      child: CardContainerDesign(
        child: Stack(
          children: [
            const Positioned(
              bottom: 0,
              right: 0,
              child: BubbleImage(),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("${AppLocalizations.of(context)?.youDontHaveCards}",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w300,
                            color: Colours.blackColor.withOpacity(0.7))),
                    const SizedBox(height: 16.0),
                    Column(
                      children: [
                        AddCardButton(),
                        const SizedBox(height: 8.0),
                        Text(
                          "${AppLocalizations.of(context)?.addFirstCard}",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colours.brandColorOne),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddCardButton extends StatelessWidget {
  const AddCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
      decoration: const BoxDecoration(
        color: Colours.brandColorOne,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Icon(
        Media.plusIcon,
        color: Colours.primaryGreenColor,
        size: 5.h,
      ),
    );
  }
}

class BubbleImage extends StatelessWidget {
  const BubbleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(20.w))),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(SizeConst.borderRadius)),
          child: SvgPicture.asset(
            Media.bubbleSvg,
          ),
        ));
  }
}

class CardContainerDesign extends StatelessWidget {
  final Widget child;

  const CardContainerDesign({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.w),
      decoration: BoxDecoration(
        color: Colours.whiteColor, // Outer card color
        borderRadius: BorderRadius.circular(SizeConst.borderRadius),
        border: Border.all(
            color: Colours.brandColorOne.withOpacity(0.1),
            width: 2), // Outer card border color
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SizeConst.borderRadius),
          border: Border.all(color: Colours.whiteColor),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(0, 5), // Shadow position
            ),
          ],
        ),
        child: Container(
          width: 100.w,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.4, 1],
              colors: [
                Colours.whiteColor,
                Colours.primaryGreenTintColor.withOpacity(0.5),
              ],
            ),

            borderRadius: BorderRadius.circular(SizeConst.borderRadius),
            border: Border.all(
                color: Colours.whiteColor), // Inner card border color
          ),
          child: child,
        ),
      ),
    );
  }
}
