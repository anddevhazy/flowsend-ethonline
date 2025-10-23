import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/settings_page.dart';
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

  // static const String accountPath = '/account';
  // static const String accountName = 'account';

  // static const String explorePath = '/explore';
  // static const String exploreName = 'explore';

  // static const String favouritePath = '/favourite';
  // static const String favouriteName = 'favourite';

  // static const String orderAcceptedPath = '/orderAccepted';
  // static const String orderAcceptedName = 'orderAccepted';

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
      // GoRoute(
      //   path: loginPath,
      //   name: loginName,
      //   builder: (context, state) =>
      //       const LoginScreen(emailController: null, passwordController: null),
      // ),
      GoRoute(
        path: onboardingPath,
        name: onboardingName,
        builder: (context, state) => const OnboardingPage(),
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
          //     GoRoute(
          //       path: explorePath,
          //       name: exploreName,
          //       builder: (context, state) => const ExploreScreen(),
          //     ),
          //     GoRoute(
          //       path: favouritePath,
          //       name: favouriteName,
          //       builder: (context, state) => const FavouriteScreen(),
          //     ),
          //     GoRoute(
          //       path: accountPath,
          //       name: accountName,
          //       builder: (context, state) => const AccountScreen(),
          //     ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text(state.error.toString()))),
  );
}
