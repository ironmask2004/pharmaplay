import 'package:pharmaplay_server/pharmaplay_server.dart';

class TokenService {
  TokenService(this.db, this.secret);

  final RedisConnection db;
  final String secret;

  static late Command _cache;
  final String _prefix = 'token';

  Future<void> start(String host, int port) async {
    _cache = await db.connect(host, port);
  }

  Future<TokenPair> createTokenPair(String userId) async {
    final tokenId = Uuid().v4();
    final token =
        generateJwt(userId, 'http://localhost', secret, jwtId: tokenId);

    final refreshTokenExpiry = Duration(seconds: 5400);
    final refreshToken = generateJwt(
      userId,
      'http://localhost',
      secret,
      jwtId: tokenId,
      expiry: refreshTokenExpiry,
    );

    await addRefreshToken(tokenId, refreshToken, refreshTokenExpiry);

    return TokenPair(token, refreshToken);
  }

  Future<void> addRefreshToken(String id, String token, Duration expiry) async {
    await _cache.send_object(['SET', '$_prefix:$id', token]);
    await _cache.send_object(['EXPIRE', '$_prefix:$id', expiry.inSeconds]);
  }

  Future<dynamic> getRefreshToken(String id) async {
    return await _cache.get('$_prefix:$id');
  }

  Future<void> removeRefreshToken(String id) async {
    await _cache.send_object(['EXPIRE', '$_prefix:$id', '-1']);
  }
}
