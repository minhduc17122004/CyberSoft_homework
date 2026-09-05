class BestSellerProduct {
  final String name;
  final double rating;

  const BestSellerProduct({required this.name, required this.rating});
}

const List<BestSellerProduct> bestSellerProducts = [
  BestSellerProduct(name: 'Plant', rating: 5.0),
  BestSellerProduct(name: 'Lamp', rating: 5.0),
  BestSellerProduct(name: 'Chair', rating: 5.0),
];
