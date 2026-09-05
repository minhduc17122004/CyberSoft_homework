import 'package:flutter/material.dart';
import '../models/category.dart';
import 'package:bt_oop/widgets/balance_header.dart';
import 'package:bt_oop/widgets/promo_banner.dart';
import 'package:bt_oop/widgets/category_card.dart';
import 'fruit_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onCategoryTap(BuildContext context, Category category) {
    // Only "Fruit" has a real destination screen in this exercise;
    // other categories could get their own screens the same way.
    if (category.name == 'Fruit') {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (_) => const FruitListScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BalanceHeader(balance: 1700.00),
              const SizedBox(height: 24),
              const PromoBanner(
                title: 'Buy Orange 10 Kg',
                subtitle: 'Get discount 25%',
              ),
              const SizedBox(height: 24),
              const Text(
                'For you',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: homeCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.3,
                  ),
                  itemBuilder: (context, index) {
                    final category = homeCategories[index];
                    return CategoryCard(
                      category: category,
                      onTap: () => _onCategoryTap(context, category),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
