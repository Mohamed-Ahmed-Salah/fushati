import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/common/widgets/custome_appbar.dart';
import '../../../../core/common/widgets/green_background.dart';
import '../../../../core/res/styles/colours.dart';
import '../../../home/presentation/views/home_view.dart';
import 'auth_success.dart';

class UpdateUserInfoView extends StatefulWidget {
  const UpdateUserInfoView({super.key});

  static const path = '/update-user';

  @override
  State<UpdateUserInfoView> createState() => _UpdateUserInfoViewState();
}

class _UpdateUserInfoViewState extends State<UpdateUserInfoView> {
  late final TextEditingController name;
  late final TextEditingController email;

  late final _formKey;

  @override
  void initState() {
    // TODO: implement initState
    name = TextEditingController();
    email = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GreenBackground(
        child: Form(
          key: _formKey,
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
                        "Add user",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 1.h),
                      TextFormField(),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            context.go(AuthenticatedSuccessfully.path);
                          },
                          child: const Text("Go AuthenticatedSuccessfully")),
                      // BlocBuilder<OtpBloc, OtpState>(
                      //   builder: (context, state) {
                      //     return ElevatedButton(
                      //       onPressed: () {
                      //         context.go(UpdateUserInfoView.path);
                      //       },
                      //       // onPressed: state == const OtpState.loading() ||
                      //       //         otp.length < 4
                      //       //     ? null
                      //       //     : () => context.read<OtpBloc>().add(
                      //       //           OtpEvent.verifyOTP(
                      //       //               otp: otp,
                      //       //               context: context,
                      //       //               phone: phone),
                      //       //         ),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           Text(
                      //             "${AppLocalizations.of(context)?.verify}",
                      //           ),
                      //           AnimatedButtonCircularLoader(
                      //               loading: state == const OtpState.loading()),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                )
                //todo make otp change to submit via button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
