import 'package:flutter/material.dart';

class UserData {
  final String id;
  final String name;

  const UserData({required this.id, required this.name});
}

/// Danh sách gốc, cố định 5 user. Khi "reset", ta luôn quay lại đúng
/// thứ tự và dữ liệu này.
const List<UserData> initialUsers = [
  UserData(id: 'u1', name: 'Alice'),
  UserData(id: 'u2', name: 'Bao'),
  UserData(id: 'u3', name: 'Chi'),
  UserData(id: 'u4', name: 'Dao'),
  UserData(id: 'u5', name: 'Em'),
];

/// Màu gắn CỐ ĐỊNH theo id (không phải theo vị trí trong danh sách),
/// để khi reorder, bạn luôn nhận ra "đây vẫn là Alice" nhờ màu, bất kể
/// Alice đang nằm ở vị trí nào.
const Map<String, Color> userColors = {
  'u1': Colors.redAccent,
  'u2': Colors.blueAccent,
  'u3': Colors.green,
  'u4': Colors.orange,
  'u5': Colors.purple,
};

Color colorForUser(UserData user) => userColors[user.id] ?? Colors.grey;
