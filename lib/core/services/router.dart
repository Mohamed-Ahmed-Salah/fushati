import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/app_language/presentation/views/app_language.dart';
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
      path: OnBoardingView.path,
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: AppLanguageView.path,
      builder: (context, state) => const AppLanguageView(),
    ),
  ],
);
