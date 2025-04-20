import 'package:flutter/material.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:flutter_client/services/user_services.dart';

class UserProvider with ChangeNotifier {
  final UserServices _userServices = UserServices();
  List<UserModel> _users = [];

  //Getter
  List<UserModel> get users => _users;

  //Fetch Users When the Provider is Initialized
  UserProvider() {
    fetchAllUsers();
  }

  //Fetch All Users
  Future<void> fetchAllUsers() async {
    try {
      _users = await _userServices.getAllUsers();
      notifyListeners();
    } catch (error) {
      debugPrint("Failed to Fetch Users: $error");
    }
  }

  //Create User
  Future<void> addUser(UserModel user) async {
    try {
      await _userServices.createUser(user);
      _users.add(user);
      notifyListeners();
    } catch (error) {
      debugPrint("Failed to Create User: $error");
    }
  }

  //Delete a User
  Future<void> deleteUser(String userId) async {
    try {
      await _userServices.deleteUser(userId);
      _users.removeWhere((user) => user.id == userId);
      notifyListeners();
    } catch (error) {
      debugPrint("Failed to Delete User: $error");
    }
  }
}
