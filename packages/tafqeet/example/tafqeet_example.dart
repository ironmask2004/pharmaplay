import 'dart:ffi';

import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  // var tafund = TafqeetMulti('20.01', unitund);

  var tafqeet = TafqeetMulti();
  //print(tafqeet.tafqeetNumber(
  //  numberAndParts: [0], tafqeetUnitCode: TafqeetUnitCode.kiloMetre));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [33453, 99, 44, 1],
      tafqeetUnitCode: TafqeetUnitCode.kiloMetre));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [11, 2],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [2, 3],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [345545, 99],
      tafqeetUnitCode: TafqeetUnitCode.kiloGram));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 657, 0, 66],
      tafqeetUnitCode: TafqeetUnitCode.metricTon));
  print(tafqeet.tafqeetNumberWithParts(
    listOfNumberAndParts: [0, 44465, 66],
    tafqeetUnitCode: TafqeetUnitCode.metricTon,
  ));
}
