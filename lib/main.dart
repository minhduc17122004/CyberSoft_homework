import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: PhotosScreen()));
}

class PhotosScreen extends StatelessWidget {
  PhotosScreen({super.key});

  // ---- DỮ LIỆU GIẢ LẬP (list) ----
  final List<String> photoUrls = List.generate(
    40,
    (index) => 'https://picsum.photos/id/${1011 + index}/200/200',
  );

  final List<Map<String, String>> recentDays = const [
    {'label': 'Today', 'image': 'https://picsum.photos/id/1035/300/300'},
    {'label': 'Mar 15', 'image': 'https://picsum.photos/id/1027/300/300'},
    {'label': 'Feb 20', 'image': 'https://picsum.photos/id/1025/300/300'},
    {'label': 'Jan 05', 'image': 'https://picsum.photos/id/1041/300/300'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: ListView(
          // ListView cha để cuộn toàn bộ trang
          padding: const EdgeInsets.symmetric(horizontal: 12),
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            Text(
              '${photoUrls.length} Items',
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 8),

            // ---- GRIDVIEW LOAD ĐỘNG TỪ LIST ----
            GridView.builder(
              shrinkWrap: true, // để GridView nằm gọn trong ListView
              physics: const NeverScrollableScrollPhysics(), // không cuộn riêng
              itemCount: photoUrls.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, // 4 ảnh/hàng giống hình
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemBuilder: (context, index) {
                return Image.network(photoUrls[index], fit: BoxFit.cover);
              },
            ),

            const SizedBox(height: 20),
            const Text(
              'Recent Days',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // ---- LISTVIEW NGANG LOAD ĐỘNG TỪ LIST ----
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recentDays.length,
                itemBuilder: (context, index) {
                  final day = recentDays[index];
                  return Container(
                    width: 110,
                    margin: const EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(day['image']!, fit: BoxFit.cover),
                          Positioned(
                            left: 8,
                            bottom: 8,
                            child: Text(
                              day['label']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(color: Colors.black, blurRadius: 4),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ---- HEADER: Photos, Search, Select, Avatar ----
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Photos',
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.blue,
              child: const Icon(Icons.search, color: Colors.white),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Select', style: TextStyle(color: Colors.blue)),
            ),
            const SizedBox(width: 6),
            const CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
          ],
        ),
      ],
    );
  }
}
