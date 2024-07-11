import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/common/widgets/close_button.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/card_details/presentation/views/card_details_view.dart';
import 'package:fushati/src/home/presentation/widgets/cards_list.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/card_box.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/pick_amount_bottomsheet.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../home/domain/entity/card.dart';
import '../app/bloc/delete_card_bloc.dart';
import '../widgets/delete_card_button.dart';
import '../widgets/top_up_button.dart';

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
  void didChangeDependencies() {
    context.read<DeleteCardBloc>().add(const DeleteCardEvent.reset());

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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
                      CardBox(
                        card: widget.card,
                      ),
                      SizedBox(height: SizeConst.verticalPadding),
                      Row(
                        children: [
                          TopUpButton(
                            card: widget.card,
                          ),
                          SizedBox(
                            width: SizeConst.horizontalPadding,
                          ),
                          DeleteCardButton(
                            card: widget.card,
                          ),
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
