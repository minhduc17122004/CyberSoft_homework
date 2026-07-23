import 'dart:io';

// Bài 5: Đảo ngược số
// Nhập vào một số nguyên dương n. Đảo ngược thứ tự các chữ số bằng vòng lặp while.
// Ví dụ: Input: 1234 -> Output: 4321

void main() {
  print('Nhập vào một số nguyên dương n: ');
  int n = int.parse(stdin.readLineSync()!);

  int soGoc = n;
  int daoNguoc = 0;

  while (n > 0) {
    int chuSo = n % 10;
    daoNguoc = daoNguoc * 10 + chuSo;
    n ~/= 10;
  }

  print('Số $soGoc sau khi đảo ngược là: $daoNguoc');
}
