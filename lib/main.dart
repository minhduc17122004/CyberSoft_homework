import 'package:flutter/material.dart';
import 'package:bt_oop/screens/onboarding_screen.dart';

void main() {
  runApp(const GroceryApp());
}

class GroceryApp extends StatelessWidget {
  const GroceryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorSchemeSeed: const Color(0xFF5B9A3B),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}
