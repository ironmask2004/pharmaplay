import 'dart:ffi';

import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/tafqeet.dart';

void main() {
  var tafqeet = Tafqeet();

  print(tafqeet.tafqeetNumberWithParts(
      listOfNumberAndParts: [23, 2, 59],
      tafqeetUnitCode: TafqeetUnitCode.hour));

  print(tafqeet.tafqeetNumberWithParts(
    listOfNumberAndParts: [23, 2, 59],
    tafqeetUnitCode: TafqeetUnitCode.hour,
    justWord: 'الوقت المتوقع هو:',
    noOtherWord: 'بدءً من ساعة الصفر',
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
  var batUnit = TafqeetUnit(
      unitCode: TafqeetUnitCode.userDefined,
      country: 'تايلندي',
      unit: 'بات',
      unitPlural: 'باتات',
      unitMaxValue: 100,
      unitGender: TafqeetUnitGender.masculine,
      partialUnitCode: TafqeetUnitCode.none);
  var batPennyUnit = TafqeetUnit(
      unitCode: TafqeetUnitCode.userDefined,
      country: 'تايلندي',
      unit: 'ساتانغ',
      unitPlural: 'ساتانغات',
      unitMaxValue: 100,
      unitGender: TafqeetUnitGender.masculine,
      partialUnitCode: TafqeetUnitCode.none);

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {3: batUnit},
    {11: batPennyUnit}
  ]));
  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {46588453: batUnit},
    {19: batPennyUnit}
  ]));

  var number1 = 13;
  TafqeetUnit unit1 = TafqeetUnit(
    unit: 'طنجرة',
    unitPlural: 'طناجر',
    unitGender: TafqeetUnitGender.feminine,
  );

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {number1: unit1}
  ]));

  number1 = 1;
  unit1 = TafqeetUnit(
      unitCode: TafqeetUnitCode.userDefined,
      country: '',
      unit: 'بطيخة',
      unitPlural: 'بطيخات',
      unitMaxValue: 0,
      unitGender: TafqeetUnitGender.feminine,
      partialUnitCode: TafqeetUnitCode.none);

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
  TafqeetUnit unitBoxes = TafqeetUnit(
      unitCode: TafqeetUnitCode.userDefined,
      country: '',
      unit: 'صندوق',
      unitPlural: 'صناديق',
      unitMaxValue: 0,
      unitGender: TafqeetUnitGender.masculine,
      partialUnitCode: TafqeetUnitCode.none);

  var partsNumber = 11;

  TafqeetUnit partsUnit = TafqeetUnit(
      unitCode: TafqeetUnitCode.userDefined,
      country: '',
      unit: 'قطعة',
      unitPlural: 'قطع',
      unitMaxValue: 12,
      unitGender: TafqeetUnitGender.feminine,
      partialUnitCode: TafqeetUnitCode.none);

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {boxesNumber: unitBoxes},
    {partsNumber: partsUnit}
  ]));

  print(tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
    {boxesNumber: null},
    {partsNumber: null}
  ]));
}
