class Student {
  String name;
  double math;
  double physics;
  double chemistry;

  Student(this.name, this.math, this.physics, this.chemistry);

  // Tính điểm trung bình
  double calculateAverage() {
    return (math + physics + chemistry) / 3;
  }

  // In thông tin, xếp loại và kiểm tra trượt môn
  void printInfo() {
    double average = calculateAverage();
    String rank;

    if (average >= 8) {
      rank = "Giỏi";
    } else if (average >= 6.5) {
      rank = "Khá";
    } else if (average >= 5) {
      rank = "Trung bình";
    } else {
      rank = "Yếu";
    }

    print("===== THÔNG TIN SINH VIÊN =====");
    print("Họ tên: $name");
    print("Điểm Toán: $math");
    print("Điểm Lý: $physics");
    print("Điểm Hóa: $chemistry");
    print("Điểm trung bình: ${average.toStringAsFixed(2)}");
    print("Xếp loại: $rank");

    if (math < 4 || physics < 4 || chemistry < 4) {
      print("Kết quả: Trượt môn");
    } else {
      print("Kết quả: Đậu");
    }
  }
}

void main() {
  Student student = Student("Nguyễn Văn A", 8, 7, 9);

  student.printInfo();
}
