import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/pharma/repository/pharma_manufactory_repo.dart';
import 'package:pharmaplay_server/src/utilites/error_response.dart';

class PharmaManufactoryApi {
  String drugStore;
  DB db;
  PharmaManufactoryApi(this.db, this.drugStore);
  Handler get router {
    final router = Router();

//======= getManufactoryAll ====================

    router.post('/search', (Request req) async {
      List<Manufactory> drugGroupInfo;
      try {
        final payload = await req.readAsString();

        final Map<String, dynamic> listpagesparms = json.decode(payload) ?? {};
        print(listpagesparms);

        final String localUI = listpagesparms['localUI'] ?? 'en';
        final String whereCond = listpagesparms['wherecond'] ?? ' ';

        drugGroupInfo = await getManufactoryAll(
            db: db, whereCond: whereCond, localUI: localUI);

        // print("founded_drug------:" + drugInfo.toString());
      } catch (err) {
        return Response.forbidden(responseErrMsg("$err", "9004"), headers: {
          'content-type': 'application/json',
        });
      }

      var jsonString = json.encode(drugGroupInfo);
      //print('--------------0-0-0-0-0-\n' + jsonString);

      return Response.ok(jsonString, headers: {
        'content-type': 'application/json',
      });
    });

//=============
    //============= /drug/  ROUTE

    final handler = Pipeline().addHandler(router);

    //    Pipeline().addMiddleware(checkAuthorisation()).addHandler(router);
    return handler;
  }
}
