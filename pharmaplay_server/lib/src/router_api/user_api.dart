import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/repository/database_api.dart';
import 'package:pharmaplay_server/src/user/model/user.dart';
import 'package:pharmaplay_server/src/user/user_repository/user_repo.dart';

class UserApi {
  String authStore;
  DB db;
  UserApi(this.db, this.authStore);
  Handler get router {
    final router = Router();
    router.get('/info/', (Request req) async {
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());

      User Curr_user =
          await findUserByID(authDetails.subject.toString(), db, authStore);
      print("founded_user------:" + Curr_user.email);
      //return Response.ok('{ "email": "${Curr_user.email}" }'
      print(Curr_user.toJson().toString());
      return Response.ok(Curr_user.toJson().toString(), headers: {
        'content-type': 'application/json',
      });
    });

    router.post('/', (Request req) async {
      final authDetails = req.context['authDetails'] as JWT;
      print('authDetails.subject.toString ' + authDetails.subject.toString());

      User Curr_user =
          await findUserByID(authDetails.subject.toString(), db, authStore);
      print("founded_user------:" + Curr_user.email);
      return Response.ok('{ "email": "${Curr_user.email}" }', headers: {
        'content-type': 'application/json',
      });
    });

    final handler =
        Pipeline().addMiddleware(checkAuthorisation()).addHandler(router);
    return handler;
  }
}
