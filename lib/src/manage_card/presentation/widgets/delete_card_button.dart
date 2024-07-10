import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/card_details/presentation/views/card_details_view.dart';
import 'package:fushati/src/home/presentation/widgets/cards_list.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/card_box.dart';
import '../../../../core/common/widgets/close_button.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/pick_amount_bottomsheet.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../home/domain/entity/card.dart';
import '../widgets/delete_card_button.dart';
import '../widgets/top_up_button.dart';

class DeleteCardButton extends StatelessWidget {
  final CardEntity card;

  const DeleteCardButton({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => const DeleteConfirmationCardBox(),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConst.borderRadius),
            ),
            border: Border.all(color: Colours.borderGreyColor),
          ),
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
                    border: Border.all(color: Colours.borderGreyColor),
                  ),
                  child: SvgPicture.asset(
                    Media.deleteSvg,
                    height: SizeConst.iconSize - 0.3.h,
                  ),
                ),
                Expanded(
                  child: Text("${AppLocalizations.of(context)?.deleteCard}",
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

class DeleteConfirmationCardBox extends StatelessWidget {
  const DeleteConfirmationCardBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(SizeConst.horizontalPadding),
        child: Material(
          elevation: 0,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colours.whiteColor,
                borderRadius:
                    BorderRadius.all(Radius.circular(SizeConst.borderRadius))),
            child: Padding(
              padding: EdgeInsets.all(SizeConst.horizontalPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomCloseButton(),
                    ],
                  ),
                  SvgPicture.asset(Media.deleteCardSvg),
                  SizedBox(
                    height: SizeConst.verticalPadding,
                  ),
                  Text(
                    "${AppLocalizations.of(context)?.deleteCard}",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "${AppLocalizations.of(context)?.areYouSureDeleteCard}",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Colours.textBlackColor.withOpacity(0.7)),
                  ),
                  SizedBox(
                    height: SizeConst.verticalPadding,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colours.lightGreyButton,
                          ),
                          onPressed: () {
                            context.pop();
                          },
                          child: Text(
                            "${AppLocalizations.of(context)?.cancel}",
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: SizeConst.horizontalPadding,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "${AppLocalizations.of(context)?.delete}",
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
