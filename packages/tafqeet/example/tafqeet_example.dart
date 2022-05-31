import 'dart:ffi';

import 'package:tafqeet/src/tafqeet_multi.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  //var awesome = Awesome();
  //var taf = TafqeetSyr('10.01');
  //print('Tafqeet : ${taf.tafqeet}  ');

  //taf.amount = '0.03';
  //print('Tafqeet : ${taf.tafqeet}  ');

  TafqeetCurrency currenyUsa = TafqeetCurrency(
      country: 'أميريكياً',
      currency: 'دولاراً',
      currencyMultiple: 'دولارين',
      currencyPlural: 'دولارات',
      currncyFrcDigits: 2,
      currencyFrc: 'سنت',
      currencyFrcMultiple: 'سنتين',
      currencyFrcPlural: 'سنتات',
      currencyGender: 'M',
      currencyFrcGender: 'M');

  var tafUSA = TafqeetMulti('20.01', currenyUsa);

//====

  TafqeetCurrency currenySA = TafqeetCurrency(
      country: 'سعودياً',
      currency: 'ريالاً',
      currencyMultiple: 'ريالين',
      currencyPlural: 'ريالات',
      currncyFrcDigits: 2,
      currencyFrc: 'هللة',
      currencyFrcMultiple: 'هللاتين',
      currencyFrcPlural: 'هللات',
      currencyGender: 'M',
      currencyFrcGender: 'F');

  var tafSA = TafqeetMulti('20.01', currenySA);

//====

  TafqeetCurrency currenyDK = TafqeetCurrency(
      country: 'كويتياً',
      currency: 'ديناراً',
      currencyMultiple: 'دينارين',
      currencyPlural: 'دنانير',
      currncyFrcDigits: 3,
      currencyFrc: 'فلس',
      currencyFrcMultiple: 'فلسين',
      currencyFrcPlural: 'فلوس',
      currencyGender: 'M',
      currencyFrcGender: 'M');

  /*for (double dd = 0.0; dd <= 90.20; dd = dd + 0.01) {
    tafSA.amount = ((dd * 100).truncate() / 100).toString();
    print('Tafqeet :  ${tafSA.am}   ${tafSA.tafqeet}  ');
    tafUSA.amount = tafSA.am;
    print('Tafqeet :  ${tafUSA.am}   ${tafUSA.tafqeet}  ');
  }
*/
  var tafDK = TafqeetMulti('20.010', currenyDK);
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
  TafqeetCurrency currenyKG = TafqeetCurrency(
      country: '',
      currency: 'كيلو غراماً',
      currencyMultiple: 'أثنين كيلو غراماً',
      currencyPlural: 'كيلو غرامات',
      currncyFrcDigits: 3,
      currencyFrc: 'غرام',
      currencyFrcMultiple: 'غرامين',
      currencyFrcPlural: 'غرامات',
      currencyGender: 'M',
      currencyFrcGender: 'M');

  var tafK = TafqeetMulti('20.010', currenyKG);

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

  TafqeetCurrency currenyOnce = TafqeetCurrency(
      country: '',
      currency: 'أونصة',
      currencyMultiple: 'أونصتين',
      currencyPlural: 'أونصات',
      currncyFrcDigits: 0,
      currencyFrc: '',
      currencyFrcMultiple: '',
      currencyFrcPlural: '',
      currencyGender: 'F',
      currencyFrcGender: 'F');

  var tafOnce = TafqeetMulti('20', currenyOnce);
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

  TafqeetCurrency currenyKM = TafqeetCurrency(
      country: '',
      currency: 'متراً',
      currencyMultiple: 'أثنين متراً',
      currencyPlural: 'مترات',
      currncyFrcDigits: 2,
      currencyFrc: 'سنتميتراً',
      currencyFrcMultiple: 'سنتيمتران',
      currencyFrcPlural: 'سنتيمترات',
      currencyGender: 'M',
      currencyFrcGender: 'M');

  var tafKM = TafqeetMulti('20', currenyKM);
  tafKM.amount = '453576.01';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '0.12';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '0.02';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');
  tafKM.amount = '0.03';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');

  tafKM.amount = '0.01';
  print('---Tafqeet :  ${tafKM.am}   ${tafKM.tafqeet}  ');
}
