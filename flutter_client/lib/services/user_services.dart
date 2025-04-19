import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_client/models/user_model.dart';
import 'package:http/http.dart' as http;

//BaseUrl
const String baseApiUrl = "http://127.0.0.1:5000/api/users";

class UserServices {
  //Create a User
  Future<void> createUser(UserModel user) async {
    try {

      final response = await http.post(
        Uri.parse(baseApiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(user.toJson()),
      );
      if(response.statusCode != 201){
        debugPrint("Failed to Create User: ${response.statusCode}");
        throw Exception("Failed to Create User");
      }else{
        debugPrint("User Created!");
      }
    } catch (error) {
      debugPrint("Error When Creating User: $error");
      rethrow;
    }
  }
}
