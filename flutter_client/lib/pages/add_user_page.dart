import 'package:flutter/material.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:flutter_client/provider/user_provider.dart';
import 'package:provider/provider.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _titleController = TextEditingController();
  final _emailController = TextEditingController();
  final _ageController = TextEditingController();
  final _mobileNoController = TextEditingController();

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
          "Add a User",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Your Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter a Name";
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
                      return "Please Enter a Job Title";
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        final newUser = UserModel(
                          id: "",
                          name: _nameController.text,
                          title: _titleController.text,
                          email: _emailController.text,
                          age: int.parse(_ageController.text),
                          mobileNo: _mobileNoController.text,
                        );
                        try {
                          await Provider.of<UserProvider>(
                            context,
                            listen: false,
                          ).addUser(newUser);
                          if (context.mounted) {
                            Navigator.pop(context);
                          }
                        } catch (error) {
                          debugPrint("Error When User Save: $error");
                        }
                      }
                    },
                    child: Text("Add a User"),
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
