import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:go_router/go_router.dart';

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
              _buildMidSection(context),
            ],
          ),
        ),
      ),
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

  Widget _buildMidSection(BuildContext context) {
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

          // Inside _buildMidSection()
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: const Color(0xFF181A1E),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFF2A2C31), width: 1),
            ),
            child: PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    value: 40,
                    color: Colors.blue,
                    radius: 50,
                    title: '40%',
                    titleStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    value: 30,
                    color: Colors.green,
                    radius: 50,
                    title: '30%',
                    titleStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  PieChartSectionData(
                    value: 30,
                    color: Colors.orange,
                    radius: 50,
                    title: '30%',
                    titleStyle: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
                sectionsSpace: 2,
                centerSpaceRadius: 40,
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
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 100,
                gridData: FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 28),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        final labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
                        return Text(
                          labels[value.toInt()],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                          ),
                        );
                      },
                      reservedSize: 28,
                    ),
                  ),
                ),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barRods: [
                      BarChartRodData(toY: 50, color: Colors.blue, width: 14),
                    ],
                  ),
                  BarChartGroupData(
                    x: 1,
                    barRods: [
                      BarChartRodData(toY: 70, color: Colors.blue, width: 14),
                    ],
                  ),
                  BarChartGroupData(
                    x: 2,
                    barRods: [
                      BarChartRodData(toY: 30, color: Colors.blue, width: 14),
                    ],
                  ),
                  BarChartGroupData(
                    x: 3,
                    barRods: [
                      BarChartRodData(toY: 80, color: Colors.blue, width: 14),
                    ],
                  ),
                  BarChartGroupData(
                    x: 4,
                    barRods: [
                      BarChartRodData(toY: 60, color: Colors.blue, width: 14),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          _buildQuickActions(context),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildQuickActionButton(context, 'Deposit'),
        _buildQuickActionButton(context, 'Withdraw'),
        _buildQuickActionButton(context, 'Transactions'),
      ],
    );
  }

  Widget _buildQuickActionButton(BuildContext context, String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          switch (label) {
            case 'Deposit':
              context.pushNamed('deposit');
              break;
            case 'Withdraw':
              context.pushNamed('withdraw');
              break;
            case 'Transactions':
              context.pushNamed('transactions');
              break;
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
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
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
    );
  }
}
