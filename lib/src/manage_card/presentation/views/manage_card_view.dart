import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/common/widgets/close_button.dart';
import 'package:fushati/core/common/widgets/green_background.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/core/utils/core_utils.dart';
import 'package:fushati/src/home/data/models/transaction_model.dart';
import 'package:fushati/src/home/presentation/widgets/cards_list.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/card_box.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/pick_amount_bottomsheet.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../home/domain/entity/card.dart';
import '../app/bloc/delete_card_bloc.dart';
import '../widgets/delete_card_button.dart';
import '../widgets/top_up_button.dart';
import '../widgets/transaction_box.dart';

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
                        text: "${AppLocalizations
                            .of(context)
                            ?.manageCard}",
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
                      SizedBox(
                        height: SizeConst.verticalPadding,
                      ),
                      Row(
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
                      )
                    ],
                  ),
                ),
                SliverList.builder(
                  itemCount: widget.card.transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Transaction transaction = widget.card
                        .transactions[index];
                    return TransactionBox(transaction: transaction,);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
