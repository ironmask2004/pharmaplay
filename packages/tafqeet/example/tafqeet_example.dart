import 'dart:ffi';

//import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/src/model/tafqeet_unit_data.dart';

import 'package:tafqeet/tafqeet.dart';

void main() {
  // var tafund = TafqeetMulti('20.01', unitund);

  var tafSA = TafqeetMulti('20.01', unitSA);
  var tafSAp = TafqeetMulti('20.01', unitSY);
  var tafUSA = TafqeetMulti('20.01', unitUsa);
  var tafM = TafqeetMulti('20.01', unitM);
  var tafHR = TafqeetMulti('20.01', unitHR);

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

  var tafDK = TafqeetMulti('20.01', unitDK);
  var tafKG = TafqeetMulti('20.01', unitKG);
  var tafKM = TafqeetMulti('20.01', unitKM);

  for (double dd = 0.0; dd <= 0.20; dd = dd + 0.001) {
    print('DDDD  $dd   : ${(dd * 1000).truncate() / 1000}');
    tafDK.amount = ((dd * 1000).truncate() / 1000).toString();
    print('${tafDK.tafqeet}');
    tafKG.amount = tafDK.amount;
    print('${tafKG.tafqeet}  ');
    tafKM.amount = tafDK.amount;
    print('${tafKM.tafqeet}');
  }
}
