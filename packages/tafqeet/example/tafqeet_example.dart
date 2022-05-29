import 'package:tafqeet/src/tafqeet_multi.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  //var awesome = Awesome();
  var taf = TafqeetSyr('323423.01');
  print('Tafqeet : ${taf.tafqeet}  ');

  taf.amount = '3434.3';
  print('Tafqeet : ${taf.tafqeet}  ');

  var tafM = TafqeetMulti('1001456789134567.01');
  print('Tafqeet : ${tafM.tafqeet}  ');

  taf.amount = '3434.3';
  // print('Tafqeet : ${tafM.tafqeet}  ');
}
