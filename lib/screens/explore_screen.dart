import 'package:flutter/material.dart';
import '../models/explore_category.dart';
import '../widgets/explore_header.dart';
import '../widgets/explore_category_card.dart';
import 'home_screen.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  void _openHome(BuildContext context, String categoryName) {
    // Navigate to Home, pre-filling the search box with the tapped
    // category so the transition feels purposeful rather than a
    // random jump between unrelated screens.
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HomeScreen(initialSearchQuery: categoryName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF16333F),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ExploreHeader(),
              const SizedBox(height: 24),
              Expanded(
                child: ListView.separated(
                  itemCount: exploreCategories.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 20),
                  itemBuilder: (context, index) {
                    final category = exploreCategories[index];
                    return ExploreCategoryCard(
                      name: category.name,
                      onTap: () => _openHome(context, category.name),
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
