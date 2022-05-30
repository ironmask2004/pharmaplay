import 'dart:ffi';
import 'dart:typed_data';

import 'package:tafqeet/tafqeet.dart';

/// Checks if you are awesome. Spoiler: you are.

class TafqeetMulti {
  String am;
  TafqeetCurrency curr;
  //String gender;

  TafqeetMulti(this.am, this.curr);

  set amount(String newAmount) {
    am = newAmount;
  }

  set currency(TafqeetCurrency newcurrency) {
    curr = newcurrency;
  }

  String get tafqeet {
    return (getTafqeetMulti(am, curr));
    // return ('$amount  فقط لاغير');
  }
}

//  --################################################################
String getArrVal(
  String arr,
  var pR,
  var pC,
  TafqeetCurrency currency,
) {
  List<String> mx = [
    ' ',
    ' ',
    ' ',
    ' ',
    //'واحد',
    (currency.gender == 'F' ? 'احدى' : 'واحد'),
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
  List<String> my = [
    ' ',
    ' ',
    ' ',
    ' ',
    'احدى',
    ' عشرة',
    'مئة',
    'اثنتان',
    'عشرون',
    'مئتان',
    'ثلاث',
    'ثلاثون',
    'ثلاثمائة',
    'اربع',
    'اربعون',
    'اربعمائة',
    'خمس',
    'خمسون',
    'خمسمائة',
    'ست',
    'ستون',
    'ستمائة',
    'سبع',
    'سبعون',
    'سبعمائة',
    'ثماني',
    'ثمانون',
    'ثمانمائة',
    'تسع',
    'تسعون',
    'تسعمائة'
  ];
  List<String> w = [
    ' ',
    //'قرشاً',
    (currency.currencyFrc),
    //'قرشاً',
    (currency.currencyFrc),
    // 'قروش',
    (currency.currencyFrcPlural),
    //'ليرة',
    currency.currency,
    //'ليرة',
    currency.currency,
    //'ليرات',
    (currency.currencyPlural),
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
    '${currency.currencyFrc} ${currency.gender == 'F' ? 'واحدة' : 'واحد'}',
//    'قرشان',
    (currency.currencyFrcMultiple),
//    'قرشان',
    (currency.currencyFrcMultiple),
    //'ليرة واحدة',
    '${currency.currency}${currency.gender == 'F' ? 'واحدة' : 'واحداً'}',
    //'ليرتان',
    (currency.currencyMultiple),
    //'ليرتان',
    (currency.currencyMultiple),
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
String spellNum(String m1, var x, var part, var zx, TafqeetCurrency currency) {
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
    t = getArrVal('A', part, 0, currency);
  } else if (x == 2) {
    if ((zx == 0)) {
      t = getArrVal('A', part, 2, currency);
    } else {
      t = getArrVal('A', part, 1, currency);
    }
  } else if (x == 10) {
    if (getArrVal(m1, 1, 0, currency) == 'احدى') {
      t = 'عشر';
    } else {
      t = 'عشرة';
    }
  } else if (x == 11) {
    if (getArrVal(m1, 1, 0, currency) == 'احدى') {
      t = 'احدى عشرة';
    } else {
      t = 'احد عشر';
    }
  } else if (x == 12) {
    if (getArrVal(m1, 1, 0, currency) == 'احدى') {
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
        t = getArrVal(m1, x100, 2, currency) +
            w1 +
            getArrVal('A', part, (x1! - 1), currency) +
            w2 +
            getArrVal(m1, x10, 1, currency);
      } else if ((x10 == 1 && (x1 == 1 || x1 == 2 || x1 == 0))) {
        if (x1 == 1) {
          if (getArrVal(m1, 1, 0, currency) == 'احدى') {
            t = '${getArrVal(m1, x100, 2, currency)} واحدى عشرة';
          } else {
            t = '${getArrVal(m1, x100, 2, currency)} واحد عشر';
          }
        } else if (x1 == 2) {
          if (getArrVal(m1, 1, 0, currency) == 'احدى') {
            t = '${getArrVal(m1, x100, 2, currency)} واثنتا عشرة';
          } else {
            t = '${getArrVal(m1, x100, 2, currency)} واثنا عشر';
          }
        } else if (x1 == 0) {
          if ((x10 == 1 && x1 == 0)) {
            if (getArrVal(m1, 1, 0, currency) == 'احدى') {
              t = '${getArrVal(m1, x100, 2, currency)} وعشر';
            } else {
              t = '${getArrVal(m1, x100, 2, currency)} وعشرة';
            }
          }
        }
      } else {
        t = getArrVal(m1, x100, 2, currency) +
            w1 +
            getArrVal(m1, x1, 0, currency) +
            w2 +
            getArrVal(m1, x10, 1, currency);
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

    t = '$t ${getArrVal('W', part, u, currency)}';
  }

  return (t);
}
//  --################################################################

//  --################################################################
String getTafqeetMulti(String am, TafqeetCurrency currency) {
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
    t = spellNum('MX', x[7], 6, x[6] + x[5] + x[4] + x[3] + x[2], currency);
    taf = taf + t;
    flag = 1;
    f = 1;
  } else {
    flag = 0;
  }

  if ((x[6] > 0)) {
    t = spellNum('MX', x[6], 5, x[5] + x[4] + x[3] + x[2], currency);
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
    t = spellNum('MX', x[5], 4, x[4] + x[3] + x[2], currency);

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
    t = spellNum('MX', x[4], 3, x[3] + x[2], currency);

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
    t = spellNum('MX', x[3], 2, x[2], currency);

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
    t = spellNum('MY', x[2], 1, 0, currency);

    if ((f == 1)) {
      taf = '$taf و';
    }

    taf = taf + t;
    //!Need fervication
    flag = 1;
    //!NEED Verfiation
    f = 1;
  } else if (f == 1) {
    taf = '$taf  ${currency.currency}';
  }

  //print('flag: $flag f: $f ');
  if (f == 1) taf = '$taf ${currency.country}';

  if ((x[1] > 0)) {
    t = spellNum('MX', x[1], 0, 0, currency);

    if ((f == 1)) {
      taf = '$taf و';
    }

    taf = taf + t;
    flag = 1;
    f = 1;
  }

  //print(' $am : ${double.tryParse(am)}');
  if ((double.tryParse(am) == 0)) {
    taf = 'صفر  ${currency.currency}  ${currency.country}';
  }

  taf = 'فقط $taf  لاغير';

  return (taf);
}
// ==========

