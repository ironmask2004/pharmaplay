import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

//import 'package:tafqeet/tafqeet.dart';

import 'package:tafqeet/src/model/tafqeet_predefined_units.dart';
import 'package:tafqeet/tafqeet.dart';

import 'model/tafqeet_unit.dart';

/// Checks if you are awesome. Spoiler: you are.

class TafqeetMulti {
  // String _am;
  //TafqeetUnit _tafUnit;
  // TafqeetUnitCode _tafqeetUnitCode;

  final List<TafqeetUnit> _unitList = tafqeetPredefinedUnits;

  //String gender;

  // TafqeetMulti(
  //  this._am,
  //  this._tafqeetUnitCode,
  // );

  //set amount(String newAmount) {
  // _am = newAmount;
  // }

  /// set unitCode(TafqeetUnitCode newTafqeetunit) {
  //  _tafqeetUnitCode = newTafqeetunit;
  //}

  //String get amount {
  //  return (_am);
  //}

  String tafqeetByUserDefinedUnit(
      {required String amount,
      required TafqeetUnit userDefinedUnit,
      String justWord = 'فقط',
      String noOtherWord = 'لاغير'}) {
    return (_getTafqeetMulti(
        am: amount,
        tafqeetUnit: userDefinedUnit,
        justWord: justWord,
        noOtherWord: noOtherWord));
  }

  String tafqeetThreeUnitsByPreDefinedUnit(
      {required String number,
      required TafqeetUnitCode mainTafqeetUnitCode,
      required TafqeetUnitCode subTafqeetUnitCode,
      String justWord = 'فقط',
      String noOtherWord = 'لاغير'}) {
    final splitsmount = number.split(':');

    //print('splitsmount.length ${splitsmount.length}');

    // for (int i = 0; i < splitsmount.length; i++) print(splitsmount[i]);

    switch (splitsmount.length) {
      case 0:
        return ('$number Must Be in Three parts Units devided By ":" Like "123:45:67" !!');

      case 1:
        return (tafqeetByPreDefinedUnit(
            amount: splitsmount.first,
            tafqeetUnitCode: mainTafqeetUnitCode,
            justWord: justWord,
            noOtherWord: noOtherWord));
        break;
      case 2:
        return (tafqeetByPreDefinedUnit(
            amount: '${splitsmount[0]}.${splitsmount[1]}',
            tafqeetUnitCode: mainTafqeetUnitCode,
            justWord: justWord,
            noOtherWord: noOtherWord));
        break;
      case 3:

        // print('------${splitsmount[1]}.${splitsmount[2]}');
        String tafMainamount = tafqeetByPreDefinedUnit(
            amount: splitsmount[0],
            tafqeetUnitCode: mainTafqeetUnitCode,
            justWord: justWord,
            noOtherWord: '');

        String tafSubamount = tafqeetByPreDefinedUnit(
            amount: '${splitsmount[1]}.${splitsmount[2]}',
            tafqeetUnitCode: subTafqeetUnitCode,
            justWord: '',
            noOtherWord: noOtherWord);
        return ('$tafMainamountو$tafSubamount');
    }

    return ('$number Must Be in Three parts Units devided By ":" Like "123:45:67" !!');
  }

  String tafqeetByPreDefinedUnit(
      {required String amount,
      required TafqeetUnitCode tafqeetUnitCode,
      String justWord = 'فقط',
      String noOtherWord = 'لاغير'}) {
    // _tafqeetUnitCode = tafqeetUnitCode ?? _tafqeetUnitCode;

    var unitFiltered = _unitList.firstWhere(
        (element) => element.unitCode == tafqeetUnitCode, orElse: () {
      return _unitList
          .firstWhere((e) => e.unitCode == TafqeetUnitCode.undefined);
    });

    return (_getTafqeetMulti(
        am: amount,
        tafqeetUnit: unitFiltered,
        justWord: justWord,
        noOtherWord: noOtherWord));
  }

//  --################################################################
  String _getArrVal(String arr, var pR, var pC, TafqeetUnit tafUnit,
      TafqeetGender numGender) {
    List<String> mx = [
      ' ',
      ' ',
      ' ',
      ' ',
      //'واحد',
      (numGender == TafqeetGender.feminine ? 'احدى' : 'واحد'),
      ' عشر',
      'مئة',
      'اثنان',
      'عشرون',
      'مئتان',
      //'ثلاثة',
      (numGender == TafqeetGender.feminine ? 'ثلاث' : 'ثلاثة'),

      'ثلاثون',
      'ثلاثمائة',
      //'اربعة',
      (numGender == TafqeetGender.feminine ? 'اربع' : 'اربعة'),

      'اربعون',
      'اربعمائة',
      //'خمسة',
      (numGender == TafqeetGender.feminine ? 'خمس' : 'خمسة'),

      'خمسون',
      'خمسمائة',
      //'ستة',
      (numGender == TafqeetGender.feminine ? 'ست' : 'ستة'),

      'ستون',
      'ستمائة',
      //'سبعة',
      (numGender == TafqeetGender.feminine ? 'سبع' : 'سبعة'),

      'سبعون',
      'سبعمائة',
      //'ثمانية',
      (numGender == TafqeetGender.feminine ? 'ثماني' : 'ثمانية'),

      'ثمانون',
      'ثمانمائة',
      //'تسعة',
      (numGender == TafqeetGender.feminine ? 'تسع' : 'تسعة'),

      'تسعون',
      'تسعمائة'
    ];
    List<String> my = [
      ' ',
      ' ',
      ' ',
      ' ',
      //'احدى',
      (numGender == TafqeetGender.feminine ? 'احدى' : 'واحد'),
      ' عشرة',
      'مئة',
      //'اثنتان',
      (numGender == TafqeetGender.feminine ? 'اثنتان' : 'إثنان'),

      'عشرون',
      'مئتان',
      //'ثلاث',
      (numGender == TafqeetGender.feminine ? 'ثلاث' : 'ثلاثة'),

      'ثلاثون',
      'ثلاثمائة',
      //'اربع',
      (numGender == TafqeetGender.feminine ? 'اربع' : 'اربعة'),

      'اربعون',
      'اربعمائة',
      //'خمس',
      (numGender == TafqeetGender.feminine ? 'خمس' : 'خمسة'),

      'خمسون',
      'خمسمائة',
      //'ست',
      (numGender == TafqeetGender.feminine ? 'ست' : 'ستة'),

      'ستون',
      'ستمائة',
      //'سبع',
      (numGender == TafqeetGender.feminine ? 'سبع' : 'سبعة'),

      'سبعون',
      'سبعمائة',
      //'ثماني',
      (numGender == TafqeetGender.feminine ? 'ثماني' : 'ثمانية'),

      'ثمانون',
      'ثمانمائة',
      //'تسع',
      (numGender == TafqeetGender.feminine ? 'تسع' : 'تسعة'),

      'تسعون',
      'تسعمائة'
    ];
    List<String> w = [
      ' ',
      //'قرشاً',
      ((tafUnit.unitPart.substring(tafUnit.unitPart.length - 1) == 'ة'
          ? '${tafUnit.unitPart.substring(0, tafUnit.unitPart.length - 1)}ةً'
          : '${tafUnit.unitPart}اً')),
      //'قرشاً',
      ((tafUnit.unitPart.substring(tafUnit.unitPart.length - 1) == 'ة'
          ? 'ةً'
          : 'اً')),
      // 'قروش',
      (tafUnit.unitPartPlural),
      //'ليرة',
      //tafUnit.unit + '#',

      ((tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة'
          ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}ةً'
          : '${tafUnit.unit}اً')),

      //'ليرة',
      //tafUnit.unit + '%',
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
      'بلايين',
      'كوادريليون',
      'كوادريليوناً',
      'كوادريليونات'
    ];
    List<String> a = [
      ' ',
//    'قرش واحد',
      '${tafUnit.unitPart} ${numGender == TafqeetGender.feminine ? 'واحدة' : 'واحد'}',
//    'قرشان',
      (tafUnit.unitPartMultiple),
//    'قرشان',
      (tafUnit.unitPartMultiple),
      //'ليرة واحدة',

      '${((tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة' ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}ةً' : '${tafUnit.unit}اً'))}${numGender == TafqeetGender.feminine ? ' واحدة' : ' واحداً'}',
      //'ليرتان',
      (tafUnit.unitMultiple),
      //'ليرتان',
      (tafUnit.unitMultiple),
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
    //print('$arr[$pR * 3 + $pC + 1]');
    if (arr == 'MX') {
      return (mx[pR * 3 + pC + 1]);
    } else if (arr == 'MY') {
      return (my[pR * 3 + pC + 1]);
    } else if (arr == 'A') {
      return (a[pR * 3 + pC + 1]);
    } else if (arr == 'W') {
      return (w[pR * 3 + pC + 1]);
    }
    return ('');
  }

  ///##########################################
  ///
  ///--################################################################
  String _spellNum(String m1, var x, var part, var zx, TafqeetUnit tafUnit,
      {TafqeetGender? unitPartGender}) {
    TafqeetGender numGender = (unitPartGender ?? tafUnit.unitGender);
    int? x100 = 0;
    int? x10 = 0;

    int? x1 = 0;
    var u = 0;
    String w1;
    String w2;
    String t = '';

    w1 = '';
    w2 = '';
    //print('X: $x');
    x100 = int.tryParse((x / 100).truncate().toString());
    x10 = int.tryParse(((x - (x100! * 100)) / 10).truncate().toString());
    x1 = int.tryParse(((x - x100 * 100 - x10! * 10)).truncate().toString());

    //print('X: $x  X100: $x100  X10:  $x10 X1:  $x1 ');
    if (x == 0) {
      t = '';
      return (t);
    } else if (x == 1) {
      t = _getArrVal('A', part, 0, tafUnit, numGender);
    } else if (x == 2) {
      if ((zx == 0)) {
        t = _getArrVal('A', part, 2, tafUnit, numGender);
      } else {
        t = _getArrVal('A', part, 1, tafUnit, numGender);
      }
    } else if (x == 10) {
      if (_getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
        t = 'عشر';
      } else {
        t = 'عشرة';
      }
    } else if (x == 11) {
      if (_getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
        t = 'احدى عشرة';
      } else {
        t = 'احد عشر';
      }
    } else if (x == 12) {
      if (_getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
        t = 'اثنتا عشرة';
      } else {
        t = 'اثنا عشر';
      }
    } else {
      if ((x100 > 0 && x10 + x1! != 0)) {
        w1 = ' و';
      }

      if ((x10 > 0 && x10 != 1 && x1 != 0)) {
        w2 = ' و';
      }

      if ((x100 == 2 && x10 + x1! == 0)) {
        t = 'مئتا';
      } else {
        if ((x10 == 0 && (x1 == 1 || x1 == 2))) {
          t = _getArrVal(m1, x100, 2, tafUnit, numGender) +
              w1 +
              _getArrVal('A', part, (x1! - 1), tafUnit, numGender) +
              w2 +
              _getArrVal(m1, x10, 1, tafUnit, numGender);
        } else if ((x10 == 1 && (x1 == 1 || x1 == 2 || x1 == 0))) {
          if (x1 == 1) {
            if (_getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
              t = '${_getArrVal(m1, x100, 2, tafUnit, numGender)} واحدى عشرة';
            } else {
              t = '${_getArrVal(m1, x100, 2, tafUnit, numGender)} واحد عشر';
            }
          } else if (x1 == 2) {
            if (_getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
              t = '${_getArrVal(m1, x100, 2, tafUnit, numGender)} واثنتا عشرة';
            } else {
              t = '${_getArrVal(m1, x100, 2, tafUnit, numGender)} واثنا عشر';
            }
          } else if (x1 == 0) {
            if ((x10 == 1 && x1 == 0)) {
              if (_getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
                t = '${_getArrVal(m1, x100, 2, tafUnit, numGender)} وعشر';
              } else {
                t = '${_getArrVal(m1, x100, 2, tafUnit, numGender)} وعشرة';
              }
            }
          }
        } else {
          t = _getArrVal(m1, x100, 2, tafUnit, numGender) +
              w1 +
              _getArrVal(m1, x1, 0, tafUnit, numGender) +
              w2 +
              _getArrVal(m1, x10, 1, tafUnit, numGender);
        }
      }
    }

    u = 0;

    if ((!((x10 == 0 && (x1 == 1 || x1 == 2)) || x == 1 || x == 2))) {
      if ((x >= 11 && x <= 99)) {
        u = 1;
      }

      if ((x >= 100 && x10 == 1 && x1 == 0)) {
        u = 2;
      }

      if ((x >= 100 && x10 != 0)) {
        u = 1;
      }

      if (((x >= 100 && x1! + x10 == 0) || (zx == 0))) {
        u = 0;
      }

      if ((x >= 3 && x <= 10)) {
        u = 2;
      }

      if ((x >= 100 && x10 == 0 && x1! > 2)) {
        u = 2;
      }

      if ((x >= 100 && x10 == 1 && x1 == 0)) {
        u = 2;
      }

      t = '$t ${_getArrVal('W', part, u, tafUnit, numGender)}';
    }

    return (t);
  }
//  --################################################################

//  --################################################################
  String _getTafqeetMulti(
      {required String am,
      required TafqeetUnit tafqeetUnit,
      String justWord = 'فقط',
      String noOtherWord = 'لاغير'}) {
    String j;
    String t;
    String amount;
    String v;

    // TYPE x_arr IS VARRAY (7) OF NUMBER NOT NULL;
    TafqeetUnit tafUnit = tafqeetUnit.copyWith(
      unit: tafqeetUnit.unit.isEmpty ? ' ' : tafqeetUnit.unit,
      unitPart: tafqeetUnit.unitPart.isEmpty ? ' ' : tafqeetUnit.unitPart,
      unitMultiple:
          tafqeetUnit.unitMultiple.isEmpty ? ' ' : tafqeetUnit.unitMultiple,
      unitPartPlural:
          tafqeetUnit.unitPartPlural.isEmpty ? ' ' : tafqeetUnit.unitPartPlural,
      unitPlural: tafqeetUnit.unitPlural.isEmpty ? ' ' : tafqeetUnit.unitPlural,
    );

    List x = [0, 0, 0, 0, 0, 0, 0, 0];

    int f = 0;
    int flag = 0;
    int p;
    String taf = '';

    if (am.isEmpty) {
      return ('');
    }

    // print('am: $am  ${am.runtimeType}  ');
    amount = am;
    // print('am: $am  Amount: $amount');

    p = amount.indexOf('.');

    // print('Founf DOT @ $p  lenght: ${amount.length}');

    switch (tafUnit.unitPartDigits) {
      case 0:
        {
          if ((p != -1)) {
            return ('!!!تجاوزت الحد الاعلى للاجزاء (0) ');
          }
          if (((amount.length)) > 18) {
            return ('!!!تجاوزت الحد الاعلى للرقم');
          }

          amount = '$amount.00';

          v = '000000000000000000.00';
          j = v.substring(0, 21 - (amount.length)) + amount;
        }
        break;

      case 2:
        {
          if ((p == -1)) {
            amount = '$amount.00';

            j = '00';
          } else if ((amount.length - p == 2)) {
            amount = '${amount}0';

            j = '00';
          } else if (((amount.length) - p) == 1) {
            amount = '${amount}00';
            j = '00';
          } else if (((amount.length)) >= 22) {
            return ('!!!تجاوزت الحد الاعلى للرقم');
          } else if (((amount.length) - p) > 3) {
            return ('!!!تجاوزت الحد الاعلى للاجزاء (0.00) ');
          }

          v = '000000000000000000.00';
          j = v.substring(0, 21 - (amount.length)) + amount;
        }
        break;

      case 3:
        {
          if ((p == -1)) {
            amount = '$amount.000';

            j = '000';
          } else if ((amount.length - p == 1)) {
            amount = '${amount}000';

            j = '000';
          } else if ((amount.length - p == 2)) {
            amount = '${amount}00';

            j = '000';
          } else if (((amount.length) - p) == 3) {
            amount = '${amount}0';
            j = '000';
          } else if (((amount.length)) >= 23) {
            return ('!!!تجاوزت الحد الاعلى للرقم');
          } else if (((amount.length) - p) > 4) {
            return ('!!!تجاوزت الحد الاعلى للاجزاء (0.00) ');
          }

          v = '000000000000000000.000';
          j = v.substring(0, 22 - (amount.length)) + amount;
        }
        break;

      default:
        {
          return ('!!! خطأ في  الحد الاعلى للاجزاء (0.00) ');
        }
    }

    //print('J: $j');

    for (int i = 0; i <= 5; i++) {
      amount = j.substring(0, 3);
      x[(7 - i)] = int.tryParse(amount);
      //print('i: $i : J: $j  amount: $amount  X: ${x[7 - i]}');
      j = j.substring(3, (j.length));
    }
    //print('fraction: J: $j  ${j.substring(2)}');
    x[1] = int.tryParse(j.substring(1));
    //print('fraction: ${x[1]}');

    if ((x[7] > 0)) {
      t = _spellNum('MX', x[7], 6, x[6] + x[5] + x[4] + x[3] + x[2], tafUnit);
      taf = taf + t;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((x[6] > 0)) {
      t = _spellNum('MX', x[6], 5, x[5] + x[4] + x[3] + x[2], tafUnit);
      if ((f == 1)) {
        taf = '$taf و';
      }
      taf = taf + t;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((x[5] > 0)) {
      t = _spellNum('MX', x[5], 4, x[4] + x[3] + x[2], tafUnit);

      if ((f == 1)) {
        taf = '$taf و';
      }

      taf = taf + t;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((x[4] > 0)) {
      t = _spellNum('MX', x[4], 3, x[3] + x[2], tafUnit);

      if ((f == 1)) {
        taf = '$taf و';
      }

      taf = taf + t;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((x[3] > 0)) {
      t = _spellNum('MX', x[3], 2, x[2], tafUnit);

      if ((f == 1)) {
        taf = '$taf و';
      }

      taf = taf + t;
      flag = 1;
      f = 1;
    } else {
      flag = 0;
    }

    if ((x[2] > 0)) {
      t = _spellNum('MY', x[2], 1, 0, tafUnit);

      if ((f == 1)) {
        taf = '$taf و';
      }

      taf = taf + t;
      //!Need fervication
      flag = 1;
      //!NEED Verfiation
      f = 1;
    } else if (f == 1) {
      taf = '$taf  ${tafUnit.unit}';
    }
    if (f == 1) {
      taf = _getCountryUnit(x[2], taf, tafUnit.country, tafUnit.unitGender);
    }
    if ((x[1] > 0)) {
      t = _spellNum('MX', x[1], 0, 0, tafUnit,
          unitPartGender: tafUnit.unitPartGender);

      if ((f == 1)) {
        taf = '$taf و';
      }

      taf = taf + t;
      flag = 1;
      f = 1;
    }

    //print(' $am : ${double.tryParse(am)}');
    if ((double.tryParse(am) == 0)) {
      taf = 'صفر ${tafUnit.unit}';
    }

    if (x[7] + x[6] + x[5] + x[4] + x[3] + x[2] == 0) {
      taf = _getCountryUnit(x[1], taf, tafUnit.country, tafUnit.unitPartGender);
    }
    taf = '$justWord $taf $noOtherWord';

    return (taf.replaceAll('  ', ' ').replaceAll('  ', ' '));
  }

// ==========
// TODO  change tom gender masculine and feminine
  String _getCountryUnit(var amount, String taf, String tafUnitCountry,
      TafqeetGender tafUnitGender) {
    if (tafUnitCountry.isEmpty) return taf;

    switch (tafUnitGender) {
      case TafqeetGender.feminine:
        if (amount >= 3 && amount <= 10) {
          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? tafUnitCountry : '${tafUnitCountry}ة'))}';
        } else if (amount > 10) {
          //   taf = '$taf ${tafUnit.country}اً';
          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? '${tafUnitCountry.substring(0, tafUnitCountry.length - 1)}ةً' : '${tafUnitCountry}ةً'))}';
        } else if (amount == 2) {
          //taf =  '$taf ${tafUnit.country}';

          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? '${tafUnitCountry.substring(0, tafUnitCountry.length - 1)}تان' : '${tafUnitCountry}تان'))}';
        } else if (amount == 1) {
          //taf =  '$taf ${tafUnit.country}';
          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? '${tafUnitCountry}' : '${tafUnitCountry}ة'))}';
        } else {
          taf = '$taf ${tafUnitCountry}';
        }
        break;
      case TafqeetGender.masculine:
        if (amount >= 3 && amount <= 10) {
          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? tafUnitCountry : '${tafUnitCountry}ة'))}';
        } else if (amount > 10) {
          //   taf = '$taf ${tafUnit.country}اً';
          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? '${tafUnitCountry.substring(0, tafUnitCountry.length - 1)}اً' : '${tafUnitCountry}اً'))}';
        } else if (amount == 2) {
          //taf =  '$taf ${tafUnit.country}';

          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? '${tafUnitCountry.substring(0, tafUnitCountry.length - 1)}ان' : '${tafUnitCountry}ان'))}';
        } else if (amount == 1) {
          //taf =  '$taf ${tafUnit.country}';
          taf =
              '$taf ${((tafUnitCountry.substring(tafUnitCountry.length - 1) == 'ة' ? '${tafUnitCountry.substring(0, tafUnitCountry.length - 1)}' : '${tafUnitCountry}'))}';
        } else {
          taf = '$taf ${tafUnitCountry}';
        }
    }
    return taf;
  }
}
