import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Cache;
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/services/router.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/home/presentation/widgets/delete_alert_dialog.dart';
import 'package:fushati/src/policy/presentation/view/policy_view.dart';
import 'package:fushati/src/profile/presentation/app/delete_user_bloc/delete_user_bloc.dart';
import 'package:fushati/src/profile/presentation/app/user_info_bloc/user_info_bloc.dart';

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
import '../../../profile/presentation/app/profile_transaction_bloc/profile_transaction_bloc.dart';
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
              BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, state) {
                bool showComplete = false;
                bool showAlert = false;
                state.whenOrNull(success: (user) {
                  showComplete = user.name == null &&
                      AppLocalizations.of(context)?.localeName == "en";
                  showAlert = user.name == null;
                });
                return CustomListTile(
                  leading: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SvgPicture.asset(Media.profileSvg),
                      if (showAlert)
                        Positioned(
                          top: -0.8.h,
                          left: AppLocalizations.of(context)?.localeName == "en"
                              ? -10
                              : 0,
                          right:
                              AppLocalizations.of(context)?.localeName != "en"
                                  ? -10
                                  : 0,
                          child: Container(
                            width: 1.1.h,
                            height: 1.1.h,
                            decoration: const BoxDecoration(
                              color: Colours.primaryGreenColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                    ],
                  ),
                  title: "${AppLocalizations.of(context)?.profile}",
                  onTap: () {
                    context.read<ProfileTransactionBloc>().add(
                        const ProfileTransactionEvent.getUserTransactions());
                    context.push(ProfileView.path);
                  },
                  widget: showComplete
                      ? Container(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          decoration: BoxDecoration(
                            color: Colours.primaryGreenColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(SizeConst.borderDoubleRadius),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "${AppLocalizations.of(context)?.completeProfileButton}",
                              style: TextStyle(
                                  color: Colours.textBlackColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15.sp),
                            ),
                          ),
                        )
                      : null,
                );
              }),
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
              CustomListTile(
                onTap: () {
                  context.push(PolicyView.path);
                },
                leading: const Icon(
                  Icons.assignment_rounded,
                  color: Colours.brandColorOne,
                ),
                title: AppLocalizations.of(context)!.termsAndCondition,
              ),
              BlocBuilder<UserInfoBloc, UserInfoState>(
                builder: (context, state) {
                  return state.when(
                    loading: () => const SizedBox(),
                    failed: (_) => const SizedBox(),
                    success: (user) => CustomListTile(
                      leading: SvgPicture.asset(
                        Media.deleteProfileSvg,
                        // color: Colours.brandColorOne,
                        height: 5.5.w,
                      ),
                      title: "${AppLocalizations.of(context)?.deleteProfile}",
                      onTap: () {
                        context
                            .read<DeleteUserBloc>()
                            .add(const DeleteUserEvent.reset());
                        showDialog(
                            context: context,
                            builder: (builderContext) => AlertDeleteAccount(
                                  isDeleteWidget: true,
                                  title:
                                      "${AppLocalizations.of(context)?.areYouSureToDelete}",
                                  subTitle:
                                      "${AppLocalizations.of(context)?.deleteAccountMeaning}",
                                  buttonText:
                                      "${AppLocalizations.of(context)?.yes}",
                                  onPressed: () {
                                    // Navigator.pop(builderContext);
                                    context.read<DeleteUserBloc>().add(
                                        DeleteUserEvent.deleteUser(
                                            context: context, id: user.id));
                                  },
                                  icon: Icons.delete,
                                ));
                      },
                    ),
                  );
                },
              ),
              const Spacer(
                flex: 2,
              ),
              CustomListTile(
                onTap: () async {
                  final cacheHelper = sl<CacheHelper>();
                  await cacheHelper.logout();
                  router.go(LoginView.path);
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
  final Widget? widget;

  const CustomListTile(
      {super.key,
      required this.title,
      required this.leading,
      required this.onTap,
      this.widget});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leading,
      title: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Padding(
              padding: EdgeInsets.only(
            right: AppLocalizations.of(context)?.localeName == "en" ? 1.h : 0,
            left: AppLocalizations.of(context)?.localeName == "en" ? 0 : 1.h,
          )),
          if (widget != null) Expanded(child: widget!)
        ],
      ),
    );
  }
}
