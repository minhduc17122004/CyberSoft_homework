import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
  // Khởi tạo ứng dụng Flutter bằng cách chạy widget gốc là MainApp.
}

class MainApp extends StatelessWidget {
  // Định nghĩa một widget không thay đổi trạng thái (StatelessWidget) có tên là MainApp.
  const MainApp({super.key});
  // Constructor  của mainApp, sử dụng 'const' để tối ưu hóa hiệu suất và 'super.key' để truyền key cho widget cha.
  // match- parent --> container
  // wrap-content --> text, card, button, image, icon, textfield, listview, gridview
  @override
  Widget build(BuildContext context) {
    // Phương thức build trả về giao diện của widget

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Profile Card')),
        body: Center(
          child: Container(
            width: 360,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 72,
                  backgroundImage: NetworkImage(
                    'https://thethaovanhoa.mediacdn.vn/372676912336973824/2022/12/22/4-1671640734684233671117-1671684529811-1671684530300552630920.jpg',
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Nguyễn Văn A',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.4,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(text: 'Lập trình viên Flutter với'),
                      TextSpan(
                        text: ' 5 năm kinh nghiệm. ',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: 'Chuyên về '),
                      TextSpan(
                        text: 'UI/UX & Backend.',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle, color: Colors.green, size: 24),
                    SizedBox(width: 8),
                    Text(
                      'Đang hoạt động',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
