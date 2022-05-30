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
      gender: 'M');

  var tafUSA = TafqeetMulti('20.01', currenyUsa);

//====

  TafqeetCurrency currenySA = TafqeetCurrency(
      country: 'سعودياً',
      currency: 'ريالاً',
      currencyMultiple: 'ريالين',
      currencyPlural: 'ريالات',
      currncyFrcDigits: 3,
      currencyFrc: 'هللة',
      currencyFrcMultiple: 'هللاتين',
      currencyFrcPlural: 'هللات',
      gender: 'F');

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
      gender: 'M');

  for (double dd = 0.0; dd <= 90.20; dd = dd + 0.01) {
    tafSA.amount = ((dd * 100).truncate() / 100).toString();
    print('Tafqeet :  ${tafSA.am}   ${tafSA.tafqeet}  ');
    tafUSA.amount = tafSA.am;
    print('Tafqeet :  ${tafUSA.am}   ${tafUSA.tafqeet}  ');
  }

  var tafDK = TafqeetMulti('20.010', currenyDK);

  for (double dd = 0.0; dd <= 15.20; dd = dd + 0.001) {
    // print('DDDD  $dd   : ${(dd * 1000).truncate() / 1000}');

    tafDK.amount = ((dd * 1000).truncate() / 1000).toString();
    // print('Tafqeet dk :  ${tafDK.am}');

    print('Tafqeet :  ${tafDK.am}   ${tafDK.tafqeet}  ');
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

  TafqeetCurrency currenyKG = TafqeetCurrency(
      country: '',
      currency: 'كيلو غراماً',
      currencyMultiple: 'أثنين كيلو غراماً',
      currencyPlural: 'كيلو غرامات',
      currncyFrcDigits: 3,
      currencyFrc: 'غرام',
      currencyFrcMultiple: 'غرامين',
      currencyFrcPlural: 'غرامات',
      gender: 'M');

  var tafK = TafqeetMulti('20.010', currenyKG);

  for (double dd = 0.0; dd <= 15.20; dd = dd + 0.001) {
    // print('DDDD  $dd   : ${(dd * 1000).truncate() / 1000}');

    tafK.amount = ((dd * 1000).truncate() / 1000).toString();
    // print('Tafqeet dk :  ${tafDK.am}');

    print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  }

  tafK.amount = '11.12';
  print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  tafK.amount = '12.11';
  print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  tafK.amount = '1';
  print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
  tafK.amount = '2';
  print('Tafqeet :  ${tafK.am}   ${tafK.tafqeet}  ');
}
