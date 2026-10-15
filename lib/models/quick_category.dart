import 'package:flutter/material.dart';

class QuickCategory {
  final String name;
  final IconData icon;

  const QuickCategory({required this.name, required this.icon});
}

const List<QuickCategory> quickCategories = [
  QuickCategory(name: 'Music', icon: Icons.music_note_outlined),
  QuickCategory(name: 'Property', icon: Icons.apartment_outlined),
  QuickCategory(name: 'Game', icon: Icons.sports_esports_outlined),
  QuickCategory(name: 'Gadget', icon: Icons.smartphone_outlined),
  QuickCategory(name: 'Electronic', icon: Icons.desktop_windows_outlined),
  QuickCategory(name: 'Property', icon: Icons.content_cut_outlined),
  QuickCategory(name: 'Game', icon: Icons.local_shipping_outlined),
  QuickCategory(name: 'Book', icon: Icons.menu_book_outlined),
];
