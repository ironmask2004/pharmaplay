import 'dart:ffi';

import 'package:tafqeet/src/tafqeet_multi.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  //var awesome = Awesome();
  //var taf = TafqeetSyr('10.01');
  //print('Tafqeet : ${taf.tafqeet}  ');

  //taf.amount = '0.03';
  //print('Tafqeet : ${taf.tafqeet}  ');

  TafqeetUnit unitUsa = TafqeetUnit(
      country: 'أميريكياً',
      unit: 'دولاراً',
      unitMultiple: 'دولارين',
      unitPlural: 'دولارات',
      currncyFrcDigits: 2,
      unitFrc: 'سنت',
      unitFrcMultiple: 'سنتين',
      unitFrcPlural: 'سنتات',
      unitGender: 'M',
      unitFrcGender: 'M');

  var tafUSA = TafqeetMulti('20.01', unitUsa);

//====

  TafqeetUnit unitSA = TafqeetUnit(
      country: 'سعودياً',
      unit: 'ريالاً',
      unitMultiple: 'ريالين',
      unitPlural: 'ريالات',
      currncyFrcDigits: 2,
      unitFrc: 'هللة',
      unitFrcMultiple: 'هللاتين',
      unitFrcPlural: 'هللات',
      unitGender: 'M',
      unitFrcGender: 'F');

  var tafSA = TafqeetMulti('20.01', unitSA);

//====

  TafqeetUnit unitDK = TafqeetUnit(
      country: 'كويتياً',
      unit: 'ديناراً',
      unitMultiple: 'دينارين',
      unitPlural: 'دنانير',
      currncyFrcDigits: 3,
      unitFrc: 'فلس',
      unitFrcMultiple: 'فلسين',
      unitFrcPlural: 'فلوس',
      unitGender: 'M',
      unitFrcGender: 'M');

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
      currncyFrcDigits: 3,
      unitFrc: 'غرام',
      unitFrcMultiple: 'غرامين',
      unitFrcPlural: 'غرامات',
      unitGender: 'M',
      unitFrcGender: 'M');

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

  tafSA.amount = '2222.46';
  print('---Tafqeet :  ${tafSA.am}   ${tafSA.tafqeet}  ');

  tafK.amount = '3';
  //print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');

  TafqeetUnit unitOnce = TafqeetUnit(
      country: '',
      unit: 'أونصة',
      unitMultiple: 'أونصتين',
      unitPlural: 'أونصات',
      currncyFrcDigits: 0,
      unitFrc: '',
      unitFrcMultiple: '',
      unitFrcPlural: '',
      unitGender: 'F',
      unitFrcGender: 'F');

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
      unitPlural: 'مترات',
      currncyFrcDigits: 2,
      unitFrc: 'سنتميتراً',
      unitFrcMultiple: 'سنتيمتران',
      unitFrcPlural: 'سنتيمترات',
      unitGender: 'M',
      unitFrcGender: 'M');

  var tafKM = TafqeetMulti('20', unitKM);
  tafKM.amount = '453576.01';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '0.12';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '0.02';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');
  tafKM.amount = '0.03';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '10.01';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  TafqeetUnit unitSY = TafqeetUnit(
      country: 'سورية',
      unit: 'ليرة',
      unitMultiple: 'ليرتين',
      unitPlural: 'ليرات',
      currncyFrcDigits: 2,
      unitFrc: 'قرشاً',
      unitFrcMultiple: 'قرشان',
      unitFrcPlural: 'قروش',
      unitGender: 'F',
      unitFrcGender: 'M');

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
}
