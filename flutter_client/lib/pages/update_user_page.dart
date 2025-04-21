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
  late TextEditingController _titleController;
  late TextEditingController _emailController;
  late TextEditingController _ageController;
  late TextEditingController _mobileNoController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.name);
    _titleController = TextEditingController(text: widget.user.title);
    _emailController = TextEditingController(text: widget.user.email);
    _ageController = TextEditingController(text: widget.user.age.toString());
    _mobileNoController = TextEditingController(text: widget.user.mobileNo);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _titleController.dispose();
    _emailController.dispose();
    _ageController.dispose();
    _mobileNoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios, size: 35),
        ),
        title: Text(
          "Update a User",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
        ),
        centerTitle: true,
      ),
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
                  controller: _titleController,
                  decoration: InputDecoration(hintText: "Your Job Title"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Job Title";
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
                    } else if (!RegExp(
                      r'^[^@]+@[^@]+\.[^@]+',
                    ).hasMatch(value)) {
                      return "Please Enter a Valid Email";
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
                TextFormField(
                  controller: _mobileNoController,
                  decoration: InputDecoration(hintText: "Your Mobile Number"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Your Mobile Number";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final updatedUser = UserModel(
                          id: widget.user.id,
                          name: _nameController.text,
                          title: _titleController.text,
                          email: _emailController.text,
                          age: int.parse(_ageController.text),
                          mobileNo: _mobileNoController.text,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
