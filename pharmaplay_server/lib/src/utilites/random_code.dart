import 'dart:math';

abstract class RandomCode {
  static Random rnd = Random();
  static Random rnd2 = Random(DateTime.now().millisecondsSinceEpoch);

  static int _min = 99, _max = 999;

  static String ranodmCode() => '${(_min + rnd.nextInt(_max - _min))}';

  static String nextInter() =>
      '${(_min + rnd2.nextInt(_max - _min))}-${(_min + rnd2.nextInt(_max - _min))}';
}
