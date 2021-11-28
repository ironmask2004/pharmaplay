class TokenPair {
  TokenPair(this.tokenId, this.refreshToken);

  final String tokenId;
  final String refreshToken;

  Map<String, dynamic> toJson() => {
        'tokenId': tokenId,
        'refreshToken': refreshToken,
        'error': 'Suucess',
        'errorNo': '200'
      };
}
