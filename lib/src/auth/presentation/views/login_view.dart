import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/core/utils/constants/size_constatnts.dart';
import 'package:fushati/src/auth/presentation/app/blocs/auth_bloc/authenticator_bloc.dart';
import 'package:fushati/src/auth/presentation/views/verify_otp_view.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/animated_button_circular_loader.dart';
import '../../../../core/common/widgets/green_background.dart';
import '../../../../core/res/theme/app_theme.dart';
import '../../../../core/utils/constants/text_constants.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const path = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _controller;
  late final _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreenBackground(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              height: 100.h,
              width: double.infinity,
              padding: EdgeInsets.all(5.w),
              child: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          SizedBox(height: 2.h),
                          const AuthAppBar(),
                          SizedBox(height: 7.h),
                          Text(
                            "${AppLocalizations.of(context)?.login}",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 1.h),
                          Text(
                            "${AppLocalizations.of(context)?.enterPhone}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      Colours.textBlackColor.withOpacity(0.7),
                                ),
                          ),
                          SizedBox(height: 1.h),
                          Divider(
                            height: 2,
                            color: Colours.borderGreyColor,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: SizeConst.horizontalPadding),
                            width: 100.h,
                            height: 7.h,
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  Media.saSvg,
                                  height: 4.h,
                                  width: 4.5.h,
                                  fit: BoxFit.fitWidth,
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text(
                                  "${AppLocalizations.of(context)?.ksa}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colours.blackColor),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 2,
                            color: Colours.borderGreyColor,
                          ),
                          SizedBox(
                            width: 100.w,
                            height: 7.h,
                            child: Row(
                              children: [
                                Text(
                                  "+966",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: Colours.blackColor),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.5.w, vertical: 2.h),
                                  child: const VerticalDivider(
                                    width: 4,
                                    color: Colours.dividerGreyColor,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    style: CustomTheme.textFieldTextStyle,
                                    validator: (value) =>
                                        TextFormValidation.phoneValidation(
                                            value,
                                            context: context),
                                    onFieldSubmitted: (_) {
                                      bool filledFormCorrectly =
                                          _formKey.currentState?.validate();
                                      if (filledFormCorrectly) {
                                        context.read<AuthenticatorBloc>().add(
                                              AuthenticatorEvent.loginOrRegister(
                                                  phone:
                                                      "966${_controller.text}",
                                                  context: context),
                                            );
                                      }
                                    },
                                    onTapOutside: (_) => FocusScope.of(context)
                                        .requestFocus(FocusNode()),
                                    controller: _controller,
                                    onChanged: (value) {},
                                    keyboardType: TextInputType.phone,
                                    autofillHints: const [
                                      AutofillHints.telephoneNumber,
                                    ],
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      LengthLimitingTextInputFormatter(9),
                                    ],
                                    decoration: InputDecoration(
                                      hintText: "500000000",
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(SizeConst
                                                .horizontalPaddingFour)),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(SizeConst
                                                .horizontalPaddingFour)),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(SizeConst
                                                .horizontalPaddingFour)),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(SizeConst
                                                .horizontalPaddingFour)),
                                        borderSide: const BorderSide(
                                          width: 1.5,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            height: 2,
                            color: Colours.borderGreyColor,
                          ),
                          SizedBox(height: 1.h),
                        ],
                      ),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      fillOverscroll: true,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 2.h),
                        child:
                            BlocBuilder<AuthenticatorBloc, AuthenticatorState>(
                          builder: (context, state) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed:(){
                                    context.pushNamed(
                                      VerifyOTPView.name,
                                      queryParameters: {"phone": _controller.text},
                                    );
                                  },
                                  // onPressed: state ==
                                  //         const AuthenticatorState.loading()
                                  //     ? null
                                  //     : () {
                                  //         bool filledFormCorrectly =
                                  //             _formKey.currentState?.validate();
                                  //         if (filledFormCorrectly) {}
                                  //         context.read<AuthenticatorBloc>().add(
                                  //             AuthenticatorEvent
                                  //                 .loginOrRegister(
                                  //                     phone: _controller.text,
                                  //                     context: context));
                                  //       },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${AppLocalizations.of(context)?.cont}",
                                      ),
                                      AnimatedButtonCircularLoader(
                                          loading: state ==
                                              const AuthenticatorState
                                                  .loading())
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AuthAppBar extends StatelessWidget {
  const AuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colours.blackColor.withOpacity(0.1)),
                borderRadius: BorderRadius.all(Radius.circular(2.w))),
            child: AppLocalizations.of(context)?.localeName == "en"
                ? Icon(
                    Media.backIOSIcon,
                    size: SizeConst.iconSize,
                  )
                : Icon(
                    Media.backIOSARIcon,
                    size: SizeConst.iconSize,
                  ),
          ),
        ),
        SvgPicture.asset(
          Media.logoSvg,
          height: 5.h,
          // width: SizeConst.iconSize,
        )
      ],
    );
  }
}
