import 'package:flutter/material.dart';
import '../models/shoe.dart';
import 'section_title.dart';
import 'shoe_card.dart';

/// Tiêu đề "Danh sách giày" + list ngang các ShoeCard.
class ShoeCatalogSection extends StatelessWidget {
  final List<Shoe> shoes;
  final void Function(Shoe shoe) onAdd;

  const ShoeCatalogSection({
    super.key,
    required this.shoes,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle('Danh sách giày'),
        SizedBox(
          height: 225,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            itemCount: shoes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final shoe = shoes[index];
              return ShoeCard(shoe: shoe, onAdd: () => onAdd(shoe));
            },
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
