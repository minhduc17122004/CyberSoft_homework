import 'package:flutter/material.dart';
import '../models/user_data.dart';

/// Mỗi UserTile có 1 counter RIÊNG, lưu trong State của chính nó -
/// hoàn toàn độc lập với `user` (data) được truyền từ ngoài vào qua
/// constructor. Đây chính là lý do bài tập này thú vị: `user` (dữ
/// liệu) và `_counter` (State) là 2 thứ TÁCH RỜI NHAU, và câu hỏi là
/// "khi list bị xáo trộn vị trí, State có đi theo đúng user hay
/// không?" — câu trả lời phụ thuộc hoàn toàn vào có key hay không.
class UserTile extends StatefulWidget {
  final UserData user;

  const UserTile({super.key, required this.user});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    debugPrint(
      'initState -> TẠO STATE MỚI cho "${widget.user.name}" '
      '(id=${widget.user.id})',
    );
  }

  @override
  Widget build(BuildContext context) {
    // Log này là chỗ quan trọng nhất để quan sát: nếu sau khi reorder
    // mà bạn thấy counter của 1 user "tự nhiên" khác với số bạn vừa
    // bấm cho user đó trước đó, đọc lại log build() sẽ thấy rõ:
    // cùng 1 State (cùng _counter) đang bị build() với 1 `user` khác.
    debugPrint(
      'build -> hiển thị "${widget.user.name}" với counter=$_counter',
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: colorForUser(widget.user),
            child: Text(
              widget.user.name[0],
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              widget.user.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Text('Counter: $_counter', style: const TextStyle(fontSize: 13)),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: () => setState(() => _counter++),
          ),
        ],
      ),
    );
  }
}
