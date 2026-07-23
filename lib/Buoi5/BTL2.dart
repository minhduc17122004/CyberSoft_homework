import 'dart:io';

// ============================================
// CHƯƠNG TRÌNH TÍNH HÓA ĐƠN BÁN HÀNG
// ============================================

void main() {
  // ----- NHẬP THÔNG TIN -----
  stdout.write('Nhập tên sản phẩm: ');
  String tenSanPham = stdin.readLineSync() ?? '';

  stdout.write('Nhập số lượng mua: ');
  int soLuong = int.parse(stdin.readLineSync()!);

  stdout.write('Nhập đơn giá: ');
  double donGia = double.parse(stdin.readLineSync()!);

  // ----- 1. TÍNH THÀNH TIỀN -----
  double thanhTien = soLuong * donGia;

  // ----- 2. ÁP DỤNG GIẢM GIÁ -----
  double tyLeGiamGia;
  if (thanhTien >= 1000000) {
    tyLeGiamGia = 0.10;
  } else if (thanhTien >= 500000) {
    tyLeGiamGia = 0.05;
  } else {
    tyLeGiamGia = 0;
  }
  double soTienGiamGia = thanhTien * tyLeGiamGia;
  double sauGiamGia = thanhTien - soTienGiamGia;

  // ----- 3. TÍNH THUẾ VAT 8% TRÊN SỐ TIỀN SAU GIẢM GIÁ -----
  double thueVAT = sauGiamGia * 0.08;

  // ----- TỔNG THANH TOÁN CUỐI CÙNG -----
  double tongThanhToan = sauGiamGia + thueVAT;

  // ----- 4. IN HÓA ĐƠN -----
  print('\n========== HÓA ĐƠN BÁN HÀNG ==========');
  print('Tên sản phẩm: $tenSanPham');
  print('Số lượng: $soLuong');
  print('Đơn giá: ${donGia.toStringAsFixed(0)} đ');
  print('---------------------------------------');
  print('Thành tiền: ${thanhTien.toStringAsFixed(0)} đ');
  print(
    'Giảm giá (${(tyLeGiamGia * 100).toStringAsFixed(0)}%): '
    '${soTienGiamGia.toStringAsFixed(0)} đ',
  );
  print('Thuế VAT (8%): ${thueVAT.toStringAsFixed(0)} đ');
  print('---------------------------------------');
  print('TỔNG THANH TOÁN: ${tongThanhToan.toStringAsFixed(0)} đ');
  print('========================================');
}
