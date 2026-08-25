import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const users = [
      {
        'name': 'Nguyễn Văn An',
        'email': 'an@example.com',
        'phone': '0901 234 567',
        'address': 'Hà Nội',
        'avatar': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'name': 'Trần Thị Bình',
        'email': 'binh@example.com',
        'phone': '0902 345 678',
        'address': 'Đà Nẵng',
        'avatar': 'https://i.pravatar.cc/150?img=47',
      },
      {
        'name': 'Lê Hoàng Cường',
        'email': 'cuong@example.com',
        'phone': '0903 456 789',
        'address': 'Hồ Chí Minh',
        'avatar': 'https://i.pravatar.cc/150?img=5',
      },
      {
        'name': 'Phạm Thị Dung',
        'email': 'dung@example.com',
        'phone': '0904 567 890',
        'address': 'Cần Thơ',
        'avatar': 'https://i.pravatar.cc/150?img=32',
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFFDF6FA),
        appBar: AppBar(
          title: const Text(
            'Thông Tin Người Dùng',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          itemCount: users.length, // Số lượng người dùng
          itemBuilder: (context, index) {
            // Xử lý mỗi người dùng
            final user =
                users[index]; // Khai báo biến user để lưu trữ thông tin người dùng
            return UserInfoItem(
              name: user['name']!,
              email: user['email']!,
              phone: user['phone']!,
              address: user['address']!,
              avatar: NetworkImage(user['avatar']!),
            );
          },
        ),
      ),
    );
  }
}

class UserInfoItem extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String address;
  final ImageProvider avatar; // NetworkImage hoặc AssetImage

  const UserInfoItem({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EAF6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 36, backgroundImage: avatar),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text('Email: $email', style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 2),
                Text(
                  'Số điện thoại: $phone',
                  style: const TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 6),
                Text(
                  'Địa chỉ: $address',
                  style: const TextStyle(fontSize: 14, height: 1.3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
