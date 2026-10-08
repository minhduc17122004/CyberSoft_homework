import 'package:flutter/material.dart';
import 'screens/key_lab_screen.dart';
import 'screens/test.dart';

void main() {
  runApp(const KeyLabApp());
}

class KeyLabApp extends StatelessWidget {
  const KeyLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      initialRoute: '/',
      routes: {
        '/': (_) => const TestScreen(),
        '/key-lab': (_) => const KeyLabScreen(),
        '/example': (_) => const NavigationExampleScreen(),
        '/arguments': (_) => const NavigationArgumentsScreen(),
        '/child-result': (_) => const ChildResultScreen(),
      },
    );
  }
}
