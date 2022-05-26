import 'package:tafqeet/tafqeet.dart';

void main() {
  //var awesome = Awesome();
  var taf = Tafqeet('2');
  print('Tafqeet : ${taf.tafqeet}  ');

  taf.amount = '33.22';
  print('Tafqeet : ${taf.tafqeet}  ');
}
