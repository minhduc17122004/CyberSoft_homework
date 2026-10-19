import 'shoe.dart';

/// Một dòng trong giỏ hàng: giày + số lượng.
/// `quantity` là mutable để tăng số lượng khi thêm trùng.
class CartItem {
  final Shoe shoe;
  int quantity;

  CartItem({required this.shoe, this.quantity = 1});

  double get total => shoe.price * quantity;
}
