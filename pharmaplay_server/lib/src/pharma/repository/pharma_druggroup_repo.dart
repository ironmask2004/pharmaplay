import 'package:pharmaplay_server/pharmaplay_server.dart';

///---------------------

Future<List<DrugGroup>> getDrugGroupAll(
    {required DB db, String whereCond = ' ', required String localUI}) async {
  List<DrugGroup> resultDrugGroup = <DrugGroup>[];
  String sql = '''SELECT    drugGroup."drugGroupID" ,
      drugGroup."${localUI}__drugGroupName" as "drugGroupName"
      FROM  pharmaplay."drugGroup" drugGroup
      $whereCond
      ORDER BY   drugGroup."${localUI}__drugGroupName"
    ''';

  dynamic resultSet = await db.query(sql);

  print(resultSet.toString());
  print('----------------');
  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultDrugGroup.add(DrugGroup.fromJson(element['drugGroup']));
    });
    print('---- return------------');

    return (resultDrugGroup);
  } else {
    print(' Drug is Empty ');
    throw ' Drug is Empty ';
  }
}

///----------------------