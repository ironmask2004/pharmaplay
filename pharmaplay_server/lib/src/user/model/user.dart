import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:pharmaplay_server/pharmaplay_server.dart';

/*
SELECT  createdate,  current_timestamp,
TIMESTAMP WITH TIME ZONE 'epoch' + updatedate  * INTERVAL '1 millisecond'  , updatedate
FROM pharmaplay.users000;

SELECT EXTRACT(EPOCH FROM TIMESTAMP WITH TIME ZONE '2001-02-16 20:38:40.12-08');
Result: 982384720.12

SELECT EXTRACT(EPOCH FROM INTERVAL '5 days 3 hours');
Result: 442800
Here is how you can convert an epoch value back to a time stamp:

SELECT TIMESTAMP WITH TIME ZONE 'epoch' + 982384720.12 * INTERVAL '1 second';
*/

class User extends Equatable {
  final int idx;
  final String id;
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  final String salt;
  final String mobile;
  final DateTime createdate;
  final DateTime updatedate;

  User({
    required this.idx,
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.salt,
    required this.mobile,
    required this.createdate,
    required this.updatedate,
  });

  User copyWith({
    int? idx,
    String? id,
    String? firstname,
    String? lastname,
    String? email,
    String? password,
    String? salt,
    String? mobile,
    DateTime? createdate,
    DateTime? updatedate,
  }) {
    return User(
      idx: idx ?? this.idx,
      id: id ?? this.id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      salt: salt ?? this.salt,
      mobile: mobile ?? this.mobile,
      createdate: createdate ?? this.createdate,
      updatedate: updatedate ?? this.updatedate,
    );
  }

  User copyWithFromMap(Map<String, dynamic> map) {
    return User(
        idx: map['idx'] ?? idx,
        id: map['id'] ?? id,
        firstname: map['firstname'] ?? firstname,
        lastname: map['lastname'] ?? lastname,
        email: map['email'] ?? email,
        password: map['password'] ?? password,
        salt: map['salt'] ?? salt,
        mobile: map['mobile'] ?? mobile,
        //createdate: ((map['updatedate'] ?? createdate)),
        // updatedate: (map['updatedate'] ?? updatedate));
        createdate: (map['updatedate'] == null
            ? createdate
            : DateTime.fromMillisecondsSinceEpoch(
                int.parse(map['updatedate'].toString()))),
        updatedate: (map['updatedate'] == null
            ? updatedate
            : DateTime.fromMillisecondsSinceEpoch(
                int.parse(map['updatedate'].toString()))));
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
      'mobile': mobile,
      'createdate': createdate.millisecondsSinceEpoch,
      'updatedate': updatedate.millisecondsSinceEpoch,
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
        mobile: map['mobile'],
        createdate: DateTime.fromMillisecondsSinceEpoch(
            int.parse(map['updatedate'].toString())),
        updatedate: DateTime.fromMillisecondsSinceEpoch(
            int.parse(map['updatedate'].toString())));
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  copyWithfromJson(String source) => copyWithFromMap(json.decode(source));

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
      mobile,
      createdate,
      updatedate,
    ];
  }
}
