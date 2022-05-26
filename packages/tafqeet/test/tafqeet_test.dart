import 'package:tafqeet/tafqeet.dart';
import 'package:test/test.dart';

void main() {
  Tafqeet taf = Tafqeet();
  print(Tafqeet().tafqeet);

  group('A group of tests', () {
    final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
