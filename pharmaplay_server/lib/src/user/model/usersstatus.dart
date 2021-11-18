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
