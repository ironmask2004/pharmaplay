import 'dart:ffi';

import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  var tafqeet = Tafqeet();

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [23, 2, 59],
      tafqeetUnitCode: TafqeetUnitCode.hour));

  print(tafqeet.tafqeetNumberWithParts(
    listOfNumberAndParts: [23, 2, 44],
    tafqeetUnitCode: TafqeetUnitCode.hour,
    justWord: 'الوقت المتوقع هو:',
    noOtherWord: 'بدءً من ساعة الصفر',
    tryTafqeet: true,
  ));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [585890449645464512, 02],
      tafqeetUnitCode: TafqeetUnitCode.syrianPound));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [2, 62],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 62],
      tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal));

  // بات تايلدندي - ساتانغ 100
  var batUnit = {
    'comprehensiveUnit': 'تايلندي',
    'unit': 'بات',
    'unitPlural': 'باتات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
  };
  var batPennyUnit = {
    'comprehensiveUnit': 'تايلندي',
    'unit': 'ساتانغ',
    'unitPlural': 'ساتانغات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
  };

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {3: batUnit},
    {11: batPennyUnit}
  ]));
  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {46588453: batUnit},
    {19: batPennyUnit}
  ]));

  var number1 = 13;
  var unit1 = {
    'unit': 'طنجرة',
    'unitPlural': 'طناجر',
    'unitGender': TafqeetUnitGender.feminine
  };

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {number1: unit1}
  ]));

  number1 = 1;
  unit1 = {
    'unit': 'بطيخة',
    'unitPlural': 'بطيخات',
    'unitGender': TafqeetUnitGender.feminine,
  };

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {number1: unit1}
  ]));

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {2: unit1}
  ]));

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {3: unit1}
  ]));

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {3453453477: unit1}
  ]));

  var boxesNumber = 234234;
  var unitBoxes = {
    'unitCode': TafqeetUnitCode.userDefined,
    'comprehensiveUnit': '',
    'unit': 'صندوق',
    'unitPlural': 'صناديق',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  };

  var partsNumber = 11;

  var partsUnit = {
    'unitCode': TafqeetUnitCode.userDefined,
    'comprehensiveUnit': '',
    'unit': 'قطعة',
    'unitPlural': 'قطع',
    'unitMaxValue': 12,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  };

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {boxesNumber: unitBoxes},
    {partsNumber: partsUnit}
  ]));

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {boxesNumber: null},
    {partsNumber: null}
  ]));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [2, 2, 0, 300],
      tafqeetUnitCode: TafqeetUnitCode.jordanianDinar));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [0, 0, 2, 22],
      tafqeetUnitCode: TafqeetUnitCode.jordanianDinar));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [2], tafqeetUnitCode: TafqeetUnitCode.kiloGram));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [33], tafqeetUnitCode: TafqeetUnitCode.gram));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [213, 45],
      tafqeetUnitCode: TafqeetUnitCode.kiloGram));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [33], tafqeetUnitCode: TafqeetUnitCode.gram));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [2], tafqeetUnitCode: TafqeetUnitCode.kiloGram));

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [13, 8],
      tafqeetUnitCode: TafqeetUnitCode.kiloGram));
  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [3], tafqeetUnitCode: TafqeetUnitCode.kiloGram));
}
