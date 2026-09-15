import 'package:flutter/material.dart';
import '../widgets/color_box.dart';

class ColorChangerScreen extends StatefulWidget {
  const ColorChangerScreen({super.key});

  @override
  State<ColorChangerScreen> createState() => _ColorChangerScreenState();
}

class _ColorChangerScreenState extends State<ColorChangerScreen> {
  // The state that drives the whole screen: whichever color this
  // holds is what the top box currently shows.
  Color _selectedColor = Colors.pink;

  static const List<Color> _options = [
    Colors.green,
    Colors.red,
    Colors.yellow,
  ];

  void _onOptionTap(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF4F7),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Top box: reflects the current state, not tappable itself.
            ColorBox(color: _selectedColor, size: 130),
            const SizedBox(height: 40),
            // Bottom row: 3 tappable boxes that update the state.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _options
                  .map(
                    (color) => ColorBox(
                      color: color,
                      onTap: () => _onOptionTap(color),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
