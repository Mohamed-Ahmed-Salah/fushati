import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fushati/src/auth/presentation/app/blocs/auth_bloc/authenticator_bloc.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import 'core/res/theme/app_theme.dart';
import 'core/services/injection_container.dart';
import 'core/services/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'l10n/I10n.dart';
import 'src/app_language/presentation/app/cubit/app_language_cubit.dart';
import 'src/auth/presentation/app/blocs/customer_info_bloc/customer_info_bloc.dart';
import 'src/auth/presentation/app/blocs/otp_bloc/otp_bloc.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await init();

  runApp(
    BlocProvider<AppLanguageCubit>(
        create: (BuildContext context) =>
            AppLanguageCubit(cacheHelper: sl())..getLanguage(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MultiBlocProvider(
        providers: [
          BlocProvider<CustomerInfoBloc>(
            create: (BuildContext context) => CustomerInfoBloc(
              addUserInfo: sl(),
              cacheHelper: sl(),
            ),
          ),
          BlocProvider<OtpBloc>(
            create: (BuildContext context) => OtpBloc(
              loginOrRegister: sl(),
              verifyOTP: sl(),
              cacheHelper: sl(),
            ),
          ),
          BlocProvider<AuthenticatorBloc>(
            create: (BuildContext context) => AuthenticatorBloc(
              loginOrRegister: sl(),
              cacheHelper: sl(),
            ),
          ),
        ],
        child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
            builder: (context, state) {
          return MaterialApp.router(
            routerConfig: router,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            scaffoldMessengerKey: scaffoldKey,
            debugShowCheckedModeBanner: false,
            title: 'SaladBar',
            locale: state.locale,
            theme: CustomTheme.lightTheme(),
          );
        }),
      );
    });
  }
}

//todo ManageSubscriptionView function for changing
