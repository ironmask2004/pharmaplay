import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

class User extends Equatable {
  final int idx;
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String salt;
  User({
    required this.idx,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.salt,
  });

  User copyWith({
    int? idx,
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    String? salt,
  }) {
    return User(
      idx: idx ?? this.idx,
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      salt: salt ?? this.salt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idx': idx,
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'salt': salt,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      idx: map['idx'],
      id: map['id'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      email: map['email'],
      password: map['password'],
      salt: map['salt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      idx,
      id,
      firstname,
      lastname,
      email,
      password,
      salt,
    ];
  }
}
