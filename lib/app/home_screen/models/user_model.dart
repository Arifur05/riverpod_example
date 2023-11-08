



import 'dart:convert';

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phoneNumber;
  String? image;
  bool isDriver;
  Gender? gender;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.image,
    this.isDriver = false,
    this.gender,
    this.token,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));
  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json[_Json.id],
    name: json[_Json.name],
    email: json[_Json.email],
    password: json[_Json.password],
    phoneNumber: json[_Json.phone],
    image: json[_Json.image],
    isDriver: json[_Json.isDriver],
    gender: json[_Json.gender],
    token: json[_Json.token],
  );

  String toRawJson() => json.encode(toJson());
  Map<String, dynamic> toJson() => {
    _Json.id: id,
    _Json.name: name,
    _Json.email: email,
    _Json.password: password,
    _Json.phone: phoneNumber,
    _Json.image: image,
    _Json.isDriver: isDriver,
    _Json.gender: gender,
    _Json.token: token,
  };

  // static User? get current {
  //   final userJson = prefs.getString('user');
  //   if (userJson != null) return User.fromRawJson(userJson);
  //   return null;
  // }
}

enum Gender { male, female }

class _Json {
  static const id = 'id';
  static const name = 'name';
  static const email = 'email';
  static const password = 'password';
  static const phone = 'phone';
  static const image = 'image';
  static const isDriver = 'isDriver';
  static const gender = 'gender';
  static const token = 'token';
}