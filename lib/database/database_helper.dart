import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    // kiểm tra xem cơ sở dữ liệu đã được khởi tạo chưa
    if (_database != null) return _database!;

    // nếu chưa, khởi tạo cơ sở dữ liệu
    // lấy đường dẫn đến database trên thiết bị
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, 'my_db.db');
    // mở cơ sở dữ liệu  từ nơi lưu lên
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {},
    );
    return _database!;
  }
}
