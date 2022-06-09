import 'dart:ffi';

import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  // var tafund = TafqeetMulti('20.01', unitund);

  var tafqeet = TafqeetMulti();

  print(tafqeet.tafqeetNumber(
      amountAndParts: [33, 22], tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetByPreDefinedUnit(
      amount: '33.02', tafqeetUnitCode: TafqeetUnitCode.unitedStatesDollar));

  print(tafqeet.tafqeetByPreDefinedUnit(
      amount: '33.02', tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetByPreDefinedUnit(
      amount: '33.02',
      tafqeetUnitCode: TafqeetUnitCode.syrianPound,
      justWord: 'ففققطط',
      noOtherWord: 'لاااغيييررر'));

  String tafKM = tafqeet.tafqeetThreeUnitsByPreDefinedUnit(
    number: '1425:48:91',
    mainTafqeetUnitCode: TafqeetUnitCode.kiloMetre,
    subTafqeetUnitCode: TafqeetUnitCode.metre,
  );
  print(tafKM);

  String tafhr = tafqeet.tafqeetThreeUnitsByPreDefinedUnit(
    number: '0:00:01',
    mainTafqeetUnitCode: TafqeetUnitCode.hour,
    subTafqeetUnitCode: TafqeetUnitCode.minute,
  );
  print(tafhr);

  print(tafqeet.tafqeetByUserDefinedUnit(
      amount: '332',
      userDefinedUnit: TafqeetUnit(
          country: '',
          unit: 'طنجرة',
          unitPlural: 'طناجر',
          unitMaxValue: 0,
          unitGender: TafqeetGender.feminine,
          unitCode: TafqeetUnitCode.userDefined,
          partialUnitCode: TafqeetUnitCode.none)));

  print(tafqeet.tafqeetByPreDefinedUnit(
      amount: '33.02', tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetThreeUnitsByPreDefinedUnit(
    number: '33:02:0',
    mainTafqeetUnitCode: TafqeetUnitCode.syrianPound,
    subTafqeetUnitCode: TafqeetUnitCode.syrianPoundPenny,
  ));

  print(tafqeet.tafqeetByPreDefinedUnit(
      amount: '11.12', tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetThreeUnitsByPreDefinedUnit(
    number: '11:12:0',
    mainTafqeetUnitCode: TafqeetUnitCode.syrianPound,
    subTafqeetUnitCode: TafqeetUnitCode.syrianPoundPArt,
  ));

  /*

  var tafSA = TafqeetMulti('20.01', TafqeetUnitCode.unitedStatesDollar);
  var tafSAp = TafqeetMulti('20.01', TafqeetUnitCode.syrianPound);

  var tafM = TafqeetMulti('20.01', TafqeetUnitCode.metre);
  var tafHR = TafqeetMulti('20.01', TafqeetUnitCode.hour);

  for (double dd = 0.0; dd <= 4.20; dd = dd + 0.01) {
    print('DDDD  $dd   : ${(dd * 100).truncate() / 100}');
    tafSA.amount = ((dd * 100).truncate() / 100).toString();
    print('${tafSA.tafqeet}');
    tafSAp.amount = tafSA.amount;
    print('${tafSAp.tafqeet}  ');
    tafUSA.amount = tafSA.amount;
    print('${tafUSA.tafqeet}');
    tafM.amount = tafSA.amount;
    print('${tafM.tafqeet}');
    tafHR.amount = tafSA.amount;
    print('${tafHR.tafqeet}');
  }

  var tafDK = TafqeetMulti('20.01', TafqeetUnitCode.kuwaitiDinar);
  var tafKG = TafqeetMulti('20.01', TafqeetUnitCode.kiloGram);
  var tafKM = TafqeetMulti('20.01', TafqeetUnitCode.kiloMetre);

  for (double dd = 0.0; dd <= 0.20; dd = dd + 0.001) {
    print('DDDD  $dd   : ${(dd * 1000).truncate() / 1000}');
    tafDK.amount = ((dd * 1000).truncate() / 1000).toString();
    print('${tafDK.tafqeet}');
    tafKG.amount = tafDK.amount;
    print('${tafKG.tafqeet}  ');
    tafKM.amount = tafDK.amount;
    print('${tafKM.tafqeet}');
  }
*/
  //print(tafHR.tafqeet(tafqeetUnitCode: TafqeetUnitCode.kiloMetre));
}
