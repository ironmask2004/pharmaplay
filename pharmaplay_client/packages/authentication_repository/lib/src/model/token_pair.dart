import 'dart:convert';

class TokenPair {
  TokenPair(this.idToken, this.refreshToken);

  final String idToken;
  final String refreshToken;

  Map<String, dynamic> toMap() {
    return {
      'idToken': idToken,
      'refreshToken': refreshToken,
    };
  }

  factory TokenPair.fromMap(Map<String, dynamic> map) {
    return TokenPair(
      map['idToken'],
      map['refreshToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenPair.fromJson(String source) =>
      TokenPair.fromMap(json.decode(source));
}
