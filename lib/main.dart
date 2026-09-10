import 'package:flutter/material.dart';

void main() {
  runApp(const ExploreHomeApp());
}

class ExploreHomeApp extends StatelessWidget {
  const ExploreHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Explore Home'), // tiêu đề
              floating:
                  true, // cho phép thanh ứng dụng xuất hiện khi người dùng cuộn lên
              snap:
                  true, // cho phép thanh ứng dụng xuất hiện ngay lập tức khi người dùng cuộn lên
              backgroundColor: Colors.blue,
              toolbarHeight: 80, // chiều cao của thanh ứng dụng
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 220,
                        height: 120,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/1f/cd/95/m-t-tru-c-khach-s-n.jpg?w=900&h=-1&s=1',
                              fit: BoxFit.cover,
                            ),
                            const Positioned(
                              left: 8,
                              bottom: 8,
                              child: Text(
                                'Duc',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/1f/cd/95/m-t-tru-c-khach-s-n.jpg?w=900&h=-1&s=1',
                        fit: BoxFit.cover,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/22/1f/cd/95/m-t-tru-c-khach-s-n.jpg?w=900&h=-1&s=1',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Friend'),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.dalattrip.com/media/2012/10/Dalat-Vietnam-Dalat-central-lake.jpg',
                    ),
                  ),
                  title: Text('Friend 1'),
                  subtitle: Text('Subtitle 1'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.dalattrip.com/media/2012/10/Dalat-Vietnam-Dalat-central-lake.jpg',
                    ),
                  ),
                  title: Text('Friend 1'),
                  subtitle: Text('Subtitle 1'),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
