import 'dart:ffi';

import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  // var tafund = TafqeetMulti('20.01', unitund);

  var tafUSA = TafqeetMulti();

  print(tafUSA.tafqeetByPreDefinedUnit(
      amount: '33.02', tafqeetUnitCode: TafqeetUnitCode.unitedStatesDollar));

  print(tafUSA.tafqeetByPreDefinedUnit(
      amount: '33.02', tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafUSA.tafqeetByUserDefinedUnit(
      amount: '332',
      userDefinedUnit: TafqeetUnit(
          country: '',
          unit: 'طنجرة',
          unitPlural: 'طناجر',
          unitPartDigits: 0,
          unitPart: '',
          unitPartPlural: ' ',
          unitGender: TafqeetGender.feminine,
          unitPartGender: TafqeetGender.feminine,
          unitCode: TafqeetUnitCode.userDefined)));
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
