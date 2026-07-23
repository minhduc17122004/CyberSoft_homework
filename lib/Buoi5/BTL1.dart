import 'dart:io';

// ============================================
// CHƯƠNG TRÌNH TÍNH LƯƠNG NHÂN VIÊN
// ============================================

void main() {
  // ----- NHẬP THÔNG TIN -----
  stdout.write('Nhập họ tên nhân viên: ');
  String hoTen = stdin.readLineSync() ?? '';

  stdout.write('Nhập số giờ làm việc: ');
  double soGioLam = double.parse(stdin.readLineSync()!);

  stdout.write('Nhập lương mỗi giờ: ');
  double luongMoiGio = double.parse(stdin.readLineSync()!);

  // ----- 1. TÍNH TỔNG LƯƠNG -----
  double tongLuong = soGioLam * luongMoiGio;

  // ----- 2. THÊM PHỤ CẤP NẾU LÀM HƠN 40 GIỜ -----
  if (soGioLam > 40) {
    double phuCap = tongLuong * 0.20;
    tongLuong += phuCap;
  }

  // tongLuong lúc này là "tổng lương trước thuế"
  double luongTruocThue = tongLuong;

  // ----- 3. TRỪ THUẾ THU NHẬP -----
  double thueThuNhap = 0;
  if (luongTruocThue > 10000000) {
    thueThuNhap = luongTruocThue * 0.10;
  } else if (luongTruocThue >= 7000000) {
    thueThuNhap = luongTruocThue * 0.05;
  } else {
    thueThuNhap = 0;
  }

  double luongThucLanh = luongTruocThue - thueThuNhap;

  // ----- 4. IN KẾT QUẢ -----
  print('\n----- BẢNG LƯƠNG NHÂN VIÊN -----');
  print('Họ tên: $hoTen');
  print('Tổng lương trước thuế: ${luongTruocThue.toStringAsFixed(0)} đ');
  print('Thuế thu nhập: ${thueThuNhap.toStringAsFixed(0)} đ');
  print('Lương thực lãnh: ${luongThucLanh.toStringAsFixed(0)} đ');
}
