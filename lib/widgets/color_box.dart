import 'package:flutter/material.dart';

/// A colored square. When [onTap] is provided the box is tappable
/// (used for the 3 bottom boxes); the top display box passes no
/// [onTap] since it's just a result indicator.
class ColorBox extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback? onTap;

  const ColorBox({
    super.key,
    required this.color,
    this.size = 80,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        color: color,
      ),
    );
  }
}
