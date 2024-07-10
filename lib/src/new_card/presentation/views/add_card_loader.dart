import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/green_background.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/new_card/presentation/app/add_new_card_bloc/add_new_card_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../../home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'add_card_success.dart';

class AddCardLoaderView extends StatelessWidget {
  static String path = "card-new-loading";
  static String name = "card-new-loading";

  const AddCardLoaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewCardBloc, AddNewCardState>(
      listener: (BuildContext context, AddNewCardState state) {
        state.whenOrNull(
          success: () {
            context.read<CardsBloc>().add(const CardsEvent.getCards());
            context.pushNamed(AddCardSuccessView.name);
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          body: GreenBackground(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                SizedBox(
                  height: SizeConst.verticalPadding,
                ),
                Text(
                  "${AppLocalizations.of(context)?.creatingNewCard}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colours.textBlackColor.withOpacity(0.4)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
