import 'dart:io';

class BankAccount {
  String accountNumber = "";
  String ownerName = "";
  double balance = 0;

  // Gửi tiền
  void deposit(double amount) {
    balance += amount;
    print("Đã gửi: $amount");
  }

  // Rút tiền
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print("Đã rút: $amount");
    } else {
      print("Số dư không đủ!");
    }
  }

  // Hiển thị số dư
  void showBalance() {
    print("Số dư hiện tại: $balance");
  }
}

void main() {
  BankAccount account = BankAccount();

  print("Nhập số tài khoản:");
  account.accountNumber = stdin.readLineSync()!;

  print("Nhập tên chủ tài khoản:");
  account.ownerName = stdin.readLineSync()!;

  print("Nhập số dư ban đầu:");
  account.balance = double.parse(stdin.readLineSync()!);

  account.showBalance();

  print("\nNhập số tiền muốn gửi:");
  double depositMoney = double.parse(stdin.readLineSync()!);
  account.deposit(depositMoney);
  account.showBalance();

  print("\nNhập số tiền muốn rút:");
  double withdrawMoney = double.parse(stdin.readLineSync()!);
  account.withdraw(withdrawMoney);
  account.showBalance();
}
