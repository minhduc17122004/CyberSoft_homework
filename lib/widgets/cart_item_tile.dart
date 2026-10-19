import 'package:flutter/material.dart';
import '../models/cart_item.dart';
import 'shoe_image.dart';

/// Một dòng giỏ hàng: ảnh, tên, giá (xanh), số lượng (xanh dương), nút xoá (đỏ).
class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onDelete;

  const CartItemTile({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ShoeImage(
              imageUrl: item.shoe.imageUrl,
              width: 56,
              height: 56,
              borderRadius: 8,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.shoe.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Giá: ${item.shoe.price} \$',
                        style: const TextStyle(color: Colors.green),
                      ),
                      Text(
                        'Số lượng: ${item.quantity}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
