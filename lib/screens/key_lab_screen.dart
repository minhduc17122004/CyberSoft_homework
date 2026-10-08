import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../widgets/user_tile.dart';

class KeyLabScreen extends StatefulWidget {
  const KeyLabScreen({super.key});

  @override
  State<KeyLabScreen> createState() => _KeyLabScreenState();
}

class _KeyLabScreenState extends State<KeyLabScreen> {
  List<UserData> _users = List.of(initialUsers);
  bool _useKey = false;

  void _shuffle() {
    debugPrint('\n>>> XÁO TRỘN danh sách (useKey=$_useKey) <<<');
    setState(() => _users.shuffle());
  }

  void _reset() {
    debugPrint('\n>>> RESET danh sách về thứ tự ban đầu <<<');
    setState(() => _users = List.of(initialUsers));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Key Lab')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Toggle y hệt 2 "phiên bản" đề bài yêu cầu thử:
            //   false -> UserTile(user: user)                  [không key]
            //   true  -> UserTile(key: ValueKey(user.id), user: user)
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Dùng key: ValueKey(user.id)'),
              subtitle: Text(
                _useKey
                    ? 'ĐÚNG: counter sẽ đi theo đúng user dù đổi vị trí'
                    : 'TẮT: không dùng key -> xem counter có "đi lạc" không',
                style: TextStyle(
                  color: _useKey ? Colors.green[700] : Colors.red[700],
                ),
              ),
              value: _useKey,
              onChanged: (value) => setState(() => _useKey = value),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: _shuffle,
                    icon: const Icon(Icons.shuffle),
                    label: const Text('Xáo trộn danh sách'),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  onPressed: _reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Thử: bấm + cho vài tile để counter mỗi người khác nhau, '
              'rồi bấm "Xáo trộn" và so sánh counter với tên/màu avatar.',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (context, index) {
                  final user = _users[index];

                  // Đây chính là 2 dòng cốt lõi của cả bài tập.
                  return _useKey
                      ? UserTile(key: ValueKey(user.id), user: user)
                      : UserTile(user: user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
