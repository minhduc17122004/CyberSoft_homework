import 'dart:io';

// Bài 1: Tính tổng số nguyên
// Nhập vào số nguyên dương n. Tính tổng các số từ 1 đến n bằng vòng lặp for.

void main() {
  print('Nhập vào số nguyên dương n: ');
  int n = int.parse(stdin.readLineSync()!);

  int tong = 0;
  for (int i = 1; i <= n; i++) {
    tong += i;
  }

  print('Tổng các số từ 1 đến $n là: $tong');
}
