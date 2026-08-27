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
    List<Map<String, dynamic>> users = [
      {
        'name': 'User 1',
        'subtitle': 'This is user 1',
        'phone': '123-456-7890',
        'status': 'Online',
        'imageUrl':
            'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      },
      {
        'name': 'User 2',
        'subtitle': 'This is user 2',
        'phone': '123-456-7890',
        'status': 'Offline',
        'imageUrl':
            'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      },
      {
        'name': 'User 3',
        'subtitle': 'This is user 3',
        'phone': '123-456-7890',
        'status': 'Busy',
        'imageUrl':
            'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      },
      {
        'name': 'User 4',
        'subtitle': 'This is user 4',
        'phone': '123-456-7890',
        'status': 'Away',
        'imageUrl':
            'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      },
    ];
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
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16); // khoang cách giữa các card
        },
        itemBuilder: (BuildContext context, int index) {
          final user = users[index];

          return ListTile(
            leading: AvatarWithStatus(imageUrl: user['imageUrl']),
            title: Text(user['name']),
            subtitle: Text(
              '${user['subtitle']} | ${user['phone']} | ${user['status']}',
            ),
          );
        },
        itemCount: users.length, // Số lượng card hiển thị
      ),
    );
  }
}

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
            color: Colors.black.withValues(alpha: 0.05),
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
                  backgroundColor: Colors.black.withValues(alpha: 0.4),
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
