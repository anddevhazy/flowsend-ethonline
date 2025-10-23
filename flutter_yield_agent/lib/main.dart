import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:yield_agent/features/dashboard/presentation/pages/deposit_page.dart';
import 'package:yield_agent/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:yield_agent/global/routes/routes.dart';
import 'package:yield_agent/global/splash_screen.dart';
import 'main_injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yield Agent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      // home: const OnboardingPage(),
      // home: const DashboardPage(),
      // home: const DepositPage(),
      // home: const WithdrawPage(),
      // home: const TransactionsPage(),
      // home: const SettingsPage(),
      routerConfig: Routes.router,
    );
  }

  // @override
  // return MaterialApp(
  //     title: 'Yield Agent',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
  //       // textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
  //     ),
  //     // home: const OnboardingPage(),
  //     // home: const DashboardPage(),
  //     // home: const DepositPage(),
  //     // home: const WithdrawPage(),
  //     // home: const TransactionsPage(),
  //     // home: const SettingsPage(),
  //   );
  // }
}
