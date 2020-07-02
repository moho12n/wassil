import 'dart:convert';

class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String phone;
  String role;
  String password;
  String rememberToken;
  BigInt townId;
  User(
      {this.id,
      this.firstName,
      this.password,
      this.lastName,
      this.email,
      this.phone,
      this.role,
      this.password,
      this.rememberToken,
      this.townId});

  User userFromJson(String str) {
    final jsonData = json.decode(str);
    return User.fromJson(jsonData);
  }
/*
  String userToJson(User data) {
    final dyn = data.toJson();
//********final */
    return json.encode(dyn);
  }*/

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      phone: json["phone"],
      role: json["role"],
      password: json["password"],
      rememberToken: json["remember_token"],
      townId: json['town_id']);
/*
  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "password": password,
        "name": name,
        "age": age,
        "adress": adress,
        "gender": gender,
        "profilePic": profilePic,
      };*/
  @override
  String toString() {
    // TODO: implement toString
    return '{id: "$id", firstName:"$firstName", lastName:"$lastName", email : "$email", phone : "$phone", role: "$role", password: "$password", rememberToken: "$rememberToken","townId" : "$townId"}';
  }
}
