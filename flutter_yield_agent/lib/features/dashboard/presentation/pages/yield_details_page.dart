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
                  itemCount: 3, // Example count, replace with your data
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
    // Example data for demonstration; replace with your data
    final protocols = ['Aave', 'Compound', 'Curve'];
    final tokens = ['USDC', 'USDT', 'DAI'];
    final amounts = ['1,000', '750', '500'];
    final yields = ['4.5%', '3.8%', '5.2%'];
    final times = ['12h ago', '1d ago', '2d ago'];

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
                      protocols[index][0], // Placeholder for protocol logo
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
              child: Center(
                child: Text(
                  'Mini Line Chart Placeholder',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: const Color(0xFFA3A3A3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
