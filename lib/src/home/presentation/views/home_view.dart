import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/common/widgets/custome_appbar.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/size_constatnts.dart';
import '../widgets/cards_list.dart';
import '../widgets/empty_card_list.dart';
import '../widgets/home_appbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String path = "/home";
  static String name = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomHomeAppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConst.horizontalPadding,
            // vertical: SizeConst.verticalPadding
          ),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const EmptyCardsList(),
                  ],
                ),
              ),
              const LoadedCardList(),
            ],
          ),
        ),
      ),
    );
  }
}
