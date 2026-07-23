import 'dart:io';

// Bài 2: Bảng cửu chương
// Nhập vào số nguyên dương n (từ 1 đến 9). In ra bảng cửu chương của số n.

void main() {
  print('Nhập vào số nguyên dương n (từ 1 đến 9): ');
  int n = int.parse(stdin.readLineSync()!);

  print('Bảng cửu chương của $n:');
  for (int i = 1; i <= 10; i++) {
    print('$n x $i = ${n * i}');
  }
}
