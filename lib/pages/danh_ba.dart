import 'package:flutter/material.dart';
import 'package:flutter_app/database/DAO/users_dao.dart';

class BaiTapDanhBa extends StatefulWidget {
  const BaiTapDanhBa({super.key});

  @override
  State<BaiTapDanhBa> createState() => _BaiTapDanhBaState();
}

class _BaiTapDanhBaState extends State<BaiTapDanhBa> {
  var listUser = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  void loadData() async {
    var listUserDB = await selectDataUser();
    setState(() {
      listUser = listUserDB;
    });
  }

  void showUserModal(BuildContext context, {Map<String, dynamic>? user}) {
    final isEditing = user != null;
    final nameController = TextEditingController(text: user?['name'] ?? '');
    final emailController = TextEditingController(text: user?['email'] ?? '');
    final ageController = TextEditingController(
      text: user != null ? user['age'].toString() : '',
    );

    showModalBottomSheet<void>(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 500,
          child: ScaffoldMessenger(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: Builder(
                builder: (sheetContext) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Họ tên",
                            border: OutlineInputBorder(),
                          ),
                          controller: nameController,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                          controller: emailController,
                        ),
                        SizedBox(height: 16),
                        TextField(
                          decoration: InputDecoration(
                            labelText: "Tuổi",
                            border: OutlineInputBorder(),
                          ),
                          controller: ageController,
                        ),
                        ElevatedButton(
                          child: const Text('Lưu'),
                          onPressed: () async {
                            final name = nameController.text.trim();
                            final email = emailController.text.trim();
                            final age =
                                int.tryParse(ageController.text.trim()) ?? 0;
                            if (name.isEmpty || email.isEmpty || age <= 0) {
                              ScaffoldMessenger.of(sheetContext).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Vui lòng nhập đầy đủ thông tin hợp lệ.',
                                  ),
                                  backgroundColor: Colors.red,
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              return;
                            }
                            var newUser = {
                              "name": name,
                              "email": email,
                              "age": age,
                            };
                            if (user == null) {
                              await insertDataUser(newUser);
                            } else {
                              await updateDataUser(user['id'], newUser);
                            }
                            loadData();
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh bạ'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              showUserModal(context);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: listUser.length,
        itemBuilder: (context, index) {
          final item = listUser[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.network(
                'https://ui-avatars.com/api/?name=${Uri.encodeComponent(item['name']!)}&background=random&bold=true',
                width: 48,
                height: 48,
                errorBuilder: (context, error, stackTrace) =>
                    CircleAvatar(radius: 24, child: Text(item['name']![0])),
              ),
            ),
            title: Text(item['name']!),
            subtitle: Text('${item['email']} | ${item['age']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    showUserModal(context, user: item);
                  },
                  icon: Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    deleteDataUser(item['id']);
                    loadData();
                  },
                  icon: Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
