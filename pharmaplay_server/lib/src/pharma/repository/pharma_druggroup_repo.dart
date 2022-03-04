import 'package:pharmaplay_server/pharmaplay_server.dart';

///---------------------

Future<List<DrugGroup>> getDrugGrougSearch(
    {required int startFromPage,
    required int pageLength,
    required String orderByfields,
    required String whereCond,
    required DB db,
    required String drugStore,
    required String localeUI}) async {
  final String startFromRow = ((startFromPage - 1) * pageLength).toString();
  List<DrugGroup> resultDrugGroup = <DrugGroup>[];
  String sql = '''SELECT    drugGroup."drugGroupID" ,
      drugGroup."${localeUI}__drugGroupName" as "drugGroupName"
      FROM  pharmaplay."drugGroup" drugGroup
      $whereCond
    ORDER BY   $orderByfields
    LIMIT $pageLength  OFFSET  $startFromRow
    ''';

  dynamic resultSet = await db.query(sql);

  print(resultSet.toString());
  print('----------------');
  if (resultSet.length >= 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultDrugGroup.add(DrugGroup.fromJson(element['drugGroup']));
    });
    print('---- return------------');

    return (resultDrugGroup);
  } else {
    print(' DrugGroup is Empty ');
    throw ' DrugGroup is Empty ';
  }
}

///----------------------