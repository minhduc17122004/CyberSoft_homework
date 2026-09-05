import 'package:flutter/material.dart';
import 'screens/explore_screen.dart';

void main() {
  runApp(const ExploreHomeApp());
}

class ExploreHomeApp extends StatelessWidget {
  const ExploreHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore & Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorSchemeSeed: const Color(0xFF3E8AA0),
        useMaterial3: true,
      ),
      home: const ExploreScreen(),
    );
  }
}
