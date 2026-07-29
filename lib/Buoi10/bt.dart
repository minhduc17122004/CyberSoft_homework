import 'dart:io';

// ================================================================
// HỆ THỐNG QUẢN LÝ TRƯỜNG HỌC (OOP: Kế thừa - Đa hình - Đóng gói)
// ================================================================

// ----------------------------------------------------------------
// LỚP CHA: Person
// Chứa các thuộc tính và hành vi CHUNG cho mọi người trong trường
// ----------------------------------------------------------------
class Person {
  String id;
  String name;
  int age;
  String gender;

  Person({
    required this.id,
    required this.name,
    required this.age,
    required this.gender,
  });

  // Phương thức chung, sẽ được các lớp con GHI ĐÈ (override) lại
  void hienThiThongTin() {
    print('ID: $id | Họ tên: $name | Tuổi: $age | Giới tính: $gender');
  }
}

// ----------------------------------------------------------------
// LỚP CON: Student (kế thừa từ Person)
// ----------------------------------------------------------------
class Student extends Person {
  String grade;
  List<double> diemSo;

  Student({
    required super.id,
    required super.name,
    required super.age,
    required super.gender,
    required this.grade,
    List<double>? diemSo,
  }) : diemSo = diemSo ?? [];

  // Thêm 1 điểm môn học cho học sinh
  void themDiem(double diem) {
    diemSo.add(diem);
  }

  // Tính điểm trung bình của học sinh
  double tinhDiemTrungBinh() {
    if (diemSo.isEmpty) return 0;
    double tong = 0;
    for (double d in diemSo) {
      tong += d;
    }
    return tong / diemSo.length;
  }

  // GHI ĐÈ (override) phương thức hienThiThongTin của lớp cha
  // -> đây là ví dụ về TÍNH ĐA HÌNH (polymorphism)
  @override
  void hienThiThongTin() {
    super.hienThiThongTin(); // gọi lại phương thức gốc của Person
    print(
      '   Lớp: $grade | Điểm các môn: $diemSo | '
      'ĐTB: ${tinhDiemTrungBinh().toStringAsFixed(2)}',
    );
  }
}

// ----------------------------------------------------------------
// LỚP CON: Teacher (kế thừa từ Person)
// ----------------------------------------------------------------
class Teacher extends Person {
  String subject;
  double salary;

  Teacher({
    required super.id,
    required super.name,
    required super.age,
    required super.gender,
    required this.subject,
    required this.salary,
  });

  @override
  void hienThiThongTin() {
    super.hienThiThongTin();
    print('   Môn dạy: $subject | Lương: ${salary.toStringAsFixed(0)} đ');
  }
}

// ----------------------------------------------------------------
// LỚP Classroom: quản lý 1 lớp học (giáo viên + danh sách học sinh)
// ----------------------------------------------------------------
class Classroom {
  String id;
  String name;
  List<Student> students = [];
  Teacher? teacher;

  Classroom({required this.id, required this.name});

  // Thêm học sinh vào lớp
  void themHocSinh(Student sv) {
    students.add(sv);
    print('Đã thêm học sinh "${sv.name}" vào lớp "$name"!');
  }

  // Gán giáo viên phụ trách lớp
  void ganGiaoVien(Teacher gv) {
    teacher = gv;
    print('Đã gán giáo viên "${gv.name}" phụ trách lớp "$name"!');
  }

  // Hiển thị thông tin đầy đủ của lớp học
  void hienThiThongTinLop() {
    print('===== THÔNG TIN LỚP: $name (ID: $id) =====');

    print('--- Giáo viên phụ trách ---');
    if (teacher == null) {
      print('Chưa có giáo viên phụ trách.');
    } else {
      teacher!.hienThiThongTin();
    }

    print('--- Danh sách học sinh (${students.length} học sinh) ---');
    if (students.isEmpty) {
      print('Lớp chưa có học sinh nào.');
    } else {
      for (int i = 0; i < students.length; i++) {
        print('${i + 1}.');
        students[i].hienThiThongTin();
      }
    }
    print('');
  }
}

// ----------------------------------------------------------------
// DỮ LIỆU TOÀN CỤC CỦA HỆ THỐNG
// ----------------------------------------------------------------
List<Student> danhSachHocSinh = [];
List<Teacher> danhSachGiaoVien = [];
List<Classroom> danhSachLopHoc = [];

// ----------------------------------------------------------------
// CHƯƠNG TRÌNH CHÍNH
// ----------------------------------------------------------------
void main() {
  int luaChon = -1;

  while (luaChon != 0) {
    hienThiMenu();
    stdout.write('Nhập lựa chọn của bạn: ');
    luaChon = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    switch (luaChon) {
      case 1:
        themHocSinh();
        break;
      case 2:
        themGiaoVien();
        break;
      case 3:
        taoLopHoc();
        break;
      case 4:
        themHocSinhVaoLop();
        break;
      case 5:
        ganGiaoVienChoLop();
        break;
      case 6:
        baoCaoLopHoc();
        break;
      case 7:
        xemDiemTrungBinhHocSinh();
        break;
      case 0:
        print('Đã thoát chương trình. Tạm biệt!');
        break;
      default:
        print('Lựa chọn không hợp lệ, vui lòng chọn lại!\n');
    }
  }
}

void hienThiMenu() {
  print('===== HỆ THỐNG QUẢN LÝ TRƯỜNG HỌC =====');
  print('1. Thêm học sinh');
  print('2. Thêm giáo viên');
  print('3. Tạo lớp học mới');
  print('4. Thêm học sinh vào lớp');
  print('5. Gán giáo viên phụ trách lớp');
  print('6. Hiển thị báo cáo danh sách lớp và điểm số');
  print('7. Xem điểm trung bình của 1 học sinh');
  print('0. Thoát chương trình');
}

// ----- CHỨC NĂNG 1: THÊM HỌC SINH -----
void themHocSinh() {
  stdout.write('Nhập ID học sinh: ');
  String id = stdin.readLineSync() ?? '';

  stdout.write('Nhập họ tên: ');
  String name = stdin.readLineSync() ?? '';

  stdout.write('Nhập tuổi: ');
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  stdout.write('Nhập giới tính: ');
  String gender = stdin.readLineSync() ?? '';

  stdout.write('Nhập lớp học (ví dụ: 10A1): ');
  String grade = stdin.readLineSync() ?? '';

  Student sv = Student(
    id: id,
    name: name,
    age: age,
    gender: gender,
    grade: grade,
  );

  // Nhập điểm các môn cho học sinh
  stdout.write('Nhập số môn học cần nhập điểm: ');
  int soMon = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  for (int i = 1; i <= soMon; i++) {
    stdout.write('Nhập điểm môn thứ $i: ');
    double diem = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
    sv.themDiem(diem);
  }

  danhSachHocSinh.add(sv);
  print('Đã thêm học sinh "$name" vào hệ thống!\n');
}

// ----- CHỨC NĂNG 2: THÊM GIÁO VIÊN -----
void themGiaoVien() {
  stdout.write('Nhập ID giáo viên: ');
  String id = stdin.readLineSync() ?? '';

  stdout.write('Nhập họ tên: ');
  String name = stdin.readLineSync() ?? '';

  stdout.write('Nhập tuổi: ');
  int age = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  stdout.write('Nhập giới tính: ');
  String gender = stdin.readLineSync() ?? '';

  stdout.write('Nhập môn giảng dạy: ');
  String subject = stdin.readLineSync() ?? '';

  stdout.write('Nhập lương: ');
  double salary = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  Teacher gv = Teacher(
    id: id,
    name: name,
    age: age,
    gender: gender,
    subject: subject,
    salary: salary,
  );

  danhSachGiaoVien.add(gv);
  print('Đã thêm giáo viên "$name" vào hệ thống!\n');
}

// ----- CHỨC NĂNG 3: TẠO LỚP HỌC MỚI -----
void taoLopHoc() {
  stdout.write('Nhập ID lớp học: ');
  String id = stdin.readLineSync() ?? '';

  stdout.write('Nhập tên lớp (ví dụ: 10A1): ');
  String name = stdin.readLineSync() ?? '';

  Classroom lop = Classroom(id: id, name: name);
  danhSachLopHoc.add(lop);
  print('Đã tạo lớp học "$name" thành công!\n');
}

// ----- CHỨC NĂNG 4: THÊM HỌC SINH VÀO LỚP -----
void themHocSinhVaoLop() {
  if (danhSachLopHoc.isEmpty) {
    print('Chưa có lớp học nào! Vui lòng tạo lớp trước.\n');
    return;
  }
  if (danhSachHocSinh.isEmpty) {
    print(
      'Chưa có học sinh nào trong hệ thống! Vui lòng thêm học sinh trước.\n',
    );
    return;
  }

  Classroom? lop = chonLopHoc();
  if (lop == null) return;

  Student? sv = chonHocSinh();
  if (sv == null) return;

  lop.themHocSinh(sv);
  print('');
}

// ----- CHỨC NĂNG 5: GÁN GIÁO VIÊN CHO LỚP -----
void ganGiaoVienChoLop() {
  if (danhSachLopHoc.isEmpty) {
    print('Chưa có lớp học nào! Vui lòng tạo lớp trước.\n');
    return;
  }
  if (danhSachGiaoVien.isEmpty) {
    print(
      'Chưa có giáo viên nào trong hệ thống! Vui lòng thêm giáo viên trước.\n',
    );
    return;
  }

  Classroom? lop = chonLopHoc();
  if (lop == null) return;

  print('----- DANH SÁCH GIÁO VIÊN -----');
  for (int i = 0; i < danhSachGiaoVien.length; i++) {
    print(
      '${i + 1}. ${danhSachGiaoVien[i].name} - ${danhSachGiaoVien[i].subject}',
    );
  }
  stdout.write('Chọn số thứ tự giáo viên: ');
  int stt = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (stt < 1 || stt > danhSachGiaoVien.length) {
    print('Số thứ tự không hợp lệ!\n');
    return;
  }

  lop.ganGiaoVien(danhSachGiaoVien[stt - 1]);
  print('');
}

// ----- CHỨC NĂNG 6: BÁO CÁO DANH SÁCH LỚP VÀ ĐIỂM SỐ -----
void baoCaoLopHoc() {
  if (danhSachLopHoc.isEmpty) {
    print('Chưa có lớp học nào!\n');
    return;
  }

  for (Classroom lop in danhSachLopHoc) {
    lop.hienThiThongTinLop();
  }
}

// ----- CHỨC NĂNG 7: XEM ĐIỂM TRUNG BÌNH CỦA 1 HỌC SINH -----
void xemDiemTrungBinhHocSinh() {
  if (danhSachHocSinh.isEmpty) {
    print('Chưa có học sinh nào trong hệ thống!\n');
    return;
  }

  Student? sv = chonHocSinh();
  if (sv == null) return;

  print(
    'Học sinh "${sv.name}" có điểm trung bình: '
    '${sv.tinhDiemTrungBinh().toStringAsFixed(2)}\n',
  );
}

// ----------------------------------------------------------------
// HÀM PHỤ: chọn lớp học từ danh sách
// ----------------------------------------------------------------
Classroom? chonLopHoc() {
  print('----- DANH SÁCH LỚP HỌC -----');
  for (int i = 0; i < danhSachLopHoc.length; i++) {
    print('${i + 1}. ${danhSachLopHoc[i].name}');
  }
  stdout.write('Chọn số thứ tự lớp học: ');
  int stt = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (stt < 1 || stt > danhSachLopHoc.length) {
    print('Số thứ tự không hợp lệ!\n');
    return null;
  }
  return danhSachLopHoc[stt - 1];
}

// ----------------------------------------------------------------
// HÀM PHỤ: chọn học sinh từ danh sách
// ----------------------------------------------------------------
Student? chonHocSinh() {
  print('----- DANH SÁCH HỌC SINH -----');
  for (int i = 0; i < danhSachHocSinh.length; i++) {
    print(
      '${i + 1}. ${danhSachHocSinh[i].name} - Lớp: ${danhSachHocSinh[i].grade}',
    );
  }
  stdout.write('Chọn số thứ tự học sinh: ');
  int stt = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (stt < 1 || stt > danhSachHocSinh.length) {
    print('Số thứ tự không hợp lệ!\n');
    return null;
  }
  return danhSachHocSinh[stt - 1];
}
