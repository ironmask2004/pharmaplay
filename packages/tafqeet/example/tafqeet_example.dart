import 'dart:ffi';

import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  //var awesome = Awesome();
  //var taf = TafqeetSyr('10.01');
  //print('Tafqeet : ${taf.tafqeet}  ');

  //taf.amount = '0.03';
  //print('Tafqeet : ${taf.tafqeet}  ');
/*
  TafqeetUnit unitUsa = TafqeetUnit(
      country: 'أميريكياً',
      unit: 'دولاراً',
      unitMultiple: 'دولارين',
      unitPlural: 'دولارات',
      unitPartDigits: 2,
      unitPart: 'سنت',
      unitPartMultiple: 'سنتين',
      unitPartPlural: 'سنتات',
      unitGender: Gender.male,
      unitPartGender: Gender.male,
      unitCode: UnitCode.UnitedStatesDollar);

  var tafUSA = TafqeetMulti('20.01', unitUsa);

//====


//====

  TafqeetUnit unitDK = TafqeetUnit(
      country: 'كويتياً',
      unit: 'ديناراً',
      unitMultiple: 'دينارين',
      unitPlural: 'دنانير',
      unitPartDigits: 3,
      unitPart: 'فلس',
      unitPartMultiple: 'فلسين',
      unitPartPlural: 'فلوس',
      unitGender: Gender.male,
      unitPartGender: Gender.male,
      unitCode: UnitCode.KuwaitiDinar);

  /*for (double dd = 0.0; dd <= 90.20; dd = dd + 0.01) {
    tafSA.amount = ((dd * 100).truncate() / 100).toString();
    print('Tafqeet :  ${tafSA.am}   ${tafSA.tafqeet}  ');
    tafUSA.amount = tafSA.am;
    print('Tafqeet :  ${tafUSA.am}   ${tafUSA.tafqeet}  ');
  }
*/
  var tafDK = TafqeetMulti('20.010', unitDK);
/*
  for (double dd = 0.0; dd <= 15.20; dd = dd + 0.001) {
    // print('DDDD  $dd   : ${(dd * 1000).truncate() / 1000}');

    // tafDK.amount = ((dd * 1000).truncate() / 1000).toString();
    // print('Tafqeet dk :  ${tafDK.am}');

    //print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');
  }

  tafDK.amount = '0';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');

  tafDK.amount = '0.';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');

  tafDK.amount = '.0';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');

  tafDK.amount = '0.0';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');

  tafDK.amount = '0.01';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');

  tafDK.amount = '.123';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');
  tafDK.amount = '0.23';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');
*/
  TafqeetUnit unitKG = TafqeetUnit(
      country: '',
      unit: 'كيلو غراماً',
      unitMultiple: 'أثنين كيلو غراماً',
      unitPlural: 'كيلو غرامات',
      unitPartDigits: 3,
      unitPart: 'غرام',
      unitPartMultiple: 'غرامين',
      unitPartPlural: 'غرامات',
      unitGender: Gender.male,
      unitPartGender: Gender.male,
      unitCode: UnitCode.KiloGram);

  var tafK = TafqeetMulti('20.010', unitKG);

  for (double dd = 0.0; dd <= 15.20; dd = dd + 0.001) {
    // print('DDDD  $dd   : ${(dd * 1000).truncate() / 1000}');

    //tafK.amount = ((dd * 1000).truncate() / 1000).toString();
    // print('Tafqeet dk :  ${tafDK.am}');

    // print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  }

  //tafK.amount = '11.12';
  // print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  // tafK.amount = '12.11';
  // print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  tafK.amount = '12.012';
  print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  tafDK.amount = '2222.222';
  print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');
  tafK.amount = '1';
  print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  tafK.amount = '2222.222';
  print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');




  tafK.amount = '3';
  //print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');

  TafqeetUnit unitOnce = TafqeetUnit(
      country: '',
      unit: 'أونصة',
      unitMultiple: 'أونصتين',
      unitPlural: 'أونصات',
      unitPartDigits: 0,
      unitPart: '',
      unitPartMultiple: '',
      unitPartPlural: '',
      unitGender: Gender.female,
      unitPartGender: Gender.female,
      unitCode: UnitCode.Ounce);

  var tafOnce = TafqeetMulti('20', unitOnce);
  tafOnce.amount = '453576';
  print('---Tafqeet :  ${tafOnce.am}   ${tafOnce.tafqeet}  ');

  tafOnce.amount = '1';
  print('---Tafqeet :  ${tafOnce.am}   ${tafOnce.tafqeet}  ');

  tafOnce.amount = '2';
  print('---Tafqeet :  ${tafOnce.am}   ${tafOnce.tafqeet}  ');
  tafOnce.amount = '3';
  print('---Tafqeet :  ${tafOnce.am}   ${tafOnce.tafqeet}  ');

  tafOnce.amount = '4';
  print('---Tafqeet :  ${tafOnce.am}   ${tafOnce.tafqeet}  ');

  TafqeetUnit unitKM = TafqeetUnit(
      country: '',
      unit: 'متراً',
      unitMultiple: 'أثنين متراً',
      unitPlural: 'أمتار',
      unitPartDigits: 2,
      unitPart: 'سنتميتراً',
      unitPartMultiple: 'سنتيمتران',
      unitPartPlural: 'سنتيمترات',
      unitGender: Gender.male,
      unitPartGender: Gender.male,
      unitCode: UnitCode.KiloMetre);

  var tafKM = TafqeetMulti('20', unitKM);
  tafKM.amount = '453576.01';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '0.12';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '0.02';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');
  tafKM.amount = '0.03';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '110.01';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  TafqeetUnit unitSY = TafqeetUnit(
      country: 'سورية',
      unit: 'ليرة',
      unitMultiple: 'ليرتين',
      unitPlural: 'ليرات',
      unitPartDigits: 2,
      unitPart: 'قرشاً',
      unitPartMultiple: 'قرشان',
      unitPartPlural: 'قروش',
      unitGender: Gender.female,
      unitPartGender: Gender.male,
      unitCode: UnitCode.SyrianPound);

  // var unitSY = TafqeetMulti('20.01', unitSY);

  var tafSy = TafqeetMulti('20', unitSY);
  tafSy.amount = '453576.01';
  print('---Tafqeet :  ${tafSy.am}   ${tafSy.tafqeet}  ');

  tafSy.amount = '0.12';
  print('---Tafqeet :  ${tafSy.am}   ${tafSy.tafqeet}  ');

  tafSy.amount = '30.02';
  print('---Tafqeet :  ${tafSy.am}   ${tafSy.tafqeet}  ');
  tafSy.amount = '10.03';
  print('---Tafqeet :  ${tafSy.am}   ${tafSy.tafqeet}  ');

  tafSy.amount = '01.01';
  print('---Tafqeet :  ${tafSy.am}   ${tafSy.tafqeet}  ');

  print(unitSY.toJson().toString());
  */

  TafqeetUnit unitSA = TafqeetUnit(
      country: 'سعودية',
      unit: 'ريال',
      unitPlural: 'ريالات',
      unitPartDigits: 2,
      unitPart: 'هللة',
      unitPartPlural: 'هللات',
      unitGender: Gender.male,
      unitPartGender: Gender.female,
      unitCode: UnitCode.SaudiArabianRiyal);

  var tafSA = TafqeetMulti('2540.01', unitSA);

  tafSA.amount = '46467476.67';
  print('---Tafqeet :  ${tafSA.am}   ${tafSA.tafqeet}  ');

  TafqeetUnit unitSY = TafqeetUnit(
      country: 'سورية',
      unit: 'ليرة',
      unitPlural: 'ليرات',
      unitPartDigits: 2,
      unitPart: 'قرش',
      unitPartPlural: 'قروش',
      unitGender: Gender.female,
      unitPartGender: Gender.male,
      unitCode: UnitCode.SyrianPound);

  var tafSAp = TafqeetMulti('20.01', unitSY);

  tafSAp.amount = '20.02';
  print('---Tafqeet :  ${tafSAp.am}   ${tafSAp.tafqeet}  ');
  tafSAp.amount = '2.2';
  print('---Tafqeet :  ${tafSAp.am}   ${tafSAp.tafqeet}  ');
  tafSAp.amount = '0.02';
  print('---Tafqeet :  ${tafSAp.am}   ${tafSAp.tafqeet}  ');

  tafSAp.amount = '2222.22';
  print('---Tafqeet :  ${tafSAp.am}   ${tafSAp.tafqeet}  ');

  TafqeetUnit unitund = TafqeetUnit(
      country: '',
      unit: 'قطعة',
      unitPlural: 'قطع',
      unitPartDigits: 3,
      unitPart: 'جزء',
      unitPartPlural: 'أجزاء',
      unitGender: Gender.male,
      unitPartGender: Gender.male,
      unitCode: UnitCode.Undefined);

  var tafund = TafqeetMulti('20.01', unitund);

  tafSA.amount = '76.67';
  print('${tafSA.tafqeet}  ');

  tafSA.amount = '14444.1666';
  print('${tafSA.tafqeet}  ');
  tafSA.amount = '5';
  print('${tafSA.tafqeet}  ');
  tafSA.amount = '333.34';
  print('${tafSA.tafqeet}  ');
  tafSA.amount = '47.4';
  print('${tafSA.tafqeet}  ');
  tafSA.amount = '35.45';
  print('${tafSA.tafqeet}  ');
  tafSA.amount = '6.06';
  print('${tafSA.tafqeet}  ');
}
