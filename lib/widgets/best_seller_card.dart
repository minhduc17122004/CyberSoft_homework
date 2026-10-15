import 'package:flutter/material.dart';
import 'image_placeholder_box.dart';

class BestSellerCard extends StatelessWidget {
  final String name;
  final double rating;

  const BestSellerCard({
    super.key,
    required this.name,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 90,
            width: double.infinity,
            child: ImagePlaceholderBox(iconSize: 26),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              ...List.generate(
                5,
                (index) => const Icon(
                  Icons.star,
                  size: 12,
                  color: Color(0xFFE98B4B),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                rating.toStringAsFixed(1),
                style: const TextStyle(fontSize: 11, color: Colors.black54),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
