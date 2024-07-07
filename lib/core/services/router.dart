import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/app_language/presentation/views/app_language.dart';
import '../../src/auth/presentation/views/login_view.dart';
import '../../src/auth/presentation/views/resend_otp_after_failure.dart';
import '../../src/auth/presentation/views/update_user_info_view.dart';
import '../../src/auth/presentation/views/verify_otp_view.dart';
import '../../src/on_boarding/presentation/views/onboarding_view.dart';
import '../../src/splash/presentation/views/splash_view.dart';

/// For routes that should NOT have the bottom nav bar
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _thirdNavigatorKey = GlobalKey<NavigatorState>();

/// For routes that SHOULD have the bottom nav bar
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

GlobalKey<ScaffoldMessengerState> get scaffoldKey => _scaffoldKey;

GlobalKey<NavigatorState> get rootNavigatorKey => _rootNavigatorKey;

GlobalKey<NavigatorState> get shellNavigatorKey => _shellNavigatorKey;
final GlobalKey<NavigatorState> _detailNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'detail-machine');

final _shellNavigatorMachines =
    GlobalKey<NavigatorState>(debugLabel: 'shellMachine');
final _shellNavigatorNotification =
    GlobalKey<NavigatorState>(debugLabel: 'shellNotification');

final _shellNavigatorProfile =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

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
      path: LoginView.path,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: FailedOTPThreeTimesView.path,
      name: FailedOTPThreeTimesView.name,
      builder: (context, state) => FailedOTPThreeTimesView(
        phone: state.uri.queryParameters["phone"]!,
      ),
    ),
    GoRoute(
      path: VerifyOTPView.path,
      name: VerifyOTPView.name,
      builder: (context, state) => VerifyOTPView(
        phone: state.uri.queryParameters["phone"]!,
      ),
    ),
    GoRoute(
      path: UpdateUserInfoView.path,
      builder: (context, state) => const UpdateUserInfoView(),
    ),
    GoRoute(
      path: OnBoardingView.path,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: AppLanguageView.path,
      builder: (context, state) => const AppLanguageView(),
    ),
  ],
);
