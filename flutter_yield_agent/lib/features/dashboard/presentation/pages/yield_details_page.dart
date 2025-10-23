import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class YieldDetailsPage extends StatelessWidget {
  const YieldDetailsPage({super.key});

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
              _buildTitle(),
              const SizedBox(height: 24),
              _buildTotalYieldCard(),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) => _buildProtocolCard(index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Yield Breakdown',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }

  Widget _buildTotalYieldCard() {
    return Container(
      width: double.infinity,

      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF181A1E), // Card Background
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2A2C31), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            'Total Yield Earned',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 22,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$1,234.56',
            style: TextStyle(
              fontFamily: 'Space Mono',
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProtocolCard(int index) {
    final protocols = [
      'Aave',
      'Compound',
      'Curve',
      'Balancer',
      'SushiSwap',
      'Yearn',
      'MakerDAO',
      'Lido',
    ];
    final tokens = [
      'USDC',
      'USDT',
      'DAI',
      'ETH',
      'BTC',
      'USDC',
      'DAI',
      'stETH',
    ];
    final amounts = [
      '1,000',
      '750',
      '500',
      '2,300',
      '0.5',
      '1,200',
      '600',
      '3.4',
    ];
    final yields = [
      '4.5%',
      '3.8%',
      '5.2%',
      '4.1%',
      '3.5%',
      '6.0%',
      '4.8%',
      '5.6%',
    ];
    final times = [
      '12h ago',
      '1d ago',
      '2d ago',
      '3d ago',
      '4d ago',
      '5d ago',
      '6d ago',
      '1w ago',
    ];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xFF181A1E), // Card Background
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFF2A2C31), width: 1),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2C31),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      protocols[index][0],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        protocols[index],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Token: ${tokens[index]}',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: const Color(0xFFA3A3A3),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  yields[index],
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: const Color(0xFF13D6C3), // Accent
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              'Amount Invested: ${amounts[index]} ${tokens[index]}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Last Rebalanced: ${times[index]}',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: const Color(0xFFA3A3A3),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFF181A1E),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2A2C31), width: 1),
              ),
              // Placeholder for mini line chart (Recharts equivalent)
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineTouchData: LineTouchData(enabled: false),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: const Color(0xFF13D6C3),
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: const Color(0xFF13D6C3).withOpacity(0.15),
                      ),
                      spots: _getSampleSpots(index),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<FlSpot> _getSampleSpots(int index) {
  switch (index) {
    case 0:
      return const [
        FlSpot(0, 1),
        FlSpot(1, 1.3),
        FlSpot(2, 1.5),
        FlSpot(3, 1.4),
        FlSpot(4, 1.8),
      ];
    case 1:
      return const [
        FlSpot(0, 1),
        FlSpot(1, 0.9),
        FlSpot(2, 1.1),
        FlSpot(3, 1.0),
        FlSpot(4, 1.3),
      ];
    case 2:
      return const [
        FlSpot(0, 1.2),
        FlSpot(1, 1.4),
        FlSpot(2, 1.6),
        FlSpot(3, 1.5),
        FlSpot(4, 1.9),
      ];
    case 3:
      return const [
        FlSpot(0, 1.1),
        FlSpot(1, 1.3),
        FlSpot(2, 1.2),
        FlSpot(3, 1.5),
        FlSpot(4, 1.7),
      ];
    case 4:
      return const [
        FlSpot(0, 0.9),
        FlSpot(1, 1.0),
        FlSpot(2, 1.2),
        FlSpot(3, 1.3),
        FlSpot(4, 1.4),
      ];
    case 5:
      return const [
        FlSpot(0, 1.0),
        FlSpot(1, 1.2),
        FlSpot(2, 1.5),
        FlSpot(3, 1.8),
        FlSpot(4, 2.0),
      ];
    case 6:
      return const [
        FlSpot(0, 1.4),
        FlSpot(1, 1.5),
        FlSpot(2, 1.6),
        FlSpot(3, 1.7),
        FlSpot(4, 1.9),
      ];
    default:
      return const [
        FlSpot(0, 1.3),
        FlSpot(1, 1.5),
        FlSpot(2, 1.4),
        FlSpot(3, 1.6),
        FlSpot(4, 1.8),
      ];
  }
}
