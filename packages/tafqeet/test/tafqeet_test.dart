import 'package:tafqeet/tafqeet.dart';
import 'package:test/test.dart';

void main() {
  TafqeetSyr taf = TafqeetSyr('11.4');
  print(taf.tafqeet);

  group('A group of tests', () {
    //final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      // expect(awesome.isAwesome, isTrue);
    });
  });
}
