import 'dart:convert';

void main() {
  // var data = {
  // 'name': 'John Doe',
  // 'age': 30,
  // 'email': 'john.doe@example.com',
  // 'isStudent': false,
  // 'grades': [85, 90, 78],
  // };
  // final String jsonString = jsonEncode(data);
  // print('JSON String: $jsonString');
  try {
    var result = errorTest();
    print(result);
  } catch (e) {
    print('Something went wrong:$e');
  } finally {
    // dismiss loading
    print('This block is always executed.');
  }
}

String errorTest() {
  throw Exception();
}
