import 'dart:math';

void main() {
  // =========================
  // Bài 1: Hình chữ nhật
  // =========================
  double length = 8;
  double width = 5;

  double rectanglePerimeter = (length + width) * 2;
  double rectangleArea = length * width;

  print("===== Bài 1 =====");
  print("Chu vi hình chữ nhật: $rectanglePerimeter");
  print("Diện tích hình chữ nhật: $rectangleArea");

  // =========================
  // Bài 2: Hình tam giác
  // =========================
  double a = 3;
  double b = 4;
  double c = 5;
  double h = 4;

  double trianglePerimeter = a + b + c;
  double triangleArea = (a * h) / 2;

  print("\n===== Bài 2 =====");
  print("Chu vi hình tam giác: $trianglePerimeter");
  print("Diện tích hình tam giác: $triangleArea");

  // =========================
  // Bài 3.1: Phương trình bậc nhất
  // ax + b = 0
  // =========================
  double x;

  a = 2;
  b = -4;

  print("\n===== Bài 3.1 =====");

  if (a == 0) {
    if (b == 0) {
      print("Phương trình vô số nghiệm");
    } else {
      print("Phương trình vô nghiệm");
    }
  } else {
    x = -b / a;
    print("Nghiệm x = $x");
  }

  // =========================
  // Bài 3.2: Phương trình bậc hai
  // ax² + bx + c = 0
  // =========================
  a = 1;
  b = -3;
  c = 2;

  double delta = b * b - 4 * a * c;

  print("\n===== Bài 3.2 =====");

  if (delta > 0) {
    double x1 = (-b + sqrt(delta)) / (2 * a);
    double x2 = (-b - sqrt(delta)) / (2 * a);

    print("x1 = $x1");
    print("x2 = $x2");
  } else if (delta == 0) {
    x = -b / (2 * a);
    print("Nghiệm kép x = $x");
  } else {
    print("Phương trình vô nghiệm");
  }
}
