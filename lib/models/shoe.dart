/// Một đôi giày trong danh sách bán.
class Shoe {
  final int id;
  final String name;
  final double price;
  final String imageUrl; // rỗng -> hiện ảnh placeholder

  const Shoe({
    required this.id,
    required this.name,
    required this.price,
    this.imageUrl = '',
  });

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image_url'] as String? ?? '',
    );
  }
}
