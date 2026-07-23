import 'dart:io';

// ============================================
// CHƯƠNG TRÌNH QUẢN LÝ SẢN PHẨM TRONG CỬA HÀNG
// ============================================

// Lớp SanPham đại diện cho 1 sản phẩm
class SanPham {
  String tenSanPham;
  double giaTien;
  int soLuong;

  SanPham(this.tenSanPham, this.giaTien, this.soLuong);

  @override
  String toString() {
    return 'Tên: $tenSanPham | Giá: ${giaTien.toStringAsFixed(0)} đ | Số lượng tồn: $soLuong';
  }
}

// Danh sách sản phẩm toàn cục
List<SanPham> danhSachSanPham = [];

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
        hienThiDanhSach();
        break;
      case 3:
        timKiemSanPham();
        break;
      case 4:
        banSanPham();
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
  print('===== QUẢN LÝ SẢN PHẨM CỬA HÀNG =====');
  print('1. Thêm sản phẩm');
  print('2. Hiển thị danh sách sản phẩm');
  print('3. Tìm kiếm sản phẩm theo tên');
  print('4. Bán sản phẩm');
  print('0. Thoát chương trình');
}

// Chức năng 1: Thêm sản phẩm vào danh sách
void themSanPham() {
  stdout.write('Nhập tên sản phẩm: ');
  String ten = stdin.readLineSync() ?? '';

  double gia = -1;
  while (gia < 0) {
    stdout.write('Nhập giá tiền: ');
    gia = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (gia < 0) print('Giá tiền không hợp lệ! Vui lòng nhập lại.');
  }

  int soLuong = -1;
  while (soLuong < 0) {
    stdout.write('Nhập số lượng trong kho: ');
    soLuong = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (soLuong < 0) print('Số lượng không hợp lệ! Vui lòng nhập lại.');
  }

  danhSachSanPham.add(SanPham(ten, gia, soLuong));
  print('Đã thêm sản phẩm "$ten" vào danh sách!\n');
}

// Chức năng 2: Hiển thị danh sách sản phẩm
void hienThiDanhSach() {
  if (danhSachSanPham.isEmpty) {
    print('Danh sách sản phẩm đang trống!\n');
    return;
  }

  print('----- DANH SÁCH SẢN PHẨM -----');
  for (int i = 0; i < danhSachSanPham.length; i++) {
    print('${i + 1}. ${danhSachSanPham[i]}');
  }
  print('');
}

// Chức năng 3: Tìm kiếm sản phẩm theo tên
void timKiemSanPham() {
  if (danhSachSanPham.isEmpty) {
    print('Danh sách sản phẩm đang trống!\n');
    return;
  }

  stdout.write('Nhập tên sản phẩm cần tìm: ');
  String tenTim = (stdin.readLineSync() ?? '').trim().toLowerCase();

  bool timThay = false;
  print('----- KẾT QUẢ TÌM KIẾM -----');
  for (SanPham sp in danhSachSanPham) {
    if (sp.tenSanPham.toLowerCase().contains(tenTim)) {
      print(sp);
      timThay = true;
    }
  }

  if (!timThay) {
    print('Không tìm thấy sản phẩm nào có tên chứa "$tenTim"!');
  }
  print('');
}

// Chức năng 4: Bán sản phẩm
void banSanPham() {
  if (danhSachSanPham.isEmpty) {
    print('Danh sách sản phẩm đang trống!\n');
    return;
  }

  stdout.write('Nhập tên sản phẩm cần bán: ');
  String tenBan = (stdin.readLineSync() ?? '').trim().toLowerCase();

  // Tìm sản phẩm theo tên chính xác (không phân biệt hoa thường)
  SanPham? spCanBan;
  for (SanPham sp in danhSachSanPham) {
    if (sp.tenSanPham.toLowerCase() == tenBan) {
      spCanBan = sp;
      break;
    }
  }

  if (spCanBan == null) {
    print('Không tìm thấy sản phẩm "$tenBan" trong danh sách!\n');
    return;
  }

  stdout.write('Nhập số lượng cần bán: ');
  int soLuongBan = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

  if (soLuongBan <= 0) {
    print('Số lượng bán không hợp lệ!\n');
    return;
  }

  if (spCanBan.soLuong >= soLuongBan) {
    spCanBan.soLuong -= soLuongBan;
    print(
      'Bán thành công $soLuongBan "${spCanBan.tenSanPham}". '
      'Số lượng còn lại trong kho: ${spCanBan.soLuong}\n',
    );
  } else {
    print(
      'Lỗi: Số lượng tồn kho không đủ! '
      'Hiện chỉ còn ${spCanBan.soLuong} sản phẩm.\n',
    );
  }
}
