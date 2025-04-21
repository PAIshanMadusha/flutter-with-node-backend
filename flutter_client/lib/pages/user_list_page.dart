import 'package:flutter/material.dart';
import 'package:flutter_client/pages/add_user_page.dart';
import 'package:flutter_client/pages/update_user_page.dart';
import 'package:flutter_client/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Users List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => AddUserPage()));
              },
              icon: Icon(Icons.add, size: 40),
            ),
          ),
        ],
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.users.isEmpty) {
            return Center(child: Text("No Users Found!"));
          }
          return ListView.builder(
            itemCount: userProvider.users.length,
            itemBuilder: (context, index) {
              final user = userProvider.users[index];
              return ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => UpdateUserPage(user: user),
                    ),
                  );
                },
                leading: Icon(Icons.person, size: 30),
                title: Text(
                  user.name,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      "Title: ${user.title}",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 5),
                    Text("Email: ${user.email}", style: TextStyle(color: Colors.black, fontSize: 18),),
                    SizedBox(height: 5),
                    Text(
                      "Mobile No: ${user.mobileNo}",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                trailing: IconButton(
                  onPressed: () {
                    userProvider.deleteUser(user.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("User Deleted Successfully!")),
                    );
                  },
                  icon: Icon(Icons.delete, size: 30, color: Colors.redAccent),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
