import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fushati/core/common/widgets/green_background.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/custom_animated_switcher.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/colours.dart';
import '../app/bloc/cubit/page_cubit.dart';
import '../widgets/bottom_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static String path = "/on-boarding";
  static String name = "/on-boarding";

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController(
      initialPage: 0,
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> svgs = [Media.studentsSvg, Media.blocksSvg, Media.safeSvg];
    List<String> title = [
      "${AppLocalizations.of(context)?.onBoardTitle1}",
      "${AppLocalizations.of(context)?.onBoardTitle2}",
      "${AppLocalizations.of(context)?.onBoardTitle3}",
    ];
    List<String> subTitle = [
      "${AppLocalizations.of(context)?.onBoardSub2}",
      "${AppLocalizations.of(context)?.onBoardSub3}",
      "${AppLocalizations.of(context)?.onBoardSub1}",
    ];

    return Scaffold(
      body: GreenBackground(
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 2.h),
                    const CustomAppBar(showBackButton: false),
                    SizedBox(height: 7.h),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                fillOverscroll: true,
                child: Padding(
                  padding: EdgeInsets.all(SizeConst.horizontalPaddingFour),
                  child: Column(
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 30.h,
                        child: PageView.builder(
                          onPageChanged: (int value) {
                            context
                                .read<OnBoardingPageCubit>()
                                .changePage(value);
                          },
                          controller: controller,
                          itemCount: svgs.length,
                          itemBuilder: (_, index) {
                            return SvgPicture.asset(
                              svgs[index],
                              height: 50.w,
                              width: 50.w,
                            );
                          },
                        ),
                      ),
                      BlocBuilder<OnBoardingPageCubit, PageState>(
                          builder: (_, state) {
                        return Column(
                          children: [
                            SizedBox(
                              height: SizeConst.verticalPaddingFour,
                            ),
                            AnimatedSwitcher(
                              duration: const Duration(milliseconds: 400),
                              switchInCurve: Curves.easeInOutCubic,
                              switchOutCurve: Curves.easeInOut,
                              child: Align(
                                alignment: Alignment.topCenter,
                                key: Key(title[state.currentIndexPage]),
                                child: Text(
                                  key: Key(title[state.currentIndexPage]),
                                  title[state.currentIndexPage],

                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(

                                        fontWeight: FontWeight.w700,
                                        color: Colours.brandColorOne,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConst.verticalPadding,
                            ),
                            CustomAnimatedSwitcher(
                              child: Align(
                                alignment: Alignment.topCenter,
                                key: Key(subTitle[state.currentIndexPage]),
                                child: Text(
                                  key: Key(subTitle[state.currentIndexPage]),
                                  subTitle[state.currentIndexPage],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: Colours.textBlackColor
                                            .withOpacity(0.5),
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: SizeConst.verticalPadding,
                            ),
                          ],
                        );
                      }),
                      const Spacer(),
                      const BottomPageIndicator(),
                      BlocBuilder<OnBoardingPageCubit, PageState>(
                          builder: (_, state) {
                        return Padding(
                          padding: EdgeInsets.only(
                              top: SizeConst.verticalPaddingFour),
                          child: ElevatedButton(
                              onPressed: () {
                                if (state.currentIndexPage < title.length - 1) {
                                  controller.animateToPage(
                                      state.currentIndexPage + 1,
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut);
                                } else {
                                  context
                                      .read<OnBoardingPageCubit>()
                                      .updateFirstTime(context);
                                }
                              },
                              child: Text(
                                  "${AppLocalizations.of(context)?.cont}")),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
