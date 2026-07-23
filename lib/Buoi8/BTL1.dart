import 'dart:io';

// ============================================
// CHƯƠNG TRÌNH QUẢN LÝ HÓA ĐƠN BÁN HÀNG
// (Sử dụng hàm + List<Map> để lưu dữ liệu)
// ============================================

// Danh sách giỏ hàng: mỗi sản phẩm là 1 Map gồm:
// {'ten': String, 'soLuong': int, 'gia': double}
List<Map<String, dynamic>> gioHang = [];

void main() {
  int luaChon = -1;

  while (luaChon != 0) {
    hienThiMenu();
    stdout.write('Nhập lựa chọn của bạn: ');
    luaChon = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    switch (luaChon) {
      case 1:
        themSanPham();
        break;
      case 2:
        suaSanPham();
        break;
      case 3:
        xoaSanPham();
        break;
      case 4:
        hienThiGioHang();
        break;
      case 5:
        tinhTongTien();
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
  print('===== QUẢN LÝ HÓA ĐƠN BÁN HÀNG =====');
  print('1. Thêm sản phẩm vào giỏ hàng');
  print('2. Sửa sản phẩm trong giỏ hàng');
  print('3. Xóa sản phẩm trong giỏ hàng');
  print('4. Hiển thị giỏ hàng');
  print('5. Tính tổng tiền hóa đơn');
  print('0. Thoát chương trình');
}

// ----- CHỨC NĂNG 1: THÊM SẢN PHẨM VÀO GIỎ HÀNG -----
void themSanPham() {
  stdout.write('Nhập tên sản phẩm: ');
  String ten = stdin.readLineSync() ?? '';

  int soLuong = -1;
  while (soLuong <= 0) {
    stdout.write('Nhập số lượng: ');
    soLuong = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (soLuong <= 0) print('Số lượng không hợp lệ! Vui lòng nhập lại.');
  }

  double gia = -1;
  while (gia < 0) {
    stdout.write('Nhập giá tiền: ');
    gia = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (gia < 0) print('Giá tiền không hợp lệ! Vui lòng nhập lại.');
  }

  // Tạo 1 Map đại diện cho sản phẩm và thêm vào danh sách giỏ hàng
  Map<String, dynamic> sanPham = {'ten': ten, 'soLuong': soLuong, 'gia': gia};
  gioHang.add(sanPham);

  print('Đã thêm sản phẩm "$ten" vào giỏ hàng!\n');
}

// ----- CHỨC NĂNG 2: SỬA SẢN PHẨM TRONG GIỎ HÀNG -----
void suaSanPham() {
  if (gioHang.isEmpty) {
    print('Giỏ hàng đang trống!\n');
    return;
  }

  hienThiGioHang();

  stdout.write('Nhập số thứ tự sản phẩm cần sửa: ');
  int stt = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (stt < 1 || stt > gioHang.length) {
    print('Số thứ tự không hợp lệ!\n');
    return;
  }

  Map<String, dynamic> spCanSua = gioHang[stt - 1];
  print('Đang sửa sản phẩm: ${spCanSua['ten']}');

  stdout.write('Nhập tên mới (Enter để giữ nguyên "${spCanSua['ten']}"): ');
  String tenMoi = stdin.readLineSync() ?? '';
  if (tenMoi.trim().isNotEmpty) {
    spCanSua['ten'] = tenMoi;
  }

  stdout.write(
    'Nhập số lượng mới (Enter để giữ nguyên ${spCanSua['soLuong']}): ',
  );
  String slInput = stdin.readLineSync() ?? '';
  if (slInput.trim().isNotEmpty) {
    int? slMoi = int.tryParse(slInput);
    if (slMoi != null && slMoi > 0) {
      spCanSua['soLuong'] = slMoi;
    } else {
      print('Số lượng không hợp lệ, giữ nguyên giá trị cũ.');
    }
  }

  stdout.write('Nhập giá mới (Enter để giữ nguyên ${spCanSua['gia']}): ');
  String giaInput = stdin.readLineSync() ?? '';
  if (giaInput.trim().isNotEmpty) {
    double? giaMoi = double.tryParse(giaInput);
    if (giaMoi != null && giaMoi >= 0) {
      spCanSua['gia'] = giaMoi;
    } else {
      print('Giá tiền không hợp lệ, giữ nguyên giá trị cũ.');
    }
  }

  print('Đã cập nhật sản phẩm thành công!\n');
}

// ----- CHỨC NĂNG 3: XÓA SẢN PHẨM TRONG GIỎ HÀNG -----
void xoaSanPham() {
  if (gioHang.isEmpty) {
    print('Giỏ hàng đang trống!\n');
    return;
  }

  hienThiGioHang();

  stdout.write('Nhập số thứ tự sản phẩm cần xóa: ');
  int stt = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (stt < 1 || stt > gioHang.length) {
    print('Số thứ tự không hợp lệ!\n');
    return;
  }

  String tenDaXoa = gioHang[stt - 1]['ten'];
  gioHang.removeAt(stt - 1);

  print('Đã xóa sản phẩm "$tenDaXoa" khỏi giỏ hàng!\n');
}

// ----- CHỨC NĂNG 4: HIỂN THỊ GIỎ HÀNG -----
void hienThiGioHang() {
  if (gioHang.isEmpty) {
    print('Giỏ hàng đang trống!\n');
    return;
  }

  print('----- GIỎ HÀNG -----');
  for (int i = 0; i < gioHang.length; i++) {
    Map<String, dynamic> sp = gioHang[i];
    double thanhTien = sp['soLuong'] * sp['gia'];
    print(
      '${i + 1}. Tên: ${sp['ten']} | Số lượng: ${sp['soLuong']} | '
      'Giá: ${(sp['gia'] as double).toStringAsFixed(0)} đ | '
      'Thành tiền: ${thanhTien.toStringAsFixed(0)} đ',
    );
  }
  print('');
}

// ----- CHỨC NĂNG 5: TÍNH TỔNG TIỀN HÓA ĐƠN -----
void tinhTongTien() {
  if (gioHang.isEmpty) {
    print('Giỏ hàng đang trống, tổng tiền là 0 đ!\n');
    return;
  }

  double tongTien = 0;
  for (Map<String, dynamic> sp in gioHang) {
    tongTien += sp['soLuong'] * sp['gia'];
  }

  print('Tổng tiền hóa đơn: ${tongTien.toStringAsFixed(0)} đ\n');
}
