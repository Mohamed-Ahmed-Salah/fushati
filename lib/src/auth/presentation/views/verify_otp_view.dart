import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fushati/src/auth/presentation/views/update_user_info_view.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/animated_button_circular_loader.dart';
import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/common/widgets/green_background.dart';
import '../../../../core/res/styles/colours.dart';
import '../app/blocs/otp_bloc/otp_bloc.dart';
import 'login_view.dart';

class VerifyOTPView extends StatelessWidget {
  static const path = '/verify-otp';
  static const name = '/verify-otp';

  final String phone;

  const VerifyOTPView({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    String otp = '';
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
                      "${AppLocalizations.of(context)?.weSentOtp("+966$phone")}",
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
                        length: 5,
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
                        onChanged: (text) {
                          otp = text;
                        },
                        onCompleted: (pin) {
                          // context.read<OtpBloc>().add(
                          //       OtpEvent.verifyOTP(
                          //           otp: pin, context: context, phone: phone),
                          //     );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverFillRemaining(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CountdownWidget(),
                    BlocBuilder<OtpBloc, OtpState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context.go(UpdateUserInfoView.path);
                          },
                          // onPressed: state == const OtpState.loading() ||
                          //         otp.length < 4
                          //     ? null
                          //     : () => context.read<OtpBloc>().add(
                          //           OtpEvent.verifyOTP(
                          //               otp: otp,
                          //               context: context,
                          //               phone: phone),
                          //         ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${AppLocalizations.of(context)?.verify}",
                              ),
                              AnimatedButtonCircularLoader(
                                  loading: state == const OtpState.loading()),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
              //todo make otp change to submit via button
            ],
          ),
        ),
      ),
    );
  }
}

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Timer? _timer;
  int _start = 30; // countdown starting time in seconds
  bool _showResend = false;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_start > 0) {
          _start--;
        } else {
          _showResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _resendCode() {
    setState(() {
      _start = 30; // reset the timer
      _showResend = false;
      startTimer();
    });
    // Add your resend code logic here
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: <TextSpan>[
            if (_showResend)
              TextSpan(
                  text: '${AppLocalizations.of(context)?.iDidntGetOtp} ',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                      )),
            if (_showResend)
              TextSpan(
                text: '${AppLocalizations.of(context)?.resend}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colours.blackColor,
                      fontWeight: FontWeight.w700,
                    ),
                recognizer: TapGestureRecognizer()..onTap = _resendCode,
              ),
            if (!_showResend)
              TextSpan(
                text: '${AppLocalizations.of(context)?.sendCodeIn("")}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
            if (!_showResend)
              TextSpan(
                text: "00:${_start.toString().padLeft(2, '0')}",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
          ],
        ),
      ),
    );
  }
}
