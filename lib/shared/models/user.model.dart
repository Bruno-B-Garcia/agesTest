import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({required this.name, required this.email, required this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      email: map['email'],
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());
}
