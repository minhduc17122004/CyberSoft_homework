import 'package:flutter/material.dart';
import '../models/best_seller_product.dart';
import 'best_seller_card.dart';

class BestSellerSection extends StatelessWidget {
  final List<BestSellerProduct> products;
  final VoidCallback? onSeeAll;

  const BestSellerSection({
    super.key,
    required this.products,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Best Seller',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: onSeeAll,
              child: const Text(
                'See All',
                style: TextStyle(
                  color: Color(0xFFE98B4B),
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (_, __) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              final product = products[index];
              return BestSellerCard(
                name: product.name,
                rating: product.rating,
              );
            },
          ),
        ),
      ],
    );
  }
}
