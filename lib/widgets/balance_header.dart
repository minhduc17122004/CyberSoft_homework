import 'package:flutter/material.dart';

/// Shows "Your Balance" label + amount on the left,
/// and a round avatar/icon on the right.
class BalanceHeader extends StatelessWidget {
  final double balance;

  const BalanceHeader({super.key, required this.balance});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Balance',
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            Text(
              '\$${balance.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 22,
          backgroundColor: Color(0xFF5B9A3B),
        ),
      ],
    );
  }
}
