import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: ProfileScreen()),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF5FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFBF5FA),
        elevation: 0,
        title: const Text(
          'Profile & Favorite Card',
          style: TextStyle(color: Colors.black87),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 24),
            AvatarWithStatus(imageUrl: 'https://i.pravatar.cc/150?img=12'),
            SizedBox(height: 24),
            FavoriteCard(
              imageUrl: 'https://picsum.photos/id/1015/800/500',
              title: 'Bãi biển Maldives',
              subtitle: 'Một trong những điểm du lịch đẹp nhất thế giới!',
            ),
            SizedBox(height: 16),
            FavoriteCard(
              imageUrl: 'https://picsum.photos/id/1015/800/500',
              title: 'Bãi biển Maldives',
              subtitle: 'Một trong những điểm du lịch đẹp nhất thế giới!',
            ),
          ],
        ),
      ),
    );
  }
}

// ---- Avatar có chấm xanh "online" ----
class AvatarWithStatus extends StatelessWidget {
  final String imageUrl;

  const AvatarWithStatus({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(radius: 42, backgroundImage: NetworkImage(imageUrl)),
        Positioned(
          bottom: 2,
          right: 2,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}

// ---- Card ảnh có icon trái tim + tiêu đề + mô tả ----
class FavoriteCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const FavoriteCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: double.infinity,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black.withOpacity(0.4),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 13, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
