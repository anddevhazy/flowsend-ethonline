import 'package:flutter/material.dart';
import 'package:yield_agent/features/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const OnboardingPage(),
      // home: const DashboardPage(),
      // home: const DepositPage(),
      // home: const WithdrawPage(),
      // home: const TransactionsPage(),
      // home: const SettingsPage(),
    );
  }
}
