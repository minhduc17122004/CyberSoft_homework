import 'dart:io';

// Bài 4: Tính giai thừa của một số
// Nhập vào số nguyên dương n. Tính giai thừa: n! = 1 x 2 x 3 x ... x n

void main() {
  print('Nhập vào số nguyên dương n: ');
  int n = int.parse(stdin.readLineSync()!);

  int giaiThua = 1;
  for (int i = 1; i <= n; i++) {
    giaiThua *= i;
  }

  print('Giai thừa của $n là: $n! = $giaiThua');
}
