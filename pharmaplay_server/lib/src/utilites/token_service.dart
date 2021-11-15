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

    await addRefreshToken(tokenId, userId, refreshToken, refreshTokenExpiry);

    return TokenPair(token, refreshToken);
  }

  Future<void> addRefreshToken(
      String id, String userId, String token, Duration expiry) async {
    await _cache.send_object(['SET', 'userId:$userId:$_prefix:$id:', token]);

    await _cache.send_object(
        ['EXPIRE', 'userId:$userId:$_prefix:$id:', expiry.inSeconds]);
  }

  Future<dynamic> getRefreshToken(String id, String userId) async {
    return await _cache.get('userId:$userId:$_prefix:$id:');
  }

  Future<void> removeRefreshToken(String id, String userId) async {
    print('remove refresh token  ID: userId:$userId:$_prefix:$id:');
    await _cache.send_object(['EXPIRE', 'userId:$userId:$_prefix:$id:', '-1']);
  }

  Future<void> removeRefreshTokenByUserId(String userId) async {
    print('remove refresh token:    userId:$userId:');

//redis-cli --scan --pattern 'userId:$userId:*'
    var result = await Process.run(
        'redis-cli', ['--scan', '--pattern', 'userId:$userId:*']);
    LineSplitter liness = LineSplitter();
    List<String> keys = liness.convert(result.stdout);

    for (var i = 0; i < keys.length; i++) {
      await _cache.send_object(['EXPIRE', '${keys[i]}', '-1']);
    }
  }
}
