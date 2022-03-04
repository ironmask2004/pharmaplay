import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/pharma/repository/pharma_druggroup_repo.dart';
import 'package:pharmaplay_server/src/utilites/error_response.dart';

class PharmaDrugGroupApi {
  String drugStore;
  DB db;
  PharmaDrugGroupApi(this.db, this.drugStore);
  Handler get router {
    final router = Router();

//======= getDrugGroupAll ====================

    router.post('/search', (Request req) async {
      List<DrugGroup> drugGroupInfo;
      // try {
      final payload = await req.readAsString();
      print(payload);
      final String whereCond = json.decode(payload)['wherecond'] ?? '';
      final String localeUI = json.decode(payload)['localeUI'] ?? 'en';
      final Map<String, dynamic> listpagesparms = json.decode(payload);
      print(listpagesparms);

      final int startFromPage = int.parse(listpagesparms['startfrompage'] ?? 0);

      final int pageLength = int.parse(listpagesparms['pagelength'] ?? 0);

      final String orderByfields = listpagesparms['orderbyfields'] ?? '';
      print('startFromPage :   $startFromPage   -- pagelength : $pageLength');

      if (pageLength <= 0 || startFromPage <= 0 || orderByfields.isEmpty) {
        return Response.forbidden(
            responseErrMsg(
                '''  {   "startfrompage": "2" , "pagelength": "5"  , "localeUI": "ar" , 
                "orderbyfields":  "drugGroup.\"ar__drugGroupName\""   } ''',
                "403"),
            headers: {
              'content-type': 'application/json',
            });
      }

      drugGroupInfo = await getDrugGrougSearch(
          startFromPage: startFromPage,
          pageLength: pageLength,
          orderByfields: orderByfields,
          whereCond: whereCond,
          db: db,
          drugStore: drugStore,
          localeUI: localeUI);

      print("founded_drugGroups------:" + drugGroupInfo.toString());
      /*} catch (err) {
        return Response.forbidden(responseErrMsg("$err", "9004"), headers: {
          'content-type': 'application/json',
        });
      }*/

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
