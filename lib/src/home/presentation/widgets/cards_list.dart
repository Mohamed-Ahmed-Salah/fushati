import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/new_card/presentation/app/nfc_reader_bloc/nfc_reader_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/card_box.dart';
import '../../../new_card/presentation/views/new_card_view.dart';
import '../../domain/entity/card.dart';
import 'empty_card_list.dart';

class EmptyCardList extends StatelessWidget {
  const EmptyCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          const EmptyCardsList(),
        ],
      ),
    );
  }
}

class LoadedCardList extends StatelessWidget {
  final List<CardEntity> cards;

  final bool isLoading;

  const LoadedCardList(
      {super.key, required this.cards, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == cards.length) {
            return GestureDetector(
              onTap: () {
                context.read<NfcReaderBloc>().add(const resetCardNfcEvent());
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
          if (index > cards.length) {
            return const CustomCircularProgressIndicator();
          }
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: CardBox.withManage(card: cards[index]),
          );
        },
        childCount: isLoading
            ? cards.length + 2
            : cards.length + 1, // Example: 10 builders
      ),
    );
  }
}
