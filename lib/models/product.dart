class Product {
  final String name;
  final int stock;
  final double price;
  bool isFavorite;

  Product({
    required this.name,
    required this.stock,
    required this.price,
    this.isFavorite = false,
  });
}

List<Product> fruitProducts = [
  Product(name: 'Orange', stock: 1000, price: 15),
  Product(name: 'Apple', stock: 1000, price: 20),
  Product(name: 'Banana', stock: 1000, price: 5),
  Product(name: 'Mango', stock: 1000, price: 15),
  Product(name: 'Orange', stock: 1000, price: 10),
];
