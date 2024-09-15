import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fushati/core/common/widgets/error_view.dart';
import 'package:fushati/core/common/widgets/loading_view.dart';
import 'package:fushati/core/res/media.dart';
import 'package:fushati/core/res/styles/colours.dart';
import 'package:fushati/src/splash/presentation/app/min_version_bloc/app_min_version_bloc.dart';

import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

class UpdateAppView extends StatelessWidget {
  static String path = "/update-app";

  const UpdateAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppMinVersionBloc, AppMinVersionState>(
        builder: (context, state) {
      return Scaffold(
        bottomSheet: state.when(
          loading: () => const SizedBox.shrink(),
          successNoUpdate: () => const SizedBox.shrink(),
          failed: (_) => const SizedBox.shrink(),
          successShouldUpdate: (response) => Padding(
            padding: EdgeInsets.all(5.w),
            child: ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(response.storeUrl);
                  await launchUrl(url);
                  // bool isIOS = Platform.isIOS;
                  // StoreRedirect.redirect(
                  //     androidAppId: isIOS ? "" : response.storeId,
                  //     iOSAppId: isIOS ? response.storeId : "");
                },
                child: Text("${AppLocalizations.of(context)?.update}")),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: SafeArea(
            child: state.when(
              successNoUpdate: () => const SizedBox.shrink(),
              loading: () => const LoadingWidget(),
              failed: (error) => ErrorView(
                onPressed: () {
                  context
                      .read<AppMinVersionBloc>()
                      .add(AppMinVersionEvent.getAppVersion(context: context));
                },
                message: error,
              ),
              successShouldUpdate: (response) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    Media.updateRequiredLottie,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "${AppLocalizations.of(context)?.weAreBetterThanEver}",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    "${AppLocalizations.of(context)?.pleaseUpdateFushati}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colours.textBlackColor.withOpacity(0.72),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
