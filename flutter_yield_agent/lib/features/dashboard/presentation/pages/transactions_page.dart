import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

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
              _buildTitleBar(),
              const SizedBox(height: 24),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    // Pull-to-refresh logic to be handled by you
                    await Future.delayed(const Duration(seconds: 1));
                  },
                  color: const Color(0xFF246BFD), // Primary
                  backgroundColor: const Color(0xFF181A1E),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) =>
                        _buildTransactionCard(context, index),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleBar() {
    return Text(
      'Transactions',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }

  Widget _buildTransactionCard(BuildContext context, int index) {
    // Example data for demonstration; replace with your data
    final types = ['Deposit', 'Withdraw', 'Rebalance'];
    final amounts = ['+500 USDC', '-200 USDC', 'Rebalanced'];
    final protocols = ['Aave', 'Compound', 'Aave + Compound'];
    final timestamps = ['2h ago', '5h ago', '12h ago'];
    final statuses = ['Completed', 'Pending', 'Completed'];

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0.2, 0), end: Offset.zero)
            .animate(
              CurvedAnimation(
                parent: ModalRoute.of(context)!.animation!,
                curve: Curves.easeOut,
              ),
            ),
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
          child: Row(
            children: [
              _buildTransactionIcon(types[index % types.length]),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${types[index % types.length]} ${amounts[index % amounts.length]}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Protocol: ${protocols[index % protocols.length]}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: const Color(0xFFA3A3A3),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      timestamps[index % timestamps.length],
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
              _buildStatusTag(statuses[index % statuses.length]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionIcon(String type) {
    IconData icon;
    switch (type) {
      case 'Deposit':
        icon = Icons.arrow_downward;
        break;
      case 'Withdraw':
        icon = Icons.arrow_upward;
        break;
      case 'Rebalance':
        icon = Icons.swap_horiz;
        break;
      default:
        icon = Icons.swap_horiz;
    }
    return Icon(
      icon, // Placeholder for Feather Icons
      size: 24,
      color: const Color(0xFFFFFFFF).withOpacity(0.8),
    );
  }

  Widget _buildStatusTag(String status) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: status == 'Completed'
            ? const Color(0xFF2ED573).withOpacity(0.2) // Success
            : const Color(0xFFA3A3A3).withOpacity(0.2),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: status == 'Completed'
              ? const Color(0xFF2ED573) // Success
              : const Color(0xFFA3A3A3),
        ),
      ),
    );
  }
}
