import 'package:pharmaplay_server/pharmaplay_server.dart';

///---------------------

Future<List<Manufactory>> getManufactoryAll(
    {required DB db, String whereCond = ' ', required String localUI}) async {
  List<Manufactory> resultManufactory = <Manufactory>[];
  String sql = '''SELECT    manufactory."manufactoryID" ,
      manufactory."${localUI}__manufactoryName" as "manufactoryName" ,  manufactory."manufactoryRating"
      FROM  pharmaplay."manufactory" manufactory
      $whereCond
      ORDER BY   manufactory."${localUI}__manufactoryName"
    ''';

  dynamic resultSet = await db.query(sql);

  print(resultSet.toString());
  print('----------------');
  if (resultSet.length > 0) {
    resultSet.forEach((element) {
      print(element);
      print('----------------');
      resultManufactory.add(Manufactory.fromJson(element['manufactory']));
    });
    print('---- return------------');

    return (resultManufactory);
  } else {
    print(' Drug is Empty ');
    throw ' Drug is Empty ';
  }
}

///----------------------