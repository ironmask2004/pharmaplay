//userstatustype

import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../../pharmaplay_server.dart';

class UserStatusTypeList extends Equatable {
  final List<UserStatusType> items;
  UserStatusTypeList({
    required this.items,
  });

  UserStatusTypeList copyWith({
    List<UserStatusType>? items,
  }) {
    return UserStatusTypeList(
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory UserStatusTypeList.fromMap(Map<String, dynamic> map) {
    return UserStatusTypeList(
      items: List<UserStatusType>.from(
          map['items']?.map((x) => UserStatusType.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStatusTypeList.fromJson(String source) =>
      UserStatusTypeList.fromMap(json.decode(source));

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [items];
}

class UserStatusType extends Equatable {
  final int idx;
  final String statustype;
  UserStatusType({
    required this.idx,
    required this.statustype,
  });

  UserStatusType copyWith({
    int? idx,
    String? statustype,
  }) {
    return UserStatusType(
      idx: idx ?? this.idx,
      statustype: statustype ?? this.statustype,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idx': idx,
      'statustype': statustype,
    };
  }

  factory UserStatusType.fromMap(Map<String, dynamic> map) {
    return UserStatusType(
      idx: map['idx'],
      statustype: map['statustype'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserStatusType.fromJson(String source) {
    return UserStatusType.fromMap(json.decode(source));
  }
  @override
  bool get stringify => true;

  @override
  List<Object> get props => [idx, statustype];
}
