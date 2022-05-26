// TODO: Put public facing types in this file.

import 'dart:ffi';
import 'dart:typed_data';

/// Checks if you are awesome. Spoiler: you are.
class Awesome {
  bool get isAwesome => true;
}

class Tafqeet {
  var amount = 0;

  String get tafqeet {
    return (getTafqeet('123456789123456789.11'));
    // return ('$amount  فقط لاغير');
  }
}

//  --################################################################
String get_arr_val(String arr, var pR, var pC) {
  List<String> mx = [
    ' ',
    ' ',
    ' ',
    ' ',
    'واحد',
    'عشر',
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
    'قرشاً',
    'قرشاً',
    'قروش',
    'ليرة',
    'ليرة',
    'ليرات',
    'الف',
    'الفاً',
    'الاف',
    'مليون',
    'مليوناً',
    'ملايين',
    'مليار',
    'ملياراً',
    'مليارات',
    'بليون',
    'بليوناً',
    'بلايين',
    'ترليون',
    'ترليوناً',
    'ترليونات'
  ];
  List<String> a = [
    ' ',
    'قرش واحد',
    'قرشان',
    'قرشان',
    'ليرة واحدة',
    'ليرتان',
    'ليرتان',
    'الف',
    'الفان',
    'الفا',
    'مليون',
    'مليونان',
    'مليونا',
    'مليار',
    'ملياران',
    'مليارا',
    'بليون',
    'بليونان',
    'بليونا',
    'ترليون',
    'ترليونان',
    'ترليونا'
  ];
  print('$arr[$pR * 3 + $pC + 1]');
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
String spellnum(String m1, var x, var part, var zx) {
  int? x100 = 0;
  int? x10 = 0;

  int? x1 = 0;
  var u = 0;
  String w1;
  String w2;
  String t = '';

  w1 = '';
  w2 = '';
  print('X: $x');
  x100 = int.tryParse((x / 100).truncate().toString());
  x10 = int.tryParse(((x - (x100! * 100)) / 10).truncate().toString());
  x1 = int.tryParse(((x - x100 * 100 - x10! * 10)).truncate().toString());

  print('X: $x  X100: $x100  X10:  $x10 X1:  $x1 ');
  if (x == 0) {
    t = '';
    return (t);
  } else if (x == 1) {
    t = get_arr_val('A', part, 0);
  } else if (x == 2) {
    if ((zx == 0)) {
      t = get_arr_val('A', part, 2);
    } else {
      t = get_arr_val('A', part, 1);
    }
  } else if (x == 10) {
    if (get_arr_val(m1, 1, 0) == 'احدى') {
      t = 'عشر';
    } else {
      t = 'عشرة';
    }
  } else if (x == 11) {
    if (get_arr_val(m1, 1, 0) == 'احدى') {
      t = 'احدى عشرة';
    } else {
      t = 'احد عشر';
    }
  } else if (x == 12) {
    if (get_arr_val(m1, 1, 0) == 'احدى') {
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
        t = get_arr_val(m1, x100, 2) +
            w1 +
            get_arr_val('A', part, (x1! - 1)) +
            w2 +
            get_arr_val(m1, x10, 1);
      } else if ((x10 == 1 && (x1 == 1 || x1 == 2 || x1 == 0))) {
        if (x1 == 1) {
          if (get_arr_val(m1, 1, 0) == 'احدى') {
            t = '${get_arr_val(m1, x100, 2)} واحدى عشرة';
          } else {
            t = '${get_arr_val(m1, x100, 2)} واحد عشر';
          }
        } else if (x1 == 2) {
          if (get_arr_val(m1, 1, 0) == 'احدى') {
            t = '${get_arr_val(m1, x100, 2)} واثنتا عشرة';
          } else {
            t = '${get_arr_val(m1, x100, 2)} واثنا عشر';
          }
        } else if (x1 == 0) {
          if ((x10 == 1 && x1 == 0)) {
            if (get_arr_val(m1, 1, 0) == 'احدى') {
              t = '${get_arr_val(m1, x100, 2)} وعشر';
            } else {
              t = '${get_arr_val(m1, x100, 2)} وعشرة';
            }
          }
        }
      } else {
        t = get_arr_val(m1, x100, 2) +
            w1 +
            get_arr_val(m1, x1, 0) +
            w2 +
            get_arr_val(m1, x10, 1);
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

    t = '$t ${get_arr_val('W', part, u)}';
  }

  return (t);
}
//  --################################################################

//  --################################################################
String getTafqeet(String am) {
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

  print('am: $am  ${am.runtimeType}  ');
  amount = am;
  print('am: $am  Amount: $amount');

  p = amount.indexOf('.');

  print('Founf DOT @ $p  lenght: ${amount.length}');

  if ((p == -1)) {
    amount = '$amount.00';

    j = '00';
  }
  if ((amount.length - p == 2)) {
    amount = '${amount}0';

    j = '00';
  }

  if (((amount.length) - p) == 1) {
    amount = '${amount}0';
  }

  v = '000000000000000000.00';
  j = v.substring(0, 21 - (amount.length)) + amount;
  print('J: $j');

  for (int i = 0; i <= 5; i++) {
    amount = j.substring(0, 3);
    x[(7 - i)] = int.tryParse(amount);
    print('i: $i : J: $j  amount: $amount  X: ${x[7 - i]}');
    j = j.substring(3, (j.length));
  }
  print('fraction: J: $j  ${j.substring(2)}');
  x[1] = int.tryParse(j.substring(1));
  print('fraction: ${x[1]}');

  for (int i = 7; i >= 0; i--) {
    print('i: $i  X: ${x[i]}');
  }

  if ((x[7] > 0)) {
    t = spellnum('MX', x[7], 6, x[6] + x[5] + x[4] + x[3] + x[2]);
    taf = taf + t;
    flag = 1;
    f = 1;
  } else {
    flag = 0;
  }

  if ((x[6] > 0)) {
    t = spellnum('MX', x[6], 5, x[5] + x[4] + x[3] + x[2]);
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
    t = spellnum('MX', x[5], 4, x[4] + x[3] + x[2]);

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
    t = spellnum('MX', x[4], 3, x[3] + x[2]);

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
    t = spellnum('MX', x[3], 2, x[2]);

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
    t = spellnum('MY', x[2], 1, 0);

    if ((f == 1)) {
      taf = '$taf و';
    }

    taf = taf + t;
    //!Need fervication
    flag = 1;
    //!NEED Verfiation
    f = 1;
  } else if (f == 1) {
    taf = '$taf ليرة';
  }

  if ((x[1] > 0)) {
    t = spellnum('MX', x[1], 0, 0);

    if ((f == 1)) {
      taf = '$taf و';
    }

    taf = taf + t;
    flag = 1;
    f = 1;
  }

  if ((am == 0)) {
    taf = 'صفر ليرة';
  }

  taf = 'فقط $taf سورية لاغير';

  return (taf);
}
// ==========

//--################################################################

String getTafqeetFc(var am, String currency) {
  String ts;
  String j;
  String t;
  String amount;
  String v;

  //TYPE x_arr IS VARRAY [7] OF NUMBER NOT NULL;

  List x = [0, 0, 0, 0, 0, 0, 0];
  int f = 0;
  int p;
  String taf = '';

  if (am == null || am == 0) return ('');
//     amount := TO_CHAR (TRUNC (ABS(am), 2));

  amount = (((am.abs()).truncate[2])).toString();

  //p := INSTR (amount, '.');
  p = amount.indexOf('.');

  if (p == 0) {
    amount = '$amount.00';
    j = '00';
  }

  if (((amount.length) - p) == 1) amount = '${amount}0';

  v = '000000000000000000.00';
  // j = SUBSTR (v, 1, 21 - LENGTH (amount)) || amount;

  j = v.substring(1, 21 - (amount.length)) + amount;

  for (int i = 0; i <= 5; i++) {
    amount = j.substring(1, 3);
    j = j.substring(4, (j.length));
    x[7 - i] = int.tryParse(amount);
  }

  x[1] = int.tryParse(j.substring(2));

  if (x[7] > 0) {
    t = spellnum('MX', x[7], 6, x[6] + x[5] + x[4] + x[3] + x[2]);
    taf = taf + t;
    f = 1;
  } else {}

  if (x[6] > 0) {
    t = spellnum('MX', x[6], 5, x[5] + x[4] + x[3] + x[2]);
    if (f == 1) taf = '$taf و';

    taf = taf + t;
    f = 1;
  } else {}

  if (x[5] > 0) {
    t = spellnum('MX', x[5], 4, x[4] + x[3] + x[2]);

    if (f == 1) {
      taf = '$taf و';
    }

    taf = taf + t;

    f = 1;
  } else {}

  if (x[4] > 0) {
    t = spellnum('MX', x[4], 3, x[3] + x[2]);

    if (f == 1) {
      taf = '$taf و';
    }

    taf = taf + t;
    f = 1;
  } else {}

  if (x[3] > 0) {
    t = spellnum('MX', x[3], 2, x[2]);

    if (f == 1) {
      taf = '$taf و';
    }

    taf = taf + t;

    f = 1;
  } else {}

  if (x[2] > 0) {
    t = spellnum('MY', x[2], 1, 0);

    if (f == 1) {
      taf = '$taf و';
    }

    taf = taf + t;
    f = 1;
  } else if (f == 1) {
    taf = '$taf ';
  }

  if (x[1] > 0) {
    t = spellnum('MX', x[1], 0, 0);

    if (f == 1) {
      taf = '$taf و';
    }

    taf = taf + t;
    f = 1;
  }

  if (am == 0) {
    taf = 'صفر ';
  }

  taf = '($currency)  فقط $taf لاغير';
  return (taf);
}
