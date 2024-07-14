import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fushati/src/auth/presentation/app/blocs/auth_bloc/authenticator_bloc.dart';
import 'package:fushati/src/edit_profile/presentation/app/bloc/edit_profile_bloc.dart';
import 'package:fushati/src/home/presentation/apps/cards_bloc/cards_bloc.dart';
import 'package:fushati/src/manage_card/presentation/app/bloc/card_transaction_bloc.dart';
import 'package:fushati/src/manage_card/presentation/app/delete_card_bloc/delete_card_bloc.dart';
import 'package:fushati/src/moyasar_transfer/presentation/app/bloc/transfer_money_bloc.dart';
import 'package:fushati/src/moyasar_transfer/presentation/app/cubit/amount_to_transfer_cubit.dart';
import 'package:fushati/src/new_card/presentation/app/add_new_card_bloc/add_new_card_bloc.dart';
import 'package:fushati/src/new_card/presentation/app/get_card_details_bloc/get_card_details_bloc.dart';
import 'package:fushati/src/on_boarding/presentation/app/bloc/cubit/page_cubit.dart';
import 'package:fushati/src/profile/presentation/app/delete_user_bloc/delete_user_bloc.dart';
import 'package:fushati/src/profile/presentation/app/profile_transaction_bloc/profile_transaction_bloc.dart';
import 'package:fushati/src/profile/presentation/app/user_info_bloc/user_info_bloc.dart';
import 'package:fushati/src/splash/presentation/app/app_redirection_bloc/app_redirection_bloc.dart';

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
          BlocProvider<AppRedirectionBloc>(
            create: (BuildContext context) => AppRedirectionBloc(),
          ),
          BlocProvider<AddNewCardBloc>(
            create: (BuildContext context) => AddNewCardBloc(addCard: sl()),
          ),
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
          BlocProvider<GetCardDetailsBloc>(
            create: (BuildContext context) => GetCardDetailsBloc(
              getCardDetails: sl(),
            ),
          ),
          BlocProvider<DeleteCardBloc>(
              create: (BuildContext context) => DeleteCardBloc(
                    deleteCard: sl(),
                  )),
          BlocProvider<TransferMoneyBloc>(
              create: (BuildContext context) =>
                  TransferMoneyBloc(depositWallet: sl())),
          BlocProvider<AmountToTransferCubit>(
            create: (BuildContext context) => AmountToTransferCubit(),
          ),
          BlocProvider<CardsBloc>(
            create: (BuildContext context) => CardsBloc(
              getCard: sl(),
            ),
          ),
          BlocProvider<UserInfoBloc>(
            create: (BuildContext context) => UserInfoBloc(
              getUserInfo: sl(),
            ),
          ),
          BlocProvider<DeleteUserBloc>(
            create: (BuildContext context) => DeleteUserBloc(
              deleteUserInfo: sl(),
            ),
          ),
          BlocProvider<EditProfileBloc>(
            create: (BuildContext context) => EditProfileBloc(
              editUserInfo: sl(),
            ),
          ),
          BlocProvider<OnBoardingPageCubit>(
            create: (BuildContext context) =>
                OnBoardingPageCubit(cacheHelper: sl()),
          ),
          BlocProvider<CardTransactionBlocBloc>(
            create: (BuildContext context) =>
                CardTransactionBlocBloc(getCardTransactions: sl()),
          ),
          BlocProvider<ProfileTransactionBloc>(
            create: (BuildContext context) =>
                ProfileTransactionBloc(getUserTransactions: sl()),
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
            title: 'Fushati',
            locale: state.locale,
            theme: CustomTheme.lightTheme(),
          );
        }),
      );
    });
  }
}

//todo delete user
//todo animation splash
