import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pinput/pinput.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common/singletons/form_validation.dart';
import '../../../../core/common/widgets/animated_button_circular_loader.dart';
import '../../../../core/common/widgets/green_background.dart';
import '../../../../core/res/styles/colours.dart';
import '../app/blocs/otp_bloc/otp_bloc.dart';

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
          child: SingleChildScrollView(
            child: SizedBox(
              height: 80.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Pinput(
                      autofocus: true,
                      pinContentAlignment: Alignment.center,
                      validator: (value) {
                        TextFormValidation.otpValidation(value, context: context);
                      },
                      onTapOutside: (_) =>
                          FocusScope.of(context).requestFocus(FocusNode()),
                      crossAxisAlignment: CrossAxisAlignment.center,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      length: 4,
                      defaultPinTheme: PinTheme(
                        width: 15.w,
                        height: 15.w,
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontWeight: FontWeight.w400),
                        decoration: BoxDecoration(
                          color: Colours.whiteColor,
                          borderRadius: BorderRadius.all(Radius.circular(2.w)),
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
                          borderRadius: BorderRadius.all(Radius.circular(2.w)),
                          border: Border.all(
                            color: Colours.blueButtonColor,
                          ),
                        ),
                      ),
                      onChanged: (text) {
                        otp = text;
                      },
                      onCompleted: (pin) {
                        context.read<OtpBloc>().add(
                              OtpEvent.verifyOTP(
                                  otp: pin, context: context, phone: phone),
                            );
                      },
                    ),
                  ),

                  Spacer(
                    flex: 16,
                  ),
                  //todo make otp change to submit via button
                  BlocBuilder<OtpBloc, OtpState>(
                    builder: (context, state) {
                      return ElevatedButton(
                        onPressed:
                            state == const OtpState.loading() || otp.length < 4
                                ? null
                                : () => context.read<OtpBloc>().add(
                                      OtpEvent.verifyOTP(
                                          otp: otp,
                                          context: context,
                                          phone: phone),
                                    ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "AAAAAAAAAAAAAAAAa",
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
            ),
          ),
        ),
      ),
    );
  }
}
