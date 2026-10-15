import 'package:flutter/material.dart';
import '../models/quick_category.dart';
import '../models/best_seller_product.dart';
import '../widgets/home_top_bar.dart';
import '../widgets/search_bar_with_filter.dart';
import '../widgets/banner_carousel.dart';
import '../widgets/quick_category_grid.dart';
import '../widgets/best_seller_section.dart';

class HomeScreen extends StatefulWidget {
  /// Passed in when Home is reached by tapping a category on the
  /// Explore screen, so the search box already shows what the user
  /// picked instead of landing empty.
  final String? initialSearchQuery;

  const HomeScreen({super.key, this.initialSearchQuery});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(
      text: widget.initialSearchQuery ?? '',
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final canPop = Navigator.of(context).canPop();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Only shown when Home was pushed from Explore, so the
              // user has an obvious way back.
              if (canPop)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              const HomeTopBar(userName: 'Samantha William', cartCount: 3),
              const SizedBox(height: 20),
              SearchBarWithFilter(controller: _searchController),
              const SizedBox(height: 20),
              const BannerCarousel(),
              const SizedBox(height: 24),
              QuickCategoryGrid(categories: quickCategories),
              const SizedBox(height: 24),
              BestSellerSection(
                products: bestSellerProducts,
                onSeeAll: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
