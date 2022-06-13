import 'dart:ffi';

import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  // var tafund = TafqeetMulti('20.01', unitund);

  var tafqeet = TafqeetMulti();
  //print(tafqeet.tafqeetNumber(
  //  numberAndParts: [0], tafqeetUnitCode: TafqeetUnitCode.kiloMetre));

  /*
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [33453, 99, 44, 1],
      tafqeetUnitCode: TafqeetUnitCode.kiloMetre));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [111, 12],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [111, 12],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [126002070113, 12],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [126002070113, 12],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [120002000111, 11],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [120002000111, 12],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [11120002000114, 11],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [112, 12],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [555412, 12],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 2],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [2, 222],
      tafqeetUnitCode: TafqeetUnitCode.kuwaitiDinar));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 16],
      tafqeetUnitCode: TafqeetUnitCode.kuwaitiDinar));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 51],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 15],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [345545, 99],
      tafqeetUnitCode: TafqeetUnitCode.kiloGram));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 657, 2, 66],
      tafqeetUnitCode: TafqeetUnitCode.metricTon));
  print(tafqeet.tafqeetNumberWithParts(
    listOfNumberAndParts: [0, 465, 66],
    tafqeetUnitCode: TafqeetUnitCode.metricTon,
  ));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [11, 11],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [117131121211, 11],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [11, 011],
      tafqeetUnitCode: TafqeetUnitCode.kuwaitiDinar));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [316916116116, 26],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [11, 11],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [11111, 12],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [11111, 11],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [111111111111, 12],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [111111111111, 12],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
*/
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [113323, 16],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [113323, 16],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [3457457858575673, 16],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [3457457858575673, 16],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
}
