import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Cache;
import 'package:fushati/core/common/widgets/custom_animated_switcher.dart';
import 'package:fushati/core/common/widgets/error_alert_dialog.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/services/router.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
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
import '../../../../core/utils/constants/error_consts.dart';
import '../../../../core/utils/constants/text_constants.dart';
import '../../../app_language/presentation/views/app_language.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../profile/presentation/app/profile_transaction_bloc/profile_transaction_bloc.dart';
import '../../../profile/presentation/views/profile_view.dart';

class AlertDeleteAccount extends StatefulWidget {
  final String title;
  final String subTitle;
  final Function() onPressed;
  final String buttonText;
  final IconData icon;
  final bool isDeleteWidget;

  const AlertDeleteAccount(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.onPressed,
      required this.buttonText,
      required this.icon,
      this.isDeleteWidget = false});

  @override
  State<AlertDeleteAccount> createState() => _AlertDeleteAccountState();
}

class _AlertDeleteAccountState extends State<AlertDeleteAccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color stateColor = Colours.yellowWarningColor;

    return BlocBuilder<DeleteUserBloc, DeleteUserState>(
        builder: (context, state) {
      double radius = SizeConst.borderRadius;
      state.whenOrNull(loading: () {
        radius = 100.w;
      });
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSize(
              duration: const Duration(seconds: 1),
              curve: Curves.fastEaseInToSlowEaseOut,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  // color: Colours.whiteColor,
                  border: Border.all(color: Colours.borderGreyColor),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colours.blackColor.withOpacity(0.2),
                  //     spreadRadius: 5,
                  //     blurRadius: 7,
                  //     offset: const Offset(0, 3), // changes position of shadow
                  //   ),
                  // ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius),
                  ),
                ),
                child: IntrinsicWidth(
                    child: Material(
                        color: Colors.transparent,
                        elevation: 0,
                        child: CustomAnimatedSwitcher(
                            child: state.when(
                                initial: () => Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colours.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5.w),
                                          ),
                                          padding: EdgeInsets.all(5.w),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  widget.icon,
                                                  color: stateColor,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.5.h),
                                                  child: Text(widget.title,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge
                                                          ?.copyWith(
                                                              color: stateColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom: 1.5.h),
                                                  child: Text(
                                                    widget.subTitle,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            color: Colours
                                                                .textBlackColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    if (widget.isDeleteWidget)
                                                      Expanded(
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text(
                                                                "${AppLocalizations.of(context)?.cancel}",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium
                                                                    ?.copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400,
                                                                      color: Colours
                                                                          .redColor,
                                                                    ),
                                                              ))),
                                                    Expanded(
                                                      child: ElevatedButton(
                                                        onPressed: () {
                                                          print("SSSSSETTT ");

                                                          widget.onPressed();
                                                        },
                                                        style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(Colours
                                                                      .greyLightColor),
                                                        ),
                                                        child: Text(
                                                          widget.buttonText,
                                                          style: TextStyle(
                                                              color: Colours
                                                                  .textBlackColor
                                                                  .withOpacity(
                                                                      0.72)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                loading: () => Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(1.w),
                                        child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colours.whiteColor,
                                                shape: BoxShape.circle),
                                            child:
                                                const CustomCircularProgressIndicator()),
                                      ),
                                    ),
                                failed: (failed) {
                                  return ErrorAlertDialog(
                                    onPressed: widget.onPressed,
                                    title: ErrorConst.getErrorTitle(
                                        title: ErrorConst.errorEn),
                                    subtitle:
                                        ErrorConst.getErrorBody(text: failed),
                                  );
                                },
                                success: () => Container(
                                      child: const Text("aaaaaa"),
                                    ))
                            /* : Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colours.whiteColor,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            padding: EdgeInsets.all(5.w),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    widget.icon,
                                    color: stateColor,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                    child: Text(widget.title,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge
                                            ?.copyWith(
                                                color: stateColor,
                                                fontWeight: FontWeight.w500)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 1.5.h),
                                    child: Text(
                                      widget.subTitle,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                              color: Colours.textBlackColor,
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      if (widget.isDeleteWidget)
                                        Expanded(
                                            child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "${AppLocalizations.of(context)?.cancel}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                        fontWeight: FontWeight.w400,
                                                        color: Colours.redColor,
                                                      ),
                                                ))),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              print("SSSSSETTT ");
                                              pressed = true;
                                            });
                                            widget.onPressed();
                                          },
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(
                                                Colours.greyLightColor),
                                          ),
                                          child: Text(
                                            widget.buttonText,
                                            style: TextStyle(
                                                color: Colours.textBlackColor
                                                    .withOpacity(0.72)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                                                  ),*/
                            ))),
              ),
            ),
          ],
        ),
      );
    });
  }
}
