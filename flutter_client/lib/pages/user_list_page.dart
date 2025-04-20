import 'package:flutter/material.dart';
import 'package:flutter_client/pages/add_user_page.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users List"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => AddUserPage()));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
