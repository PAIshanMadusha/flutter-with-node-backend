import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:http/http.dart' as http;

//BaseUrl
const String baseApiUrl = "http://192.168.8.150:5000/api/users";

class UserServices {
  //Create a User
  Future<UserModel> createUser(UserModel user) async {
    try {
      final response = await http.post(
        Uri.parse(baseApiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(user.toJson()),
      );
      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint("User Created!");
        return UserModel.fromJson(jsonDecode(response.body));
      } else {
        debugPrint("Failed to Create User: ${response.statusCode}");
        throw Exception("Failed to Create User");
      }
    } catch (error) {
      debugPrint("Error When Creating User: $error");
      rethrow;
    }
  }

  //Get All Users
  Future<List<UserModel>> getAllUsers() async {
    try {
      final response = await http.get(Uri.parse(baseApiUrl));
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        debugPrint("Failed to Fetch Users: ${response.statusCode}");
        throw Exception("Failed to Load Users");
      }
    } catch (error) {
      debugPrint("Error Fetching Users: $error");
      rethrow;
    }
  }

  //Update a User
  Future<void> updateUser(UserModel user) async {
    try {
      final respose = await http.put(
        Uri.parse("$baseApiUrl/update/${user.id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(user.toJson()),
      );
      if (respose.statusCode != 200) {
        debugPrint("Failed to Update User: ${respose.statusCode}");
        throw Exception("Failed to Update User");
      }
    } catch (error) {
      debugPrint("Error With Updating User: $error");
      rethrow;
    }
  }

  //Delete a User
  Future<void> deleteUser(String userId) async {
    try {
      final response = await http.delete(
        Uri.parse("$baseApiUrl/delete/$userId"),
      );
      if (response.statusCode != 200) {
        debugPrint("Failed to Delete User: ${response.statusCode}");
        throw Exception("Failed to Delete User");
      }
    } catch (error) {
      debugPrint("Error When Deleting User: $error");
      rethrow;
    }
  }
}
