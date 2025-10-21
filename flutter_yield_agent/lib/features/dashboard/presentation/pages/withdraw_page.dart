import 'package:flutter/material.dart';

class WithdrawPage extends StatelessWidget {
  const WithdrawPage({super.key});

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
              _buildBalanceDisplay(),
              const SizedBox(height: 16),
              _buildInputField(),
              const SizedBox(height: 24),
              _buildStatusIndicator(),
              const SizedBox(height: 24),
              _buildConfirmButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Text(
      'Withdraw Funds',
      style: TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: const Color(0xFFFFFFFF),
      ),
    );
  }

  Widget _buildBalanceDisplay() {
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
      child: Text(
        'Available: 2,450 USDC',
        style: TextStyle(
          fontFamily: 'Space Mono',
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: const Color(0xFFFFFFFF),
        ),
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

  Widget _buildStatusIndicator() {
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                const Color(0xFF246BFD), // Primary
              ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            'Processing',
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: const Color(0xFFFFFFFF),
            ),
          ),
        ],
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
          'Confirm Withdrawal',
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
}

// Success Modal (to be shown via your navigation logic)
class WithdrawalSuccessModal extends StatelessWidget {
  const WithdrawalSuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF181A1E), // Card Background
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.check_circle_outline, // Success checkmark
              size: 24,
              color: const Color(0xFF2ED573), // Success
            ),
            const SizedBox(height: 16),
            Text(
              'Withdrawal Completed',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'New Balance: 2,000 USDC',
              style: TextStyle(
                fontFamily: 'Space Mono',
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: const Color(0xFFFFFFFF),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
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
                  'Back to Dashboard',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: const Color(0xFFFFFFFF),
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
