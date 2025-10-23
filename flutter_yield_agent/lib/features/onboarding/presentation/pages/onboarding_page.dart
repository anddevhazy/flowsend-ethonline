import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:yield_agent/features/onboarding/presentation/bloc/onboarding_cubit.dart';
import 'package:yield_agent/service_locator.dart';
import 'package:yield_agent/global/animated_dots_text.dart';
import 'package:yield_agent/global/custom_snackbar.dart';

class OnboardingPage extends StatefulWidget {
  //state class
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState
    extends
        State<OnboardingPage> // widget class
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OnboardingCubit>(),

      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state is Successful) {
            showCustomSnackBar(context, "Wallet Created Successfully!");
          }
        },

        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            backgroundColor: const Color(0xFF101114),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 🌟 App Logo
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFF181A1E),
                          border: Border.all(
                            color: const Color(0xFF2A2C31),
                            width: 1,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(255, 255, 255, 0.05),
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/logo.png',
                            width: 96,
                            height: 96,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // 🧠 Headline
                    const Text(
                      'Automated DeFi Yield Optimization',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 28,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // 📝 Subtext
                    const Text(
                      'Maximize your returns effortlessly with secure, automated yield strategies powered by MPC technology.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFFA3A3A3),
                        height: 1.3,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // 🚀 Get Started Button
                    if (state is! Successful)
                      GestureDetector(
                        onTap: state is! Loading
                            ? () => cubit.getStarted()
                            : null,
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF246BFD),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.05),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Center(
                            child: state is Loading
                                ? const AnimatedDotsText(
                                    baseText: "Creating wallet",
                                  )
                                : const Text(
                                    'Get Started',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Color(0xFFFFFFFF),
                                    ),
                                  ),
                          ),
                        ),
                      ),

                    // ✅ Success State
                    if (state is Successful)
                      GestureDetector(
                        onTap: () {
                          context.goNamed('dashboard');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF246BFD),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.05),
                                blurRadius: 10,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: const Text(
                            'Go to Dashboard',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),

                    if (state is Failed)
                      const Padding(
                        padding: EdgeInsets.only(top: 24.0),
                        child: Text(
                          'Something went wrong. Try again.',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
