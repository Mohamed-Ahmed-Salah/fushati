import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/custom_animated_switcher.dart';
import 'package:fushati/core/common/widgets/error_alert_dialog.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/profile/presentation/app/delete_user_bloc/delete_user_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/utils/constants/error_consts.dart';

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
      double height = 40.h;
      double width = 100.w;
      state.whenOrNull(loading: () {
        radius = 100.w;
        height = 15.h;
        width = 15.h;
      },
      failed: (_){
        height=40.h;
      }
      );
      return Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedContainer(
                height: height,
                width: width,
                duration: const Duration(milliseconds: 800),
                curve: Curves.fastEaseInToSlowEaseOut,
                child: Padding(
                  padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 450),
                    decoration: BoxDecoration(
                      color: Colours.whiteColor,
                      border: Border.all(color: Colours.borderGreyColor),
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
                                                // color: Colours.whiteColor,
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
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.5.h),
                                                      child: Text(widget.title,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleLarge
                                                              ?.copyWith(
                                                                  color:
                                                                      stateColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 1.5.h),
                                                      child: Text(
                                                        widget.subTitle,
                                                        textAlign:
                                                            TextAlign.center,
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
                                                        if (widget
                                                            .isDeleteWidget)
                                                          Expanded(
                                                              child: TextButton(
                                                                  onPressed:
                                                                      () {
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
                                                                              FontWeight.w400,
                                                                          color:
                                                                              Colours.redColor,
                                                                        ),
                                                                  ))),
                                                        Expanded(
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              widget
                                                                  .onPressed();
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
                                      return SingleChildScrollView(
                                        child: ErrorAlertDialog.delete(
                                          onPressed: widget.onPressed,
                                          title: ErrorConst.getErrorTitle(
                                              title: ErrorConst.errorEn),
                                          subtitle: ErrorConst.getErrorBody(
                                              text: failed),
                                        ),
                                      );
                                    },
                                    success: () => const Text(""))
                                ))),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
