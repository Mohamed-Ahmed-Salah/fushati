import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pinput/pinput.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/animated_button_circular_loader.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/common/widgets/green_background.dart';
import '../../../../core/res/styles/colours.dart';
import '../app/blocs/otp_bloc/otp_bloc.dart';
import '../widgets/resend_otp_widget.dart';

class VerifyOTPView extends StatefulWidget {
  static const path = '/verify-otp';
  static const name = '/verify-otp';

  final String phone;

  const VerifyOTPView({super.key, required this.phone});

  @override
  State<VerifyOTPView> createState() => _VerifyOTPViewState();
}

class _VerifyOTPViewState extends State<VerifyOTPView> {
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreenBackground(
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 2.h),
                    const CustomAppBar(),
                    SizedBox(height: 7.h),
                    Text(
                      "${AppLocalizations.of(context)?.verifyPhone}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "${AppLocalizations.of(context)?.weSentOtp(widget.phone)}",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colours.textBlackColor.withOpacity(0.7),
                          ),
                    ),
                    SizedBox(height: 2.h),
                    Align(
                      alignment: Alignment.center,
                      child: Pinput(
                        autofocus: true,
                        controller: controller,
                        pinContentAlignment: Alignment.center,
                        validator: (value) {
                          TextFormValidation.otpValidation(value,
                              context: context);
                        },
                        onTapOutside: (_) =>
                            FocusScope.of(context).requestFocus(FocusNode()),
                        crossAxisAlignment: CrossAxisAlignment.center,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        length: 6,
                        defaultPinTheme: PinTheme(
                          width: 15.w,
                          height: 15.w,
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w500),
                          decoration: BoxDecoration(
                            color: Colours.whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.w)),
                            border: Border.all(
                              color: Colours.borderGreyColor,
                            ),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 15.w,
                          height: 15.w,
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontWeight: FontWeight.w400),
                          decoration: BoxDecoration(
                            color: Colours.whiteColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(2.w)),
                            border: Border.all(
                              color: Colours.blackColor,
                            ),
                          ),
                        ),

                        onCompleted: (pin) {
                          context.read<OtpBloc>().add(
                                OtpEvent.verifyOTP(
                                    otp: pin,
                                    context: context,
                                    phone: widget.phone),
                              );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ResendOtpWidget(
                          phone: widget.phone,
                        ),
                        BlocBuilder<OtpBloc, OtpState>(
                          builder: (context, state) {
                            return ElevatedButton(
                              onPressed: state == const OtpState.loading() ||
                                  controller.text.length < 6
                                  ? null
                                  : () => context.read<OtpBloc>().add(
                                        OtpEvent.verifyOTP(
                                            otp: controller.text,
                                            context: context,
                                            phone: widget.phone),
                                      ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${AppLocalizations.of(context)?.verify}",
                                  ),
                                  AnimatedButtonCircularLoader(
                                      loading:
                                          state == const OtpState.loading()),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
