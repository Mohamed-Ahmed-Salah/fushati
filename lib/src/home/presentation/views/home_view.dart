import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/common/widgets/custome_appbar.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/home/presentation/widgets/custom_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/error_view.dart';
import '../../../../core/common/widgets/loading_view.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/size_constatnts.dart';
import '../widgets/cards_list.dart';
import '../widgets/empty_card_list.dart';
import '../widgets/error_sliver.dart';
import '../widgets/home_appbar.dart';
import '../widgets/loading_sliver.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String path = "/home";
  static String name = "/home";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomHomeAppBar(
        drawerKey: _scaffoldKey,
      ),
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConst.horizontalPadding,
            // vertical: SizeConst.verticalPadding
          ),
          child: CustomScrollView(
            slivers: [
              BlocBuilder<CardsBloc, CardsState>(builder: (context, state) {
                return state.when(
                    loading: () => const LoadingSliver(),
                    emptyList: () => const EmptyCardList(),
                    failed: (message) => ErrorSliver(
                          onPressed: () {
                            context
                                .read<CardsBloc>()
                                .add(const CardsEvent.getCards());
                          },
                          message: message,
                        ),
                    success: (cards) => LoadedCardList(cards: cards));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
