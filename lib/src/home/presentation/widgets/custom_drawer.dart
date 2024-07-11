import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Cache;
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';

import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/common/app/cache_helper.dart';
import '../../../../core/res/media.dart';
import '../../../../core/services/injection_container.dart';
import '../../../../core/utils/constants/text_constants.dart';
import '../../../app_language/presentation/views/app_language.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../profile/presentation/views/profile_view.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          color: Colours.whiteColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeConst.verticalPadding,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  Media.logoSvg,
                  height: 7.h,
                ),
              ),
              SizedBox(
                height: SizeConst.verticalPaddingFour,
              ),
              CustomListTile(
                onTap: () {
                  context.push(ProfileView.path);
                },
                leading: SvgPicture.asset(Media.profileSvg),
                title: AppLocalizations.of(context)!.profile,
              ),
              CustomListTile(
                onTap: () async {
                  final phoneNumberCode =
                      TextConstants.whatsAppPhoneNumber.replaceAll('+', '');
                  await launchUrlString('https://wa.me/$phoneNumberCode');
                },
                leading: SvgPicture.asset(Media.contactSvg),
                title: (AppLocalizations.of(context)!.contactUs),
              ),
              CustomListTile(
                onTap: () {
                  context.push(AppLanguageView.path);
                },
                leading: SvgPicture.asset(Media.languageSvg),
                title: AppLocalizations.of(context)!.appLanguage,
              ),
              const Spacer(
                flex: 2,
              ),
              CustomListTile(
                onTap: () async {
                  final cacheHelper = sl<CacheHelper>();
                  await cacheHelper.logout();
                  // await resetAll();
                  context.go(LoginView.path);
                },
                leading: SvgPicture.asset(Media.logoutSvg),
                title: (AppLocalizations.of(context)!.logOut),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final Widget leading;
  final Function() onTap;

  const CustomListTile(
      {super.key,
      required this.title,
      required this.leading,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
