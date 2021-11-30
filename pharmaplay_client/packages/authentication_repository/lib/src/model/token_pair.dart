import 'dart:convert';

class TokenPair {
  TokenPair(this.tokenId, this.refreshToken);

  final String tokenId;
  final String refreshToken;

  Map<String, dynamic> toMap() {
    return {
      'tokenId': tokenId,
      'refreshToken': refreshToken,
    };
  }

  factory TokenPair.fromMap(Map<String, dynamic> map) {
    return TokenPair(
      map['tokenId'],
      map['refreshToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenPair.fromJson(String source) =>
      TokenPair.fromMap(json.decode(source));

  factory TokenPair.empty() {
    return TokenPair(
      '',
      '',
    );
  }
  bool isEmpty() {
    return (tokenId == '' && refreshToken == '');
  }
}
