import '../models/shoe.dart';

/// Dữ liệu dạng List JSON (giống response API trả về).
/// Muốn có ảnh thật: điền "image_url" bằng URL ảnh của bạn.
const List<Map<String, dynamic>> shoeJsonList = [
  {'id': 1, 'name': 'Nike Air Max', 'price': 120.0, 'image_url': ''},
  {'id': 2, 'name': 'Adidas Ultraboost', 'price': 150.0, 'image_url': ''},
  {'id': 3, 'name': 'Puma RS-X', 'price': 100.0, 'image_url': ''},
  {'id': 4, 'name': 'Nike Air Max 2', 'price': 120.0, 'image_url': ''},
  {'id': 5, 'name': 'Nike Air Max 4', 'price': 120.0, 'image_url': ''},
];

/// Chuyển JSON -> List<Shoe> (class object) để UI làm việc với model.
final List<Shoe> shoes = shoeJsonList.map(Shoe.fromJson).toList();
