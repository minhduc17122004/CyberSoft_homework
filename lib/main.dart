import 'package:flutter/material.dart';
import 'screens/color_changer_screen.dart';

void main() {
  runApp(const StatefulColorApp());
}

class StatefulColorApp extends StatelessWidget {
  const StatefulColorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Color Exercise',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const ColorChangerScreen(),
    );
  }
}
