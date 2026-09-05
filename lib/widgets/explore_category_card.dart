import 'package:flutter/material.dart';
import 'image_placeholder_box.dart';

/// A single category card in the Explore list. Tapping it is the
/// navigation trigger that pushes the Home screen, pre-filled with
/// this category's name in the search box.
class ExploreCategoryCard extends StatelessWidget {
  final String name;
  final VoidCallback onTap;

  const ExploreCategoryCard({
    super.key,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 160,
              width: double.infinity,
              child: ImagePlaceholderBox(borderRadius: 0),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xFFEDEDED),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
