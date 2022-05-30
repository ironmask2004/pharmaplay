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
      currncyFrcDigits: 2,
      currencyFrc: 'هللة',
      currencyFrcMultiple: 'هللاتين',
      currencyFrcPlural: 'هللات',
      gender: 'F');

  var tafSA = TafqeetMulti('20.01', currenySA);

  for (double dd = 0.0; dd <= 90.20; dd = dd + 0.01) {
    tafSA.amount = ((dd * 100).truncate() / 100).toString();
    print('Tafqeet :  ${tafSA.am}   ${tafSA.tafqeet}  ');
    tafUSA.amount = tafSA.am;
    print('Tafqeet :  ${tafUSA.am}   ${tafUSA.tafqeet}  ');
  }
}
