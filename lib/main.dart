import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: PhotoScreen()),
  );
}

class PhotoItem extends StatelessWidget {
  final String imageUrl;

  const PhotoItem({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          imageUrl,
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),

        Positioned(
          top: 12,
          right: 12,
          child: Icon(Icons.favorite, color: Colors.red, size: 28),
        ),
      ],
    );
  }
}

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery')),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            PhotoItem(imageUrl: 'https://picsum.photos/id/1015/800/500'),
            PhotoItem(imageUrl: 'https://picsum.photos/id/1016/800/500'),
            PhotoItem(imageUrl: 'https://picsum.photos/id/1018/800/500'),
          ],
        ),
      ),
    );
  }
}
