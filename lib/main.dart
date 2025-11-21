import 'package:flutter/material.dart';

void main() {
  runApp(const SpacezApp());
}

class SpacezApp extends StatelessWidget {
  const SpacezApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spacez Coupons',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F2EE),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB86339),
          surface: const Color(0xFFFFFFFF),
        ),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: const Color(0xFF4F3D32),
              displayColor: const Color(0xFF4F3D32),
            ),
      ),
      home: const CouponsPage(),
    );
  }
}

class CouponsPage extends StatelessWidget {
  const CouponsPage({super.key});

  void _showSuccessMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _TopBar(),
            Expanded(
              child: ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                children: [
                  CouponCard(
                    coupon: const Coupon(
                      amount: '₹6,900',
                      title: 'LONGSTAY',
                      description:
                          '15% off when you book for 5 days or more and 20% off when you book for 30 days or more.',
                      finePrint:
                          '• Applicable on all stays\n• Cannot be clubbed with other offers',
                    ),
                    onApply: () => _showSuccessMessage(
                      context,
                      'LONGSTAY coupon applied successfully!',
                    ),
                    onReadMore: () => _showSuccessMessage(
                      context,
                      'Showing more details for LONGSTAY.',
                    ),
                  ),
                  const SizedBox(height: 16),
                  CouponCard(
                    coupon: const Coupon(
                      amount: '₹6,900',
                      title: 'WARMSTAY',
                      description:
                          '10% off when you book for 3 nights or more. Extra 5% off for members.',
                      finePrint: '• Valid till 30 Apr\n• Limited to one use',
                    ),
                    onApply: () => _showSuccessMessage(
                      context,
                      'WARMSTAY coupon applied successfully!',
                    ),
                    onReadMore: () => _showSuccessMessage(
                      context,
                      'Showing more details for WARMSTAY.',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Payment offers:',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF4B463E),
                        ),
                  ),
                  const SizedBox(height: 16),
                  CouponCard(
                    coupon: const Coupon(
                      amount: '₹1,000',
                      title: 'BANK OFFER',
                      description:
                          '15% instant discount with Axis Bank cards on minimum billing of ₹5,000.',
                      finePrint:
                          '• Valid on credit cards only\n• Refunded if booking cancelled',
                    ),
                    onApply: () => _showSuccessMessage(
                      context,
                      'Bank offer applied successfully!',
                    ),
                    onReadMore: () => _showSuccessMessage(
                      context,
                      'Showing more details for bank offer.',
                    ),
                  ),
                ],
              ),
            ),
            const _GreenBanner(),
            _BookingSummary(
              onReserve: () => _showSuccessMessage(
                context,
                'Reservation locked in! We\'ll hold this for you.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14000000),
            offset: Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          _SquareButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Back action triggered.')),
              );
            },
          ),
          const SizedBox(width: 16),
          Text(
            'Coupons',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF4B463E),
                ),
          ),
          const Spacer(),
          const Icon(Icons.menu_rounded, color: Color(0xFF4B463E)),
        ],
      ),
    );
  }
}

class Coupon {
  const Coupon({
    required this.amount,
    required this.title,
    required this.description,
    required this.finePrint,
  });

  final String amount;
  final String title;
  final String description;
  final String finePrint;
}

class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
    required this.coupon,
    required this.onApply,
    required this.onReadMore,
  });

  final Coupon coupon;
  final VoidCallback onApply;
  final VoidCallback onReadMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 24,
            offset: Offset(0, 16),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 64,
              decoration: const BoxDecoration(
                color: Color(0xFFB86339),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18),
                  bottomLeft: Radius.circular(18),
                ),
              ),
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    coupon.amount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          coupon.title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF3A332B),
                          ),
                        ),
                        const Spacer(),
                        TextButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color(0x14B86339),
                            foregroundColor: const Color(0xFFB86339),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          onPressed: onApply,
                          icon: const Icon(Icons.sell_outlined, size: 16),
                          label: const Text(
                            'Apply',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      coupon.description,
                      style: const TextStyle(
                        color: Color(0xFF6E655F),
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 1,
                      color: const Color(0xFFE7DFDA),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      coupon.finePrint,
                      style: const TextStyle(
                        color: Color(0xFF9C8E85),
                        fontSize: 12,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: onReadMore,
                      child: const Text(
                        'Read more',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF4B463E),
                        ),
                      ),
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

class _GreenBanner extends StatelessWidget {
  const _GreenBanner();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Rewards unlocked! We\'ll notify you via email.'),
        ),
      ),
      child: Container(
        width: double.infinity,
        color: const Color(0xFF2C8C2B),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.local_offer_outlined, color: Colors.white, size: 18),
            SizedBox(width: 8),
            Text(
              'Book now & Unlock exclusive rewards!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BookingSummary extends StatelessWidget {
  const _BookingSummary({required this.onReserve});

  final VoidCallback onReserve;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 28),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '₹16,000 for 2 nights',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF3A332B),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '24 Apr - 26 Apr | 8 guests',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF9C8E85),
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFB86339),
              padding:
                  const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            onPressed: onReserve,
            child: const Text(
              'Reserve',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SquareButton extends StatelessWidget {
  const _SquareButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE7DFDA)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 18, color: const Color(0xFF4B463E)),
        ),
      ),
    );
  }
}
