import 'package:flutter/material.dart';
import '../data/shoe_data.dart';
import '../models/cart_item.dart';
import '../models/shoe.dart';
import '../widgets/cart_item_tile.dart';
import '../widgets/cart_total_bar.dart';
import '../widgets/empty_cart.dart';
import '../widgets/section_title.dart';
import '../widgets/shoe_catalog_section.dart';

class ShoeStoreScreen extends StatefulWidget {
  const ShoeStoreScreen({super.key});

  @override
  State<ShoeStoreScreen> createState() => _ShoeStoreScreenState();
}

class _ShoeStoreScreenState extends State<ShoeStoreScreen> {
  // State duy nhất của màn hình: danh sách giỏ hàng.
  final List<CartItem> _cart = [];

  double get _total =>
      _cart.fold<double>(0, (sum, item) => sum + item.total);

  void _addToCart(Shoe shoe) {
    setState(() {
      final index = _cart.indexWhere((item) => item.shoe.id == shoe.id);
      if (index >= 0) {
        // Thêm trùng -> tăng số lượng, không thêm dòng mới.
        _cart[index].quantity++;
      } else {
        _cart.add(CartItem(shoe: shoe));
      }
    });
  }

  void _removeFromCart(CartItem item) {
    setState(() => _cart.remove(item));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Shoe Store'),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: SectionTitle('Giỏ hàng')),
          if (_cart.isEmpty)
            const SliverToBoxAdapter(child: EmptyCart())
          else
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = _cart[index];
                  return CartItemTile(
                    key: ValueKey(item.shoe.id),
                    item: item,
                    onDelete: () => _removeFromCart(item),
                  );
                },
                childCount: _cart.length,
              ),
            ),
          SliverToBoxAdapter(child: CartTotalBar(total: _total)),
          SliverToBoxAdapter(
            child: ShoeCatalogSection(shoes: shoes, onAdd: _addToCart),
          ),
        ],
      ),
    );
  }
}
