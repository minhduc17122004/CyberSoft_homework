import 'package:flutter/material.dart';

/// A pill-shaped primary button with a trailing arrow icon,
/// reused wherever a main call-to-action is needed.
class AppPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;

  const AppPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = const Color(0xFF5B9A3B),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward, size: 20),
          ],
        ),
      ),
    );
  }
}
