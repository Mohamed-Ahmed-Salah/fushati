import 'package:flutter/material.dart';
import 'package:fushati/src/auth/presentation/views/auth_success.dart';
import 'package:fushati/src/edit_profile/presentation/views/edit_profile_view.dart';
import 'package:fushati/src/home/domain/entity/card.dart';
import 'package:fushati/src/moyasar_transfer/domain/entity/transaction_response.dart';
import 'package:fushati/src/new_card/presentation/views/new_card_with_student_details.dart';
import 'package:fushati/src/profile/domain/entities/user.dart';
import 'package:fushati/src/profile/presentation/views/profile_view.dart';
import 'package:fushati/src/update_app/presentation/views/update_app_view.dart';
import 'package:go_router/go_router.dart';

import '../../src/app_language/presentation/views/app_language.dart';
import '../../src/auth/presentation/views/login_view.dart';
import '../../src/auth/presentation/views/verify_otp_view.dart';
import '../../src/home/presentation/views/home_view.dart';
import '../../src/manage_card/presentation/views/card_deleted_success_view.dart';
import '../../src/manage_card/presentation/views/manage_card_view.dart';
import '../../src/moyasar_transfer/presentation/view/moyasar_wallet_transfer_view.dart';
import '../../src/moyasar_transfer/presentation/view/success_transaction.dart';
import '../../src/new_card/presentation/views/add_card_loader.dart';
import '../../src/new_card/presentation/views/add_card_success.dart';
import '../../src/new_card/presentation/views/new_card_view.dart';
import '../../src/on_boarding/presentation/views/onboarding_view.dart';
import '../../src/policy/presentation/view/policy_view.dart';
import '../../src/splash/presentation/views/splash_view.dart';

/// For routes that should NOT have the bottom nav bar
final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// For routes that SHOULD have the bottom nav bar
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

GlobalKey<ScaffoldMessengerState> get scaffoldKey => _scaffoldKey;

GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;

final router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: SplashView.path,
  routes: [
    GoRoute(
      path: SplashView.path,
      redirect: (context, state) {
        return SplashView.path;
      },
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: UpdateAppView.path,
      builder: (context, state) => const UpdateAppView(),
    ),GoRoute(
      path: LoginView.path,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: VerifyOTPView.path,
      name: VerifyOTPView.name,
      builder: (context, state) => VerifyOTPView(
        phone: state.uri.queryParameters["phone"]!,
      ),
    ),
    GoRoute(
      path: HomeView.path,
      builder: (context, state) => HomeView(
        shouldGetAppData: state.extra != null ? state.extra as bool : false,
      ),
    ),
    GoRoute(
      path: NewCardView.path,
      name: NewCardView.name,
      builder: (context, state) => const NewCardView(),
      routes: [
        GoRoute(
          path: AddCardLoaderView.path,
          name: AddCardLoaderView.name,
          builder: (context, state) => const AddCardLoaderView(),
        ),
        GoRoute(
          path: NewCardWithStudentDetailsView.path,
          name: NewCardWithStudentDetailsView.name,
          builder: (context, state) => NewCardWithStudentDetailsView(
            cardNumber: state.extra as String,
          ),
        ),
        GoRoute(
          path: AddCardSuccessView.path,
          name: AddCardSuccessView.name,
          builder: (context, state) => const AddCardSuccessView(),
        ),
      ],
    ),
    GoRoute(
      path: AuthenticatedSuccessfully.path,
      builder: (context, state) => const AuthenticatedSuccessfully(),
    ),
    GoRoute(
      path: OnBoardingView.path,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: AppLanguageView.path,
      builder: (context, state) => const AppLanguageView(),
    ),
    GoRoute(
        path: ManageCardView.path,
        name: ManageCardView.name,
        builder: (context, state) => ManageCardView(
              card: state.extra as CardEntity,
            ),
        routes: [
          GoRoute(
              path: MoyasarWalletTransferView.path,
              name: MoyasarWalletTransferView.name,
              builder: (context, state) => MoyasarWalletTransferView(
                    card: state.extra as CardEntity,
                  ),
              routes: [
                GoRoute(
                  path: CardTransactionSuccessView.path,
                  name: CardTransactionSuccessView.name,
                  builder: (context, state) => CardTransactionSuccessView(
                    transactionResponse: state.extra as TransactionResponse,
                    cardNumber: state.uri.queryParameters[
                        CardTransactionSuccessView.cardNumberParam]!,
                  ),
                )
              ]),
          GoRoute(
            path: CardDeletedSuccessView.path,
            name: CardDeletedSuccessView.name,
            builder: (context, state) => const CardDeletedSuccessView(),
          ),
        ]),
    GoRoute(
      path: ProfileView.path,
      builder: (context, state) => const ProfileView(),
    ),
    GoRoute(
      path: PolicyView.path,
      builder: (context, state) => const PolicyView(),
    ),
    GoRoute(
      path: EditProfileView.path,
      name: EditProfileView.name,
      builder: (context, state) => EditProfileView(
        user: state.extra as User,
      ),
    ),
  ],
);
