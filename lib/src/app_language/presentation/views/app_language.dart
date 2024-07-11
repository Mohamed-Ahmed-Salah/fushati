import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../../core/utils/constants/size_constatnts.dart';
import '../app/cubit/app_language_cubit.dart';

class AppLanguageView extends StatelessWidget {
  static const path = "/app-language";

  const AppLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(7.w),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: SizeConst.verticalPadding),
                    CustomAppBar(
                      text: "${AppLocalizations.of(context)?.appLanguage}",
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "${AppLocalizations.of(context)?.selectLanguage}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colours.textBlackColor.withOpacity(0.7)),
                    ),
                    LanguageRow(
                        language: "English",
                        isCurrentLanguage:
                            AppLocalizations.of(context)!.localeName == "en",
                        onTap: () {
                          context
                              .read<AppLanguageCubit>()
                              .changeLanguage(newLanguage: "en");
                        }),
                    LanguageRow(
                        language: "العربية",
                        isCurrentLanguage:
                            AppLocalizations.of(context)!.localeName == "ar",
                        onTap: () {
                          context
                              .read<AppLanguageCubit>()
                              .changeLanguage(newLanguage: "ar");
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageRow extends StatelessWidget {
  final String language;
  final bool isCurrentLanguage;
  final Function() onTap;

  const LanguageRow(
      {super.key,
      required this.language,
      required this.isCurrentLanguage,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colours.borderGreyColor),
              borderRadius: BorderRadius.all(Radius.circular(2.5.w))),
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                language,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              Radio(
                  value: isCurrentLanguage ? 1 : 0,
                  groupValue: 1,
                  onChanged: null),
            ],
          ),
        ),
      ),
    );
  }
}
