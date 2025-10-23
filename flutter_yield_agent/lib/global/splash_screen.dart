import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  late final AnimationController _pulseController;
  late final Animation<double> _opacityAnimation;
  late final Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();

    // Wordmark Fade-In Animation (0.25s ease-out)
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOut,
    );
    _fadeController.forward();

    // Pulsating Orb Animation
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // Animate opacity between 0.3 and 0.6
    _opacityAnimation = Tween<double>(begin: 0.3, end: 0.6).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    // Animate radial gradient radius between 0.4 and 0.6
    _radiusAnimation = Tween<double>(begin: 0.4, end: 0.6).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    _goNextPage();
  }

  Future<void> _goNextPage() async {
    await Future.delayed(const Duration(seconds: 2)); // wait for animations
    if (mounted) {
      context.goNamed('onboarding');
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101114),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                return _buildPulsatingOrb(
                  _opacityAnimation.value,
                  _radiusAnimation.value,
                );
              },
            ),
            const SizedBox(height: 24),
            FadeTransition(opacity: _fadeAnimation, child: _buildWordmark()),
          ],
        ),
      ),
    );
  }

  Widget _buildPulsatingOrb(double opacity, double radius) {
    return Container(
      width: 170,
      height: 180,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          center: Alignment.center,
          radius: radius, // animate radius for breathing effect
          colors: [
            const Color(0xFF246BFD).withOpacity(opacity),
            const Color(0xFF13D6C3).withOpacity(opacity),
            const Color(0xFF101114),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.05),
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF181A1E),
            border: Border.all(color: const Color(0xFF2A2C31), width: 1),
          ),
          child: Center(
            child: Image.asset(
              'assets/logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWordmark() {
    return Text(
      'Yield Agent',
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Colors.white,
      ),
    );
  }
}
