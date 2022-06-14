import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

//import 'package:tafqeet/tafqeet.dart';

import 'package:tafqeet/src/model/tafqeet_predefined_units.dart';
import 'package:tafqeet/tafqeet.dart';
import 'model/tafqeet_unit.dart';
import 'model/utility.dart';

class Tafqeet {
  //final List<Map<String, dynamic>> _PredefinedUnits = tafqeetPredefinedUnits;

  String? tafqeetNumberWithParts(
      {required List<num> listOfNumberAndParts,
      required TafqeetUnitCode tafqeetUnitCode,
      String justWord = 'فقط',
      String noOtherWord = 'لاغير',
      bool tryTafqeet = false}) {
    ///----
    List? splitedUnitValue;
    // List<Map> listValuesToTafqeet = [];
    //num currentUnitValue = 0;
    String andWord = '';
    TafqeetUnit currentUnit;
    TafqeetUnitCode currentUnitCode = tafqeetUnitCode;
    bool mainUnitFlag = true;
    String tafResult = '';
    int listLenght = listOfNumberAndParts.length;
    //num previousValueToRound = 0;

    for (int i = 0; i < listLenght; i++) {
      splitedUnitValue = splitUnitValue(listOfNumberAndParts[i]);

      currentUnit = TafqeetUnit.fromMap(tafqeetPredefinedUnits.firstWhere(
          (element) => element['unitCode'] == currentUnitCode, orElse: () {
        return tafqeetPredefinedUnits
            .firstWhere((e) => e['unitCode'] == TafqeetUnitCode.undefinedPart);
      }));

      if (splitedUnitValue.length > 2) {
        if (tryTafqeet) {
          return null;
        } else {
          throw FormatException(
              '''It is not possible to handle numbers containing commas ${listOfNumberAndParts[i]},
              enter the number without commas  ( ${splitedUnitValue[1]}) ,
              and add the parts ( ${splitedUnitValue[2]}) as a valid number in the parts field:''');
        }
      }
      if (i > 0 &&
          currentUnit.unitMaxValue != 0 &&
          splitedUnitValue[1] >= currentUnit.unitMaxValue) {
        if (tryTafqeet) {
          return null;
        } else {
          throw FormatException(
              '''The value of the parts should not exceed the upper limit of the unit  ${currentUnit.unitCode}    "
            upper limit:  ${currentUnit.unitMaxValue}
            the pass value was: ${splitedUnitValue[1]}  ''');
        }
      }
      // currentUnitValue = splitedUnitValue[1];

      if (splitedUnitValue[1] != 0) {
        tafResult = tafResult +
            andWord +
            (_getTafqeet(
                    am: splitedUnitValue[1].toString(),
                    tafqeetUnit: currentUnit,
                    isMainUnit: (currentUnit.country.isNotEmpty && mainUnitFlag
                        ? true
                        : false)) ??
                '');
        andWord = ' و ';
        mainUnitFlag = false;
      }
      currentUnitCode = currentUnit.partialUnitCode;
    }

    tafResult = '$justWord $tafResult $noOtherWord'
        .replaceAll('  ', ' ')
        .replaceAll('  ', ' ')
        .replaceAll('و ', 'و');
    return (tafResult);
  }

//======

  ///=====================

  String? tafqeetByUserDefinedUnit(
      {required List<Map<num, Map<String, dynamic>?>> listOfNumberAndParts,
      String justWord = 'فقط',
      String noOtherWord = 'لاغير',
      bool tryTafqeet = false}) {
    ///----
    List? splitedUnitValue;
    // List<Map> listValuesToTafqeet = [];
    //num currentUnitValue = 0;
    String andWord = '';
    TafqeetUnit currentUnit;
    // TafqeetUnitCode currentUnitCode = tafqeetUnitCode;
    bool mainUnitFlag = true;
    String tafResult = '';
    int listLenght = listOfNumberAndParts.length;
    //num previousValueToRound = 0;

    for (int i = 0; i < listLenght; i++) {
      splitedUnitValue = splitUnitValue(listOfNumberAndParts[i].keys.first);

      currentUnit = TafqeetUnit.fromMap(listOfNumberAndParts[i].values.first ??
          (i == 0
              ? tafqeetPredefinedUnits
                  .firstWhere((e) => e['unitCode'] == TafqeetUnitCode.undefined)
              : tafqeetPredefinedUnits.firstWhere(
                  (e) => e['unitCode'] == TafqeetUnitCode.undefinedPart)));

      /* currentUnit = TafqeetUnit.fromMap(tafqeetPredefinedUnits.firstWhere(
          (element) => element['unitCode'] == TafqeetUnitCode.undefined,
          orElse: () {
        return tafqeetPredefinedUnits
            .firstWhere((e) => e['unitCode'] == TafqeetUnitCode.undefinedPart);
      }));*/

      if (splitedUnitValue.length > 2) {
        if (tryTafqeet) {
          return null;
        } else {
          throw FormatException(
              '''It is not possible to handle numbers containing commas ${listOfNumberAndParts[i]},
              enter the number without commas  ( ${splitedUnitValue[1]}) ,
              and add the parts ( ${splitedUnitValue[2]}) as a valid number in the parts field:''');
        }
      }
      if (i > 0 &&
          currentUnit.unitMaxValue != 0 &&
          splitedUnitValue[1] >= currentUnit.unitMaxValue) {
        if (tryTafqeet) {
          return null;
        } else {
          throw FormatException(
              '''The value of the parts should not exceed the upper limit of the unit  ${currentUnit.unitCode}    " 
            upper limit:  ${currentUnit.unitMaxValue}
            the pass value was: ${splitedUnitValue[1]}  ''');
        }
      }
      // currentUnitValue = splitedUnitValue[1];

      if (splitedUnitValue[1] != 0) {
        tafResult = tafResult +
            andWord +
            (_getTafqeet(
                    am: splitedUnitValue[1].toString(),
                    tafqeetUnit: currentUnit,
                    isMainUnit: (currentUnit.country.isNotEmpty && mainUnitFlag
                        ? true
                        : false)) ??
                '');
        andWord = ' و ';
        mainUnitFlag = false;
      }
    }

    tafResult = '$justWord $tafResult $noOtherWord'
        .replaceAll('  ', ' ')
        .replaceAll('  ', ' ')
        .replaceAll('و ', 'و');
    return (tafResult);
  }

//==================

//  --################################################################
/*  example :
                        x=584
                3XDigits =5-8-4
          xDigitLocation= 2-1-0
_getTafqeetWord( onesTensWordList,   xDigit =5 ,  xDigitLocation = 2 ,   TafqeetUnit)
  onesTensWordList [5 * 3 + 2 + 1] ----->  خمسمائة

getTafqeetWord( onesTensWordList,   xDigit =4 ,  xDigitLocation = 0 ,   TafqeetUnit)

onesTensWordList[4 * 3 + 0 + 1] -------> اربعة

getTafqeetWord( onesTensWordList,   xDigit =8 ,  xDigitLocation = 1 ,   TafqeetUnit)
onesTensWordList[8 * 3 + 1 + 1] ------>  ثمانون

getTafqeetWord( countedWordList,   xDigit = 1,  xDigitLocation = 0 ,   TafqeetUnit)

countedWordList[1 * 3 + 0 + 1] ------> ريالاً
--
        فقط خمسمائة واربعة وثمانون ريالاً
  */
  String _getTafqeetWord(String tafqeetWordsList, var xDigit,
      var xDigitLocation, TafqeetUnit tafUnit) {
    TafqeetUnitGender numGender = (tafUnit.unitGender);

    List<String> hndrdsThosndsWordList = [
      ' ',
      ' ',
      ' ',
      ' ',
      'واحد',
      ' عشر',
      'مئة',
      'اثنان',
      'عشرون',
      'مئتان',
      'ثلاثة',
      'ثلاثون',
      'ثلاثمائة',
      'اربعة',
      'اربعون',
      'اربعمائة',
      'خمسة',
      'خمسون',
      'خمسمائة',
      'ستة',
      'ستون',
      'ستمائة',
      'سبعة',
      'سبعون',
      'سبعمائة',
      'ثمانية',
      'ثمانون',
      'ثمانمائة',
      'تسعة',
      'تسعون',
      'تسعمائة'
    ];
    List<String> onesTensWordList = [
      ' ',
      ' ',
      ' ',
      ' ',
      //'احدى',
      (numGender == TafqeetUnitGender.feminine ? 'احدى' : 'واحد'),
      //     ' عشرة',
      (numGender == TafqeetUnitGender.feminine ? ' عشرة' : ' عشر'),
      'مئة',

      //'اثنتان',
      (numGender == TafqeetUnitGender.feminine ? 'اثنتان' : 'إثنان'),
      'عشرون',
      'مئتان',

      //'ثلاث',
      (numGender == TafqeetUnitGender.feminine ? 'ثلاث' : 'ثلاثة'),
      'ثلاثون',
      'ثلاثمائة',

      //'اربع',
      (numGender == TafqeetUnitGender.feminine ? 'اربع' : 'اربعة'),
      'اربعون',
      'اربعمائة',

      //'خمس',
      (numGender == TafqeetUnitGender.feminine ? 'خمس' : 'خمسة'),
      'خمسون',
      'خمسمائة',

      //'ست',
      (numGender == TafqeetUnitGender.feminine ? 'ست' : 'ستة'),
      'ستون',
      'ستمائة',

      //'سبع',
      (numGender == TafqeetUnitGender.feminine ? 'سبع' : 'سبعة'),
      'سبعون',
      'سبعمائة',

      //'ثماني',
      (numGender == TafqeetUnitGender.feminine ? 'ثماني' : 'ثمانية'),
      'ثمانون',
      'ثمانمائة',

      //'تسع',
      (numGender == TafqeetUnitGender.feminine ? 'تسع' : 'تسعة'),
      'تسعون',
      'تسعمائة'
    ];
    List<String> countedWordList = [
      ' ',
      //'قرشاً',
      ' ',
      //'قرشاً',
      ' ',
      // 'قروش',
      ' ',

      //'ليرة',
      ((tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة'
          ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}ةً'
          : '${tafUnit.unit}اً')),

      //'ليرة',
      ((tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة'
          ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}ةً'
          : '${tafUnit.unit}اً')),

      //'ليرات',
      (tafUnit.unitPlural),
      'الف',
      'الفاً',
      'الاف',
      'مليون',
      'مليوناً',
      'ملايين',
      'مليار',
      'ملياراً',
      'مليارات',
      'ترليون',
      'ترليوناً',
      'ترليونات',
      'كوادريليون',
      'كوادريليوناً',
      'كوادريليونات'
    ];
    List<String> oneTowWordList = [
      ' ',
//    'قرش واحد',
      ' ',
//    'قرشان',
      ' ',
//    'قرشان',
      ' ',
      //'ليرة واحدة',
      '${((tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة' ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}ةً' : '${tafUnit.unit}اً'))}${numGender == TafqeetUnitGender.feminine ? ' واحدة' : ' واحداً'}',
      //'ليرتان',     // (tafUnit.unitMultiple),
      (tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة'
          ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}تان'
          : '${tafUnit.unit}ان'),

      //'ليرتان',       (tafUnit.unitMultiple),
      (tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة'
          ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}تان'
          : '${tafUnit.unit}ان'),
      'الف',
      'الفان',
      'الفا',
      'مليون',
      'مليونان',
      'مليونا',
      'مليار',
      'ملياران',
      'مليارا',
      'ترليون',
      'ترليونان',
      'ترليونا',
      'كوادريليون',
      'كوادريليونان',
      'كوادريليونا'
    ];
    // print('$tafqeetWordsList[$xDigit * 3 + $xDigitLocation + 1]');
    if (tafqeetWordsList == 'hndrdsThosndsWordList') {
      return (hndrdsThosndsWordList[xDigit * 3 + xDigitLocation + 1]);
    } else if (tafqeetWordsList == 'onesTensWordList') {
      return (onesTensWordList[xDigit * 3 + xDigitLocation + 1]);
    } else if (tafqeetWordsList == 'oneTowWordList') {
      return (oneTowWordList[xDigit * 3 + xDigitLocation + 1]);
    } else if (tafqeetWordsList == 'countedWordList') {
      return (countedWordList[xDigit * 3 + xDigitLocation + 1]);
    }
    return ('');
  }

  ///##########################################
  /*  _tafqeetOnePart
example :
    tafqeetNumber = 479 576 389
    -------------------------
_tafqeetOnePart(  hndrdsThosndsWordList, partValue: 479, partLocation: 3, sumRestPartsValue:  965,  tafUnit )
اربعمائة وتسعة وسبعون مليوناً

_tafqeetOnePart(  hndrdsThosndsWordList, partValue: 576, partLocation: 2, sumRestPartsValue: 389,  tafUnit)
خمسمائة وستة وسبعون الفاً

_tafqeetOnePart(  onesTensWordList, partValue: 389,  partLocation: 1, sumRestPartsValue 0,  tafUnit)

ثلاثمائة وتسعة وثمانون ريالاً


  */
  ///--################################################################
  String _tafqeetOnePart(String tafqeetWordList, var partValue,
      var partLocation, var sumRestPartsValue, TafqeetUnit tafUnit) {
    //  print(
    //    '_tafqeetOnePart(  $tafqeetWordList, $partValue, $partLocation, $sumRestPartsValue,  tafUnit ');

    int xHundred = 0;
    int xTens = 0;

    int xOnes = 0;
    var u = 0;

    String tafResult = '';

    String firstAndWord = '';
    String betweenAndWord = '';

    xHundred = int.tryParse((partValue / 100).truncate().toString()) ?? 0;
    xTens = int.tryParse(
            ((partValue - (xHundred * 100)) / 10).truncate().toString()) ??
        0;
    xOnes = int.tryParse(((partValue - xHundred * 100 - xTens * 10))
            .truncate()
            .toString()) ??
        0;

    if (partValue == 0) {
      tafResult = '';
      return (tafResult);
    } else if (partValue == 1) {
      tafResult = _getTafqeetWord('oneTowWordList', partLocation, 0, tafUnit);
    } else if (partValue == 2) {
      if ((sumRestPartsValue == 0)) {
        tafResult = _getTafqeetWord('oneTowWordList', partLocation, 2, tafUnit);
      } else {
        tafResult = _getTafqeetWord('oneTowWordList', partLocation, 1, tafUnit);
      }
    } else if (partValue == 10) {
      if (_getTafqeetWord(tafqeetWordList, 1, 0, tafUnit) == 'احدى') {
        tafResult = 'عشر';
      } else {
        tafResult = 'عشرة';
      }
    } else if (partValue == 11) {
      if (_getTafqeetWord(tafqeetWordList, 1, 0, tafUnit) == 'احدى') {
        tafResult = 'احدى عشرة';
      } else {
        tafResult = 'احد عشر';
      }
    } else if (partValue == 12) {
      if (_getTafqeetWord(tafqeetWordList, 1, 0, tafUnit) == 'احدى') {
        tafResult = 'اثنتا عشرة';
      } else {
        tafResult = 'اثنا عشر';
      }
    } else {
      if ((xHundred > 0 && xTens + xOnes != 0)) {
        firstAndWord = ' و';
      }

      if ((xTens > 0 && xTens != 1 && xOnes != 0)) {
        betweenAndWord = ' و';
      }

      if ((xHundred == 2 && xTens + xOnes == 0)) {
        tafResult = 'مئتا';
      } else {
        if ((xTens == 0 && (xOnes == 1 || xOnes == 2))) {
          tafResult = _getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit) +
              firstAndWord +
              _getTafqeetWord(
                  'oneTowWordList', partLocation, (xOnes - 1), tafUnit) +
              betweenAndWord +
              _getTafqeetWord(tafqeetWordList, xTens, 1, tafUnit);
        } else if ((xTens == 1 && (xOnes == 1 || xOnes == 2 || xOnes == 0))) {
          if (xOnes == 1) {
            if (_getTafqeetWord(tafqeetWordList, 1, 0, tafUnit) == 'احدى') {
              tafResult =
                  '${_getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit)} واحدى عشرة';
            } else {
              tafResult =
                  '${_getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit)} واحد عشر';
            }
          } else if (xOnes == 2) {
            if (_getTafqeetWord(tafqeetWordList, 1, 0, tafUnit) == 'احدى') {
              tafResult =
                  '${_getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit)} واثنتا عشرة';
            } else {
              tafResult =
                  '${_getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit)} واثنا عشر';
            }
          } else if (xOnes == 0) {
            if ((xTens == 1 && xOnes == 0)) {
              if (_getTafqeetWord(tafqeetWordList, 1, 0, tafUnit) == 'احدى') {
                tafResult =
                    '${_getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit)} وعشر';
              } else {
                tafResult =
                    '${_getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit)} وعشرة';
              }
            }
          }
        } else {
          tafResult = _getTafqeetWord(tafqeetWordList, xHundred, 2, tafUnit) +
              firstAndWord +
              _getTafqeetWord(tafqeetWordList, xOnes, 0, tafUnit) +
              betweenAndWord +
              _getTafqeetWord(tafqeetWordList, xTens, 1, tafUnit);
        }
      }
    }

    u = 0;

    if ((!((xTens == 0 && (xOnes == 1 || xOnes == 2)) ||
        partValue == 1 ||
        partValue == 2))) {
      if ((partValue >= 11 && partValue <= 99)) {
        u = 1;
      }

      if ((partValue >= 100 && xTens == 1 && xOnes == 0)) {
        u = 2;
      }

      if ((partValue >= 100 && xTens != 0)) {
        u = 1;
      }

      if (((partValue >= 100 && (xOnes + xTens) == 0) ||
          (sumRestPartsValue == 0))) {
        u = 0;
      }

      if ((partValue >= 3 && partValue <= 10)) {
        u = 2;
      }

      if ((partValue >= 100 && xTens == 0 && xOnes > 2)) {
        u = 2;
      }

      if ((partValue >= 100 && xTens == 1 && xOnes == 0)) {
        u = 2;
      }

      tafResult =
          '$tafResult ${_getTafqeetWord('countedWordList', partLocation, u, tafUnit)}';
    }

    return (tafResult);
  }
//  --################################################################

//  --################################################################
  String? _getTafqeet({
    required String am,
    required TafqeetUnit tafqeetUnit,
    bool isMainUnit = true, //  main amount only   get countery value
  }) {
    String j;
    String onePartTaf;
    String amount;

    TafqeetUnit tafUnit = tafqeetUnit.copyWith(
      unit: tafqeetUnit.unit.isEmpty ? ' ' : tafqeetUnit.unit,
      unitPlural: tafqeetUnit.unitPlural.isEmpty ? ' ' : tafqeetUnit.unitPlural,
    );

    List partValue = [0, 0, 0, 0, 0, 0, 0, 0];

    int f = 0;
    int flag = 0;
    int p;
    String tafResult = '';

    if (am.isEmpty) {
      return ('');
    }

    // print('am: $am  ${am.runtimeType}  ');
    amount = am;
    // print('am: $am  Amount: $amount');

    p = amount.indexOf('.');

    // print('Founf DOT @ $p  lenght: ${amount.length}');

    if ((p != -1)) {
      return (null);
    }

    if (((amount.length)) > 18) {
      return ('!!!تجاوزت الحد الاعلى للرقم');
    }

    j = '000000000000000000'.substring(0, 18 - (amount.length)) + amount;

    for (int i = 0; i <= 5; i++) {
      amount = j.substring(0, 3);
      partValue[(7 - i)] = int.tryParse(amount);
      j = j.substring(3, (j.length));
    }

    if ((partValue[7] > 0)) {
      onePartTaf = _tafqeetOnePart(
          'hndrdsThosndsWordList',
          partValue[7],
          6,
          partValue[6] +
              partValue[5] +
              partValue[4] +
              partValue[3] +
              partValue[2],
          tafUnit);
      tafResult = tafResult + onePartTaf;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((partValue[6] > 0)) {
      onePartTaf = _tafqeetOnePart('hndrdsThosndsWordList', partValue[6], 5,
          partValue[5] + partValue[4] + partValue[3] + partValue[2], tafUnit);
      if ((f == 1)) {
        tafResult = '$tafResult و';
      }
      tafResult = tafResult + onePartTaf;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((partValue[5] > 0)) {
      onePartTaf = _tafqeetOnePart('hndrdsThosndsWordList', partValue[5], 4,
          partValue[4] + partValue[3] + partValue[2], tafUnit);

      if ((f == 1)) {
        tafResult = '$tafResult و';
      }

      tafResult = tafResult + onePartTaf;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((partValue[4] > 0)) {
      onePartTaf = _tafqeetOnePart('hndrdsThosndsWordList', partValue[4], 3,
          partValue[3] + partValue[2], tafUnit);

      if ((f == 1)) {
        tafResult = '$tafResult و';
      }

      tafResult = tafResult + onePartTaf;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((partValue[3] > 0)) {
      onePartTaf = _tafqeetOnePart(
          'hndrdsThosndsWordList', partValue[3], 2, partValue[2], tafUnit);

      if ((f == 1)) {
        tafResult = '$tafResult و';
      }

      tafResult = tafResult + onePartTaf;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((partValue[2] > 0)) {
      onePartTaf =
          _tafqeetOnePart('onesTensWordList', partValue[2], 1, 0, tafUnit);

      if ((f == 1)) {
        tafResult = '$tafResult و';
      }

      tafResult = tafResult + onePartTaf;
      flag = 1;
      f = 1;
    } else if (f == 1) {
      tafResult = '$tafResult  ${tafUnit.unit}';
    }

    if (f == 1 && tafUnit.country.isNotEmpty && isMainUnit) {
      tafResult = _getCountryUnit(
          partValue[2], tafResult, tafUnit.country, tafUnit.unitGender);
    }

    if ((double.tryParse(am) == 0)) {
      tafResult = 'صفر ${tafUnit.unit}';
    }

    return (tafResult.replaceAll('  ', ' ').replaceAll('  ', ' '));
  }

// ==========

  String _getCountryUnit(var amount, String tafResult, String tafUnitCountry,
      TafqeetUnitGender tafUnitGender) {
    if (tafUnitCountry.isEmpty) return tafResult;

    String unitCountryLastChar =
        tafUnitCountry.substring(tafUnitCountry.length - 1);
    String unitCountryWithoutLastChar =
        tafUnitCountry.substring(0, tafUnitCountry.length - 1);
    switch (tafUnitGender) {
      case TafqeetUnitGender.feminine:
        if (amount >= 3 && amount <= 10) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? tafUnitCountry : '${tafUnitCountry}ة'))}';
        } else if (amount > 10) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? '${unitCountryWithoutLastChar}ةً' : '${tafUnitCountry}ةً'))}';
        } else if (amount == 2) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? '${unitCountryWithoutLastChar}تان' : '${tafUnitCountry}تان'))}';
        } else if (amount == 1) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? tafUnitCountry : '${tafUnitCountry}ة'))}';
        } else {
          tafResult = '$tafResult $tafUnitCountry';
        }
        break;
      case TafqeetUnitGender.masculine:
        if (amount >= 3 && amount <= 10) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? tafUnitCountry : '${tafUnitCountry}ة'))}';
        } else if (amount > 10) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? '${unitCountryWithoutLastChar}اً' : '${tafUnitCountry}اً'))}';
        } else if (amount == 2) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? '${unitCountryWithoutLastChar}ان' : '${tafUnitCountry}ان'))}';
        } else if (amount == 1) {
          tafResult =
              '$tafResult ${((unitCountryLastChar == 'ة' ? unitCountryWithoutLastChar : tafUnitCountry))}';
        } else {
          tafResult = '$tafResult $tafUnitCountry';
        }
    }
    return tafResult;
  }
}
