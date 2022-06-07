import 'dart:ffi';
import 'dart:typed_data';

//import 'package:tafqeet/tafqeet.dart';

import 'package:tafqeet/tafqeet.dart';

import 'model/tafqeet_unit.dart';

/// Checks if you are awesome. Spoiler: you are.

class TafqeetMulti {
  String _am;
  TafqeetUnit _tafUnit;
  //String gender;

  TafqeetMulti(this._am, this._tafUnit);

  set amount(String newAmount) {
    _am = newAmount;
  }

  set unit(TafqeetUnit newunit) {
    _tafUnit = newunit;
  }

  String get amount {
    return (_am);
    // return ('$amount  فقط لاغير');
  }

  String get tafqeet {
    return (getTafqeetMulti(_am, _tafUnit));
    // return ('$amount  فقط لاغير');
  }
}

//  --################################################################
String getArrVal(
    String arr, var pR, var pC, TafqeetUnit tafUnit, Gender numGender) {
  List<String> mx = [
    ' ',
    ' ',
    ' ',
    ' ',
    //'واحد',
    (numGender == Gender.female ? 'احدى' : 'واحد'),
    ' عشر',
    'مئة',
    'اثنان',
    'عشرون',
    'مئتان',
    //'ثلاثة',
    (numGender == Gender.female ? 'ثلاث' : 'ثلاثة'),

    'ثلاثون',
    'ثلاثمائة',
    //'اربعة',
    (numGender == Gender.female ? 'اربع' : 'اربعة'),

    'اربعون',
    'اربعمائة',
    //'خمسة',
    (numGender == Gender.female ? 'خمس' : 'خمسة'),

    'خمسون',
    'خمسمائة',
    //'ستة',
    (numGender == Gender.female ? 'ست' : 'ستة'),

    'ستون',
    'ستمائة',
    //'سبعة',
    (numGender == Gender.female ? 'سبع' : 'سبعة'),

    'سبعون',
    'سبعمائة',
    //'ثمانية',
    (numGender == Gender.female ? 'ثماني' : 'ثمانية'),

    'ثمانون',
    'ثمانمائة',
    //'تسعة',
    (numGender == Gender.female ? 'تسع' : 'تسعة'),

    'تسعون',
    'تسعمائة'
  ];
  List<String> my = [
    ' ',
    ' ',
    ' ',
    ' ',
    //'احدى',
    (numGender == Gender.female ? 'احدى' : 'واحد'),
    ' عشرة',
    'مئة',
    //'اثنتان',
    (numGender == Gender.female ? 'اثنتان' : 'إثنان'),

    'عشرون',
    'مئتان',
    //'ثلاث',
    (numGender == Gender.female ? 'ثلاث' : 'ثلاثة'),

    'ثلاثون',
    'ثلاثمائة',
    //'اربع',
    (numGender == Gender.female ? 'اربع' : 'اربعة'),

    'اربعون',
    'اربعمائة',
    //'خمس',
    (numGender == Gender.female ? 'خمس' : 'خمسة'),

    'خمسون',
    'خمسمائة',
    //'ست',
    (numGender == Gender.female ? 'ست' : 'ستة'),

    'ستون',
    'ستمائة',
    //'سبع',
    (numGender == Gender.female ? 'سبع' : 'سبعة'),

    'سبعون',
    'سبعمائة',
    //'ثماني',
    (numGender == Gender.female ? 'ثماني' : 'ثمانية'),

    'ثمانون',
    'ثمانمائة',
    //'تسع',
    (numGender == Gender.female ? 'تسع' : 'تسعة'),

    'تسعون',
    'تسعمائة'
  ];
  List<String> w = [
    ' ',
    //'قرشاً',
    // TODO add اً  to the end of unit
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
    '${tafUnit.unitPart} ${numGender == Gender.female ? 'واحدة' : 'واحد'}',
//    'قرشان',
    (tafUnit.unitPartMultiple),
//    'قرشان',
    (tafUnit.unitPartMultiple),
    //'ليرة واحدة',

    '${((tafUnit.unit.substring(tafUnit.unit.length - 1) == 'ة' ? '${tafUnit.unit.substring(0, tafUnit.unit.length - 1)}ةً' : '${tafUnit.unit}اً'))}${numGender == Gender.female ? ' واحدة' : ' واحداً'}',
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
String spellNum(String m1, var x, var part, var zx, TafqeetUnit tafUnit,
    {Gender? unitPartGender}) {
  Gender numGender = (unitPartGender ?? tafUnit.unitGender);
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
    t = getArrVal('A', part, 0, tafUnit, numGender);
  } else if (x == 2) {
    if ((zx == 0)) {
      t = getArrVal('A', part, 2, tafUnit, numGender);
    } else {
      t = getArrVal('A', part, 1, tafUnit, numGender);
    }
  } else if (x == 10) {
    if (getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
      t = 'عشر';
    } else {
      t = 'عشرة';
    }
  } else if (x == 11) {
    if (getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
      t = 'احدى عشرة';
    } else {
      t = 'احد عشر';
    }
  } else if (x == 12) {
    if (getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
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
        t = getArrVal(m1, x100, 2, tafUnit, numGender) +
            w1 +
            getArrVal('A', part, (x1! - 1), tafUnit, numGender) +
            w2 +
            getArrVal(m1, x10, 1, tafUnit, numGender);
      } else if ((x10 == 1 && (x1 == 1 || x1 == 2 || x1 == 0))) {
        if (x1 == 1) {
          if (getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
            t = '${getArrVal(m1, x100, 2, tafUnit, numGender)} واحدى عشرة';
          } else {
            t = '${getArrVal(m1, x100, 2, tafUnit, numGender)} واحد عشر';
          }
        } else if (x1 == 2) {
          if (getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
            t = '${getArrVal(m1, x100, 2, tafUnit, numGender)} واثنتا عشرة';
          } else {
            t = '${getArrVal(m1, x100, 2, tafUnit, numGender)} واثنا عشر';
          }
        } else if (x1 == 0) {
          if ((x10 == 1 && x1 == 0)) {
            if (getArrVal(m1, 1, 0, tafUnit, numGender) == 'احدى') {
              t = '${getArrVal(m1, x100, 2, tafUnit, numGender)} وعشر';
            } else {
              t = '${getArrVal(m1, x100, 2, tafUnit, numGender)} وعشرة';
            }
          }
        }
      } else {
        t = getArrVal(m1, x100, 2, tafUnit, numGender) +
            w1 +
            getArrVal(m1, x1, 0, tafUnit, numGender) +
            w2 +
            getArrVal(m1, x10, 1, tafUnit, numGender);
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

    t = '$t ${getArrVal('W', part, u, tafUnit, numGender)}';
  }

  return (t);
}
//  --################################################################

//  --################################################################
String getTafqeetMulti(String am, TafqeetUnit tafUnit) {
  String j;
  String t;
  String amount;
  String v;

  // TYPE x_arr IS VARRAY (7) OF NUMBER NOT NULL;

  List x = [0, 0, 0, 0, 0, 0, 0, 0];

  int flag = 0;
  int f = 0;

  int p;
  String taf = '';

  if (am.isEmpty) {
    return ('');
  }

  //print('am: $am  ${am.runtimeType}  ');
  amount = am;
  //print('am: $am  Amount: $amount');

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
    t = spellNum('MX', x[7], 6, x[6] + x[5] + x[4] + x[3] + x[2], tafUnit);
    taf = taf + t;
    flag = 1;
    f = 1;
  } else {
    flag = 0;
  }

  if ((x[6] > 0)) {
    t = spellNum('MX', x[6], 5, x[5] + x[4] + x[3] + x[2], tafUnit);
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
    t = spellNum('MX', x[5], 4, x[4] + x[3] + x[2], tafUnit);

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
    t = spellNum('MX', x[4], 3, x[3] + x[2], tafUnit);

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
    t = spellNum('MX', x[3], 2, x[2], tafUnit);

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
    t = spellNum('MY', x[2], 1, 0, tafUnit);

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
    taf = getCountryUnit(x[2], taf, tafUnit.country, tafUnit.unitGender);
  }
  if ((x[1] > 0)) {
    t = spellNum('MX', x[1], 0, 0, tafUnit,
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
    taf = getCountryUnit(x[1], taf, tafUnit.country, tafUnit.unitPartGender);
  }
  taf = 'فقط $taf لاغير';

  return (taf.replaceAll('  ', ' ').replaceAll('  ', ' '));
}

// ==========
// TODO  change tom gender male and female
String getCountryUnit(
    var amount, String taf, String tafUnitCountry, Gender tafUnitGender) {
  if (tafUnitCountry.isEmpty) return taf;

  switch (tafUnitGender) {
    case Gender.female:
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
    case Gender.male:
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
