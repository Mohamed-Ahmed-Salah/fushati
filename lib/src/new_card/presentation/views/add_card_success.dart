import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/common/widgets/green_background.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/home/presentation/views/home_view.dart';
import 'package:fushati/src/new_card/presentation/app/add_new_card_bloc/add_new_card_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddCardSuccessView extends StatelessWidget {
  static String path = "card-new-added";
  static String name = "card-new-added";

  const AddCardSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreenBackground(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConst.horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                Media.successSvg,
                height: 12.h,
              ),
              SizedBox(
                height: SizeConst.verticalPadding,
              ),
              Text(
                "${AppLocalizations.of(context)?.newCardAdded}",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w700, color: Colours.textBlackColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: SizeConst.verticalPadding,
              ),
              Text(
                "${AppLocalizations.of(context)?.successCardAdded}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Colours.textBlackColor.withOpacity(0.7)),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: SizeConst.verticalPadding),
                child: ElevatedButton(
                  onPressed: () {
                    context.go(HomeView.path);
                  },
                  child: Text("${AppLocalizations.of(context)?.done}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
