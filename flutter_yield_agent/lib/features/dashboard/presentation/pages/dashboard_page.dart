import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101114), // Background Base
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              _buildHeaderCard(),
              const SizedBox(height: 24),
              _buildMidSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeaderCard() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF181A1E), // Card Background
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: const Color(0xFF2A2C31), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$12,345.67',
            style: TextStyle(
              fontFamily: 'Space Mono',
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Yield Rate: 5.23%',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: const Color(0xFF13D6C3), // Accent
                ),
              ),
              Text(
                'Last Rebalanced: 12h ago',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: const Color(0xFFA3A3A3),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSegmentedControl(),
        ],
      ),
    );
  }

  Widget _buildSegmentedControl() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2C31),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildSegmentButton('24h', isSelected: true),
          _buildSegmentButton('7d'),
          _buildSegmentButton('30d'),
        ],
      ),
    );
  }

  Widget _buildSegmentButton(String label, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF246BFD) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: isSelected
                ? const Color(0xFFFFFFFF)
                : const Color(0xFFA3A3A3),
          ),
        ),
      ),
    );
  }

  Widget _buildMidSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Portfolio Allocation',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF181A1E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF2A2C31), width: 1),
            ),
            // Placeholder for Pie Chart (Recharts equivalent)
            child: Center(
              child: Text(
                'Pie Chart Placeholder',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xFFA3A3A3),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Performance Trend',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF181A1E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF2A2C31), width: 1),
            ),
            // Placeholder for Bar Chart (Recharts equivalent)
            child: Center(
              child: Text(
                'Bar Chart Placeholder',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xFFA3A3A3),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          _buildQuickActions(),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuickActionButton('Deposit'),
        _buildQuickActionButton('Withdraw'),
        _buildQuickActionButton('Transactions'),
      ],
    );
  }

  Widget _buildQuickActionButton(String label) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
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
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: const Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Color(0xFF181A1E),
        border: Border(top: BorderSide(color: Color(0xFF2A2C31), width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, isActive: true),
          _buildNavItem(Icons.swap_horiz, isActive: false),
          _buildNavItem(Icons.settings, isActive: false),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, {required bool isActive}) {
    return Icon(
      icon,
      size: 24,
      color: isActive
          ? const Color(0xFF246BFD) // Primary
          : const Color(0xFFFFFFFF).withOpacity(0.8),
    );
  }
}
