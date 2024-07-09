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
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/pick_amount_bottomsheet.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../home/domain/entity/card.dart';

class ManageCardView extends StatefulWidget {
  static String path = "/manage-new";
  static String name = "/manage-new";
  static String param = "card";
  final CardEntity card;

  const ManageCardView({super.key, required this.card});

  @override
  State<ManageCardView> createState() => _ManageCardViewState();
}

class _ManageCardViewState extends State<ManageCardView> {
  late TextEditingController controller;
  late final _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();

    controller = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConst.horizontalPadding,
              vertical: SizeConst.verticalPadding),
          child: Form(
            key: _formKey,
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: SizeConst.verticalPadding),
                      CustomAppBar(
                        text: "${AppLocalizations.of(context)?.manageCard}",
                      ),
                      SizedBox(height: 5.h),
                       CardBox(card: widget.card,),
                      SizedBox(height: SizeConst.verticalPadding),
                      Row(
                        children: [
                          const TopUpButton(),
                          SizedBox(
                            width: SizeConst.horizontalPadding,
                          ),
                          const DeleteCardButton(),
                        ],
                      ),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.push(CardDetailsView.path);
                            // bool filledFormCorrectly =
                            //     _formKey.currentState?.validate();
                            // if (filledFormCorrectly) {
                            //   ///todo call  function
                            // }
                          },
                          child: Text("${AppLocalizations.of(context)?.cont}")),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DeleteCardButton extends StatelessWidget {
  const DeleteCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){

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

class TopUpButton extends StatelessWidget {
  const TopUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){
          print("object");
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const PickAmountBottomSheet();
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
