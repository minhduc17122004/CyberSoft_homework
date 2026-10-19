class User {
  final int id;
  final String name;
  final int age;
  final String email;
  User({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
  });
  // chuyển đổi từ sql sang đối tượng User
  factory User.fromSql(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      age: map['age'],
      email: map['email'],
    );
  }
  // chuyển đổi từ đối tượng User sang sql
  Map<String, dynamic> toSql() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
    };
  }
}