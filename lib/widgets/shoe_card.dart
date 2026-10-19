import 'package:flutter/material.dart';
import '../models/shoe.dart';
import 'shoe_image.dart';

/// Thẻ giày trong danh sách ngang, có nút "Thêm vào giỏ".
class ShoeCard extends StatelessWidget {
  final Shoe shoe;
  final VoidCallback onAdd;

  const ShoeCard({super.key, required this.shoe, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Card(
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShoeImage(
              imageUrl: shoe.imageUrl,
              width: double.infinity,
              height: 90,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoe.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('${shoe.price} \$', style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: SizedBox(
                width: double.infinity,
                height: 36,
                child: ElevatedButton(
                  onPressed: onAdd,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Text(
                    'Thêm vào giỏ',
                    style: TextStyle(fontSize: 12),
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
