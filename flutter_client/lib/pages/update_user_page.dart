import 'package:flutter/material.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:flutter_client/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UpdateUserPage extends StatefulWidget {
  final UserModel user;
  const UpdateUserPage({super.key, required this.user});

  @override
  State<UpdateUserPage> createState() => _UpdateUserPageState();
}

class _UpdateUserPageState extends State<UpdateUserPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _emailController = TextEditingController(text: widget.user.email);
    _ageController = TextEditingController(text: widget.user.age.toString());
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _ageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Update User")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Your Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your Name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "Your Email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  controller: _ageController,
                  decoration: InputDecoration(hintText: "Your Age"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Age";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final updatedUser = UserModel(
                        id: widget.user.id,
                        name: _nameController.text,
                        email: _emailController.text,
                        age: int.parse(_ageController.text),
                      );
                      Provider.of<UserProvider>(
                        context,
                        listen: false,
                      ).updateUser(updatedUser);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("User Updated Successfully!")),
                      );
                      _nameController.clear();
                      _emailController.clear();
                      _ageController.clear();

                      Navigator.of(context).pop();
                    }
                  },
                  child: Text("Update User"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
