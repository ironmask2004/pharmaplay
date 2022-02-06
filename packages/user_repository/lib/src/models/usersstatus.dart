import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum UserStatus {
  @JsonValue(0)
  needVerify,
  @JsonValue(1)
  verifyed,
  @JsonValue(2)
  loggedIn,
  @JsonValue(3)
  loggedOut,
  @JsonValue(4)
  loginTimeOut
}

const UserStatusEnumMap = {
  UserStatus.needVerify: 0,
  UserStatus.verifyed: 1,
  UserStatus.loggedIn: 2,
  UserStatus.loggedOut: 3,
  UserStatus.loginTimeOut: 4,
};
