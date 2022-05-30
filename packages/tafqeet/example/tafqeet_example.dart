import 'package:tafqeet/src/tafqeet_multi.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  //var awesome = Awesome();
  //var taf = TafqeetSyr('10.01');
  //print('Tafqeet : ${taf.tafqeet}  ');

  //taf.amount = '0.03';
  //print('Tafqeet : ${taf.tafqeet}  ');

  var tafM = TafqeetMulti('20.01');
  print('Tafqeet :  ${tafM.am}   ${tafM.tafqeet}  ');

  tafM.amount = '6525.31';
  print('Tafqeet :  ${tafM.am}   ${tafM.tafqeet}  ');

  tafM.amount = '0.03';
  print('Tafqeet :  ${tafM.am}   ${tafM.tafqeet}  ');

  tafM.amount = '.0';
  print('Tafqeet :  ${tafM.am}   ${tafM.tafqeet}  ');

  //taf.amount = '3434.3';
  // print('Tafqeet : ${tafM.tafqeet}  ');
}
