import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/card_box.dart';
import 'package:fushati/src/home/domain/entity/card.dart';

import 'dart:io' show Platform;
import 'package:moyasar/moyasar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/styles/colours.dart';
import '../../../../core/utils/moyaser_config.dart';
import '../app/bloc/transfer_money_bloc.dart';
import '../app/cubit/amount_to_transfer_cubit.dart';

class MoyasarWalletTransferView extends StatelessWidget {
  static const String path = "/moyasar";
  static const String name = "/moyasar";

  final CardEntity card;

  const MoyasarWalletTransferView({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CardBox(card: card),
          BlocBuilder<AmountToTransferCubit, AmountToTransferState>(
              builder: (context, state) {
            return state.when(
                initial: (amount) => SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          children: [
                            ApplePay(
                              config:
                                  MoyasarConfig.config(amount, card.userCard),
                              onPaymentResult: (result) {
                                context.read<TransferMoneyBloc>().add(
                                    TransferMoneyEvent.addingAmount(
                                        result: result,
                                        context: context,
                                        cardNumber: card.userCard));
                              },
                            ),
                            if (Platform.isIOS)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Divider(
                                        color: Colours.textBlackColor
                                            .withOpacity(0.12)),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${AppLocalizations.of(context)?.or}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: Colours.textBlackColor
                                                  .withOpacity(0.52)),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Divider(
                                        color: Colours.textBlackColor
                                            .withOpacity(0.12)),
                                  ),
                                ],
                              ),
                            CreditCard(
                              config:
                                  MoyasarConfig.config(amount, card.userCard),
                              onPaymentResult: (result) {
                                context.read<TransferMoneyBloc>().add(
                                    TransferMoneyEvent.addingAmount(
                                        result: result,
                                        context: context,
                                        cardNumber: card.userCard));
                              },
                              locale:
                                  AppLocalizations.of(context)?.localeName ==
                                          "ar"
                                      ? const Localization.ar()
                                      : const Localization.en(),
                              buttonColor: Colours.primaryGreenColor,
                            )
                          ],
                        ),
                      ),
                    ));
          }),
        ],
      ),
    );
  }
}
