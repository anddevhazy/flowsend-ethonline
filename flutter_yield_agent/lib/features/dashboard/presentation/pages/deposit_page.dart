import 'package:flutter/material.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

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
              _buildHeader(),
              const SizedBox(height: 24),
              _buildTokenSelectorCard(),
              const SizedBox(height: 16),
              _buildInputField(),
              const SizedBox(height: 8),
              _buildWalletBalance(),
              const SizedBox(height: 24),
              _buildConfirmButton(),
              const SizedBox(height: 24),
              _buildSummaryCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Deposit Funds',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }

  Widget _buildTokenSelectorCard() {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'USDC',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          Icon(
            Icons.lock, // Placeholder for Feather Icons
            size: 24,
            color: const Color(0xFFFFFFFF).withOpacity(0.8),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF181A1E), // Input Background
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A2C31), width: 1),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 14,
          ),
          hintText: 'Enter amount',
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: const Color(0xFF6D6D6D), // Placeholder
          ),
          border: InputBorder.none,
        ),
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: const Color(0xFFFFFFFF),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }

  Widget _buildWalletBalance() {
    return Text(
      'Wallet Balance: 2,450 USDC',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: const Color(0xFFA3A3A3),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return GestureDetector(
      onTapDown: (_) {
        // Handle tap animation (scale down to 96%)
        // This requires state management, so you can handle it
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
        child: Text(
          'Confirm Deposit',
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

  Widget _buildSummaryCard() {
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
            'New Portfolio Value',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\$12,845.67',
            style: TextStyle(
              fontFamily: 'Space Mono',
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: const Color(0xFFFFFFFF),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Icon(
              Icons.check_circle_outline, // Success checkmark
              size: 24,
              color: const Color(0xFF2ED573), // Success
            ),
          ),
        ],
      ),
    );
  }
}
