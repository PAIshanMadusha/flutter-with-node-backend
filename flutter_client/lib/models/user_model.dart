class UserModel {
  final String id;
  final String name;
  final String email;
  final int age;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.age,
  });

  //Convert Dart Object to Json Data
  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "age": age};
  }

  //Convert Json Data to Dart Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      name: json["name"],
      email: json["email"],
      age: json["age"],
    );
  }
}
