import 'package:flutter/material.dart';

/// The teal "Image Here" placeholder box reused wherever the mock
/// shows a product/photo placeholder (Explore list, Home banner,
/// Best Seller cards).
class ImagePlaceholderBox extends StatelessWidget {
  final double? iconSize;
  final double borderRadius;

  const ImagePlaceholderBox({
    super.key,
    this.iconSize = 40,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF3E8AA0),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.image_outlined,
            color: Colors.white,
            size: iconSize,
          ),
          const SizedBox(height: 6),
          const Text(
            'Image Here',
            style: TextStyle(color: Colors.white70, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
