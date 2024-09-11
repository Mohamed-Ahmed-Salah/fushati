import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/card_box.dart';
import 'package:fushati/core/common/widgets/error_view.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/home/presentation/apps/registration_fees_bloc/registration_fees_bloc.dart';
import 'package:fushati/src/moyasar_transfer/presentation/view/success_transaction.dart';
import 'package:go_router/go_router.dart';

import 'dart:io' show Platform;
import 'package:moyasar/moyasar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/utils/constants/size_constatnts.dart';
import '../../../../core/utils/moyaser_config.dart';
import '../app/bloc/transfer_money_bloc.dart';
import '../app/cubit/amount_to_transfer_cubit.dart';

class MoyasarWalletTransferView extends StatelessWidget {
  static const String path = "moyasar";
  static const String name = "moyasar";

  final CardEntity card;

  const MoyasarWalletTransferView({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: SizeConst.horizontalPadding,
              right: SizeConst.horizontalPadding,
              top: SizeConst.horizontalPadding),
          child: BlocBuilder<RegistrationFeesBloc, RegistrationFeesState>(
              builder: (context, state) {
            return state.when(loading: () {
              return const Center(child: LoadingWidget());
            }, failed: (message) {
              return ErrorView(
                  onPressed: () {
                    context
                        .read<RegistrationFeesBloc>()
                        .add(const RegistrationFeesEvent.getFees());
                  },
                  message: message);
            }, success: (fees) {
              return BlocBuilder<AmountToTransferCubit, AmountToTransferState>(
                  builder: (context, state) {
                return state.when(
                  initial: (amount) =>
                      BlocListener<TransferMoneyBloc, TransferMoneyState>(
                    listener: (BuildContext context, TransferMoneyState state) {
                      state.whenOrNull(successState: (response) {
                        context.read<CardsBloc>().add(
                            const CardsEvent.getCards(callFromStart: true));
                        context.pushNamed(CardTransactionSuccessView.name,
                            extra: response,
                            queryParameters: {
                              CardTransactionSuccessView.cardNumberParam:
                                  card.userCard,
                            });
                      });
                    },
                    child: CustomScrollView(
                      slivers: [
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              SizedBox(height: SizeConst.verticalPadding),
                              CustomAppBar(
                                text:
                                    "${AppLocalizations.of(context)?.topUpBalance}",
                              ),
                              SizedBox(height: SizeConst.verticalPaddingFour),
                              CardBox.withoutManage(card: card),
                              SizedBox(height: SizeConst.verticalPadding),
                              ApplePay(
                                config: MoyasarConfig.config(
                                    card.isNewCard
                                        ? (amount + fees)
                                        : amount.toDouble(),
                                    card.userCard),
                                onPaymentResult: (result) {
                                  context.read<TransferMoneyBloc>().add(
                                      TransferMoneyEvent.addingAmount(
                                          amount: amount,
                                          result: result,
                                          context: context,
                                          cardNumber: card.userCard));
                                },
                              ),
                              if (Platform.isIOS)
                                SizedBox(height: SizeConst.verticalPadding),
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
                              SizedBox(height: SizeConst.verticalPadding),
                              CreditCard(
                                textWidget: Text(
                                  "${AppLocalizations.of(context)?.texFeesMayApply}",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: Colours.blackColor,
                                          fontWeight: FontWeight.w400),
                                ),
                                config: MoyasarConfig.config(
                                    card.isNewCard
                                        ? (amount + fees)
                                        : amount.toDouble(),
                                    card.userCard),
                                onPaymentResult: (result) {
                                  if (result is PaymentResponse) {
                                    context.read<TransferMoneyBloc>().add(
                                        TransferMoneyEvent.addingAmount(
                                            result: result,
                                            context: context,
                                            cardNumber: card.userCard,
                                            amount: amount));
                                  }
                                },
                                locale:
                                    AppLocalizations.of(context)?.localeName ==
                                            "ar"
                                        ? const Localization.ar()
                                        : const Localization.en(),
                                buttonColor: Colours.primaryGreenColor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
            });
          }),
        ),
      ),
    );
  }
}
