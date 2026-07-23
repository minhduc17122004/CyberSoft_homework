import 'dart:io';

// Bài 3: Đếm số chẵn và lẻ
// Nhập vào số nguyên dương n. Đếm số lượng số chẵn và lẻ từ 1 đến n bằng vòng lặp while.

void main() {
  print('Nhập vào số nguyên dương n: ');
  int n = int.parse(stdin.readLineSync()!);

  int demChan = 0;
  int demLe = 0;
  int i = 1;

  while (i <= n) {
    if (i % 2 == 0) {
      demChan++;
    } else {
      demLe++;
    }
    i++;
  }

  print('Số lượng số chẵn từ 1 đến $n là: $demChan');
  print('Số lượng số lẻ từ 1 đến $n là: $demLe');
}
