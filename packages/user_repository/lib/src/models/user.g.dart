// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      idx: json['idx'] as int,
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      salt: json['salt'] as String,
      mobile: json['mobile'] as String,
      avatar: json['avatar'] as String,
      createdate: DateTime.parse(json['createdate'] as String),
      updatedate: DateTime.parse(json['updatedate'] as String),
      status: $enumDecode(_$UserStatusEnumMap, json['status'],
          unknownValue: UserStatus.needVerify),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'idx': instance.idx,
      'firstname': instance.firstname,
      'email': instance.email,
      'lastname': instance.lastname,
      'mobile': instance.mobile,
      'avatar': instance.avatar,
      'password': instance.password,
      'salt': instance.salt,
      'createdate': instance.createdate.toIso8601String(),
      'updatedate': instance.updatedate.toIso8601String(),
      'status': _$UserStatusEnumMap[instance.status],
    };

const _$UserStatusEnumMap = {
  UserStatus.needVerify: 0,
  UserStatus.verifyed: 1,
  UserStatus.loggedIn: 2,
  UserStatus.loggedOut: 3,
  UserStatus.loginTimeOut: 4,
};
