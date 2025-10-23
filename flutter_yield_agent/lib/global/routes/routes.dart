import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/deposit_page.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/settings_page.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/transactions_page.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/withdraw_page.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/yield_details_page.dart';
import 'package:yield_agent/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:yield_agent/global/main_scaffold.dart';
import 'package:yield_agent/global/splash_screen.dart';

class Routes {
  static const String splashPath = '/splash';
  static const String splashName = 'splash';

  static const String onboardingPath = '/onboarding';
  static const String onboardingName = 'onboarding';

  static const String dashboardPath = '/dashboard';
  static const String dashboardName = 'dashboard';

  static const String yieldDetailsPath = '/yieldDetails';
  static const String yieldDetailsName = 'yieldDetails';

  static const String settingsPath = '/settings';
  static const String settingsName = 'settings';

  static const String depositPath = '/deposit';
  static const String depositName = 'deposit';

  static const String withdrawPath = '/withdraw';
  static const String withdrawName = 'withdraw';

  static const String transactionsPath = '/transactions';
  static const String transactionsName = 'transactions';

  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,

    initialLocation: splashPath,
    routes: [
      GoRoute(
        path: splashPath,
        name: splashName,
        builder: (context, state) => const SplashScreen(),
      ),

      GoRoute(
        path: onboardingPath,
        name: onboardingName,
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: depositPath,
        name: depositName,
        builder: (context, state) => const DepositPage(),
      ),
      GoRoute(
        path: withdrawPath,
        name: withdrawName,
        builder: (context, state) => const WithdrawPage(),
      ),
      GoRoute(
        path: transactionsPath,
        name: transactionsName,
        builder: (context, state) => const TransactionsPage(),
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) =>
            MainScreen(routeState: state, child: child),
        routes: [
          GoRoute(
            path: dashboardPath,
            name: dashboardName,
            builder: (context, state) => const DashboardPage(),
          ),
          GoRoute(
            path: yieldDetailsPath,
            name: yieldDetailsName,
            builder: (context, state) => const YieldDetailsPage(),
          ),
          GoRoute(
            path: settingsPath,
            name: settingsName,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(state.error.toString()))),
  );
}
