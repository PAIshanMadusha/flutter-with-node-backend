class UserModel {
  final String id;
  final String name;
  final String title;
  final String email;
  final int age;
  final String mobileNo;

  UserModel({
    required this.id,
    required this.name,
    required this.title,
    required this.email,
    required this.age,
    required this.mobileNo,
  });

  //Convert Dart Object to Json Data
  Map<String, dynamic> toJson() {
    return {"name": name, "title": title, "email": email, "age": age, "mobileNo": mobileNo};
  }

  //Convert Json Data to Dart Object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["_id"],
      name: json["name"],
      title: json["title"],
      email: json["email"],
      age: json["age"],
      mobileNo: json["mobileNo"],
    );
  }
}
