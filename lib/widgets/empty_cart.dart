import 'package:flutter/material.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text(
          'Giỏ hàng trống - hãy thêm giày bên dưới',
          style: TextStyle(color: Colors.black54),
        ),
      ),
    );
  }
}
