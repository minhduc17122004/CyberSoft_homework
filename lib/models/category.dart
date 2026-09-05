class Category {
  final String name;
  final String emoji;

  const Category({required this.name, required this.emoji});
}

const List<Category> homeCategories = [
  Category(name: 'Fruit', emoji: '🍊'),
  Category(name: 'Vegetable', emoji: '🥬'),
  Category(name: 'Cookies', emoji: '🍩'),
  Category(name: 'Meat', emoji: '🥩'),
];
