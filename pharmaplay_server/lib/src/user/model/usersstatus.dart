import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/src/user/model/userstatustype.dart';

import '../../../pharmaplay_server.dart';

class UserStatus extends Equatable {
  final int idx;
  final UserStatusType userstatustype;
  final int usersidx;
  final String lastname;
  final String activestatus;
  final DateTime statusdate;
  UserStatus({
    required this.idx,
    required this.userstatustype,
    required this.usersidx,
    required this.lastname,
    required this.activestatus,
    required this.statusdate,
  });

  UserStatus copyWith({
    int? idx,
    UserStatusType? userstatustype,
    int? usersidx,
    String? lastname,
    String? activestatus,
    DateTime? statusdate,
  }) {
    return UserStatus(
      idx: idx ?? this.idx,
      userstatustype: userstatustype ?? this.userstatustype,
      usersidx: usersidx ?? this.usersidx,
      lastname: lastname ?? this.lastname,
      activestatus: activestatus ?? this.activestatus,
      statusdate: statusdate ?? this.statusdate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idx': idx,
      'userstatustype': userstatustype.toMap(),
      'usersidx': usersidx,
      'lastname': lastname,
      'activestatus': activestatus,
      'statusdate': statusdate.millisecondsSinceEpoch,
    };
  }

  factory UserStatus.fromMap(Map<String, dynamic> map) {
    return UserStatus(
      idx: map['idx'],
      userstatustype: UserStatusType.fromMap(map['userstatustype']),
      usersidx: map['usersidx'],
      lastname: map['lastname'],
      activestatus: map['activestatus'],
      statusdate: DateTime.fromMillisecondsSinceEpoch(map['statusdate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStatus.fromJson(String source) =>
      UserStatus.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      idx,
      userstatustype,
      usersidx,
      lastname,
      activestatus,
      statusdate,
    ];
  }
}
