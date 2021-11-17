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

    final refreshTokenExpiry = Duration(seconds: 15400);
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

  Future<void> removeAllRefreshTokenByUserId(String userId) async {
    print('remove refresh token:    userId:$userId:');

    int iterator = 0;
    var resaultList = [];
    do {
      resaultList = await _cache
          .send_object(['SCAN', '$iterator', 'MATCH', 'userId:$userId:*']);
      var keys = resaultList[1];
      for (var i = 0; i < keys.length; i++) {
        await _cache.send_object(['EXPIRE', '${keys[i]}', '-1']);
      }
      iterator = int.parse(resaultList[0].toString());

      print('X=$iterator');
    } while (iterator != 0);
    print("========list + list" + resaultList.toString());
  }

  Future<dynamic> AllRefreshTokenByScanUserId(String userId) async {
    var list = [];

    int iter = 0;
    var resaultList = [];
    do {
      list = await _cache
          .send_object(['SCAN', '$iter', 'MATCH', 'userId:$userId:*']);
      resaultList.addAll(list[1]);
      iter = int.parse(list[0].toString());
      print('X=$iter');
    } while (iter != 0);

    print(resaultList);

    Map mapp = {};
    for (int i = 0; i < resaultList.length; i++) {
      mapp["$i"] = "";

      mapp["$i"] = resaultList[i].toString();
    }

    return (json.encode(mapp));
  }
}
