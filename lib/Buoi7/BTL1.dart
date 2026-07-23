import 'dart:io';

// ============================================
// CHƯƠNG TRÌNH QUẢN LÝ DANH SÁCH SINH VIÊN
// ============================================

// Lớp SinhVien đại diện cho 1 sinh viên
class SinhVien {
  String hoTen;
  double diemToan;
  double diemLy;
  double diemHoa;

  SinhVien(this.hoTen, this.diemToan, this.diemLy, this.diemHoa);

  // Tính điểm trung bình
  double get diemTrungBinh => (diemToan + diemLy + diemHoa) / 3;

  // Xếp loại học lực dựa trên ĐTB
  String get xepLoai {
    double dtb = diemTrungBinh;
    if (dtb < 5) {
      return 'Kém';
    } else if (dtb < 7) {
      return 'Khá';
    } else if (dtb < 9) {
      return 'Giỏi';
    } else {
      return 'Xuất sắc';
    }
  }

  @override
  String toString() {
    return 'Họ tên: $hoTen | Toán: $diemToan | Lý: $diemLy | Hóa: $diemHoa | '
        'ĐTB: ${diemTrungBinh.toStringAsFixed(2)} | Xếp loại: $xepLoai';
  }
}

// Danh sách sinh viên toàn cục
List<SinhVien> danhSachSinhVien = [];

void main() {
  int luaChon = -1;

  while (luaChon != 0) {
    hienThiMenu();
    stdout.write('Nhập lựa chọn của bạn: ');
    luaChon = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    switch (luaChon) {
      case 1:
        themSinhVien();
        break;
      case 2:
        hienThiDanhSach();
        break;
      case 3:
        timSinhVienDiemCaoNhat();
        break;
      case 0:
        print('Đã thoát chương trình. Tạm biệt!');
        break;
      default:
        print('Lựa chọn không hợp lệ, vui lòng chọn lại!\n');
    }
  }
}

// Hiển thị menu chức năng
void hienThiMenu() {
  print('===== QUẢN LÝ DANH SÁCH SINH VIÊN =====');
  print('1. Thêm sinh viên');
  print('2. Hiển thị danh sách sinh viên (kèm ĐTB và xếp loại)');
  print('3. Tìm sinh viên có ĐTB cao nhất');
  print('0. Thoát chương trình');
}

// Chức năng 1: Thêm sinh viên vào danh sách
void themSinhVien() {
  stdout.write('Nhập họ tên sinh viên: ');
  String hoTen = stdin.readLineSync() ?? '';

  double diemToan = nhapDiem('Nhập điểm Toán: ');
  double diemLy = nhapDiem('Nhập điểm Lý: ');
  double diemHoa = nhapDiem('Nhập điểm Hóa: ');

  SinhVien sv = SinhVien(hoTen, diemToan, diemLy, diemHoa);
  danhSachSinhVien.add(sv);

  print('Đã thêm sinh viên "$hoTen" vào danh sách!\n');
}

// Hàm phụ: nhập điểm và kiểm tra hợp lệ (0 - 10)
double nhapDiem(String thongBao) {
  double diem = -1;
  while (diem < 0 || diem > 10) {
    stdout.write(thongBao);
    diem = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (diem < 0 || diem > 10) {
      print('Điểm không hợp lệ! Vui lòng nhập từ 0 đến 10.');
    }
  }
  return diem;
}

// Chức năng 2: Hiển thị danh sách sinh viên
void hienThiDanhSach() {
  if (danhSachSinhVien.isEmpty) {
    print('Danh sách sinh viên đang trống!\n');
    return;
  }

  print('----- DANH SÁCH SINH VIÊN -----');
  for (int i = 0; i < danhSachSinhVien.length; i++) {
    print('${i + 1}. ${danhSachSinhVien[i]}');
  }
  print('');
}

// Chức năng 3: Tìm sinh viên có ĐTB cao nhất
void timSinhVienDiemCaoNhat() {
  if (danhSachSinhVien.isEmpty) {
    print('Danh sách sinh viên đang trống!\n');
    return;
  }

  SinhVien svCaoNhat = danhSachSinhVien[0];
  for (SinhVien sv in danhSachSinhVien) {
    if (sv.diemTrungBinh > svCaoNhat.diemTrungBinh) {
      svCaoNhat = sv;
    }
  }

  print('Sinh viên có ĐTB cao nhất là:');
  print(svCaoNhat);
  print('');
}
