import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
import '../app/blocs/auth_bloc/authenticator_bloc.dart';
import '../app/blocs/otp_bloc/otp_bloc.dart';
import '../widgets/resend_otp_widget.dart';
class ResendOtpWidget extends StatefulWidget {
  final String phone;

  const ResendOtpWidget({super.key, required this.phone});

  @override
  State<ResendOtpWidget> createState() => _ResendOtpWidgetState();
}

class _ResendOtpWidgetState extends State<ResendOtpWidget> {
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

  resendBloc() {
    context.read<AuthenticatorBloc>().add(
        AuthenticatorEvent.resendOTP(context: context, phone: widget.phone));
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
    return BlocConsumer<AuthenticatorBloc, AuthenticatorState>(
      listener: (BuildContext context, state) {
        state.whenOrNull(
            loading: () {},
            loggedInSuccessfully: (_) {
              _resendCode();
            },
            failed: (_) {});
      },
      builder: (BuildContext context, AuthenticatorState state) {
        bool showLoading = false;
        state.whenOrNull(loading: () {
          showLoading = true;
        });
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 1.5.h),
          child: Container(
            height: 5.h,
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      if (_showResend)
                        TextSpan(
                            text:
                            '${AppLocalizations.of(context)?.iDidntGetOtp} ',
                            style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                            )),
                      if (_showResend)
                        TextSpan(
                          text: '${AppLocalizations.of(context)?.resend}',
                          style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colours.blackColor,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = resendBloc,
                        ),
                      if (!_showResend)
                        TextSpan(
                          text: '${AppLocalizations.of(context)?.sendCodeIn("")}',
                          style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      if (!_showResend)
                        TextSpan(
                          text: "00:${_start.toString().padLeft(2, '0')}",
                          style:
                          Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedButtonCircularLoader(
                  loading: showLoading,
                  color: Colours.brandColorOne,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
