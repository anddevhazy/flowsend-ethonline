import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yield_agent/global/routes/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.child, required this.routeState});
  final Widget child;
  final GoRouterState routeState;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<String> _tabs = [
    Routes.dashboardName,
    Routes.yieldDetailsName,
    Routes.settingsName,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigateWithCustomTransition(context, _tabs[index]);
  }

  void _navigateWithCustomTransition(BuildContext context, String routeName) {
    GoRouter.of(context).goNamed(routeName, extra: _customPageTransition());
  }

  CustomTransitionPage _customPageTransition() {
    return CustomTransitionPage(
      child: widget.child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    String path = widget.routeState.fullPath ?? "";
    if (path.contains(Routes.dashboardName)) {
      setState(() {
        _selectedIndex = 0;
      });
    } else if (path.contains(Routes.yieldDetailsName)) {
      setState(() {
        _selectedIndex = 1;
      });
    } else if (path.contains(Routes.settingsName)) {
      setState(() {
        _selectedIndex = 3;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _buildCustomBottomNavBar(),
    );
  }

  Widget _buildCustomBottomNavBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFF181A1E),
        border: Border(top: BorderSide(color: Color(0xFF2A2C31), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Dashboard', 0),
          _buildNavItem(Icons.swap_horiz, 'Yield Details', 1),
          _buildNavItem(Icons.settings, 'Settings', 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24,
            color: isActive
                ? const Color(0xFF246BFD) // Active color
                : const Color(0xFFFFFFFF).withOpacity(0.8), // Inactive
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
              color: isActive
                  ? const Color(0xFF246BFD)
                  : const Color(0xFFFFFFFF).withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
