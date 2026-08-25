import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
  // Khởi tạo ứng dụng Flutter bằng cách chạy widget gốc là MainApp.
}

class MainApp extends StatelessWidget {
  // Định nghĩa một widget không thay đổi trạng thái (StatelessWidget) có tên là MainApp.
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Strawberry Pavlova',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'serif',
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Pavlova is a meringue-based dessert named after the '
                        'Russian ballerina Anna Pavlova. Pavlova features a '
                        'crisp crust and soft, light inside, topped with '
                        'fruit and whipped cream.',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontFamily: 'serif'),
                      ),
                      const SizedBox(height: 12),

                      // Khung viền đỏ chứa đánh giá + thông tin nấu ăn
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.star, size: 12, color: Colors.black),
                                SizedBox(width: 2),
                                Icon(Icons.star, size: 12, color: Colors.black),
                                SizedBox(width: 2),
                                Icon(Icons.star, size: 12, color: Colors.black),
                                SizedBox(width: 2),
                                Icon(Icons.star, size: 12, color: Colors.black),
                                SizedBox(width: 2),
                                Icon(Icons.star, size: 12, color: Colors.black),
                                SizedBox(width: 8),
                                Text(
                                  '170 Reviews',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),

                            // Hàng PREP / COOK / FEEDS
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                _InfoItem(
                                  icon: Icons.description_outlined,
                                  label: 'PREP:',
                                  value: '25 min',
                                ),
                                _InfoItem(
                                  icon: Icons.access_time,
                                  label: 'COOK:',
                                  value: '1 hr',
                                ),
                                _InfoItem(
                                  icon: Icons.restaurant,
                                  label: 'FEEDS:',
                                  value: '4-6',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 16),

                // ----- CỘT PHẢI: hình ảnh -----
                Expanded( // Đảm bảo widget con có thể mở rộng
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://images.squarespace-cdn.com/content/v1/53883795e4b016c956b8d243/1597822154096-LK0WD8P39LYLJAG0PXJ6/chup-anh-thuc-an-1.jpg',
                      width: 220,
                      height: 260,
                      fit: BoxFit.cover, // Đảm bảo hình ảnh không bị thu nhỏ
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget con dùng lại cho mỗi mục PREP / COOK / FEEDS
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.green),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
        ),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
