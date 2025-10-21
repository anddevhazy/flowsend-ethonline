import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool _isWalletCreated = false;

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
    return Scaffold(
      backgroundColor: const Color(0xFF101114), // Background Base
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
                    color: const Color(0xFF181A1E), // Card Background
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

              GestureDetector(
                onTap: () {
                  setState(() {
                    _isWalletCreated = true;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF246BFD), // Primary
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

              const SizedBox(height: 24),

              // ✅ Success State
              if (_isWalletCreated)
                Column(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 24,
                      color: Color(0xFF2ED573), // Success
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Wallet Created Successfully',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTapDown: (_) {
                        // Handle tap animation (scale down to 96%)
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: const Color(0xFF246BFD), // Primary
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
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
