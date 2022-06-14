import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/src/model/utility.dart';
import 'package:tafqeet/tafqeet.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    //final awesome = Awesome();

    setUp(() {
      // Additional setup goes here.
    });

    test('splitUnitValue Test', () {
      expect(splitUnitValue(1111.33), [1, 1111, 0.33]);
      expect(splitUnitValue(0), [1, 0]);
      expect(splitUnitValue(-1111.03), [-1, 1111, 0.03]);
      expect(splitUnitValue(1), [1, 1]);
      expect(splitUnitValue(0.9), [1, 0, 0.9]);
      expect(splitUnitValue(0.004), [1, 0, 0.004]);
      expect(splitUnitValue(-1), [-1, 1]);
      expect(splitUnitValue(0.6), [1, 0, 0.6]);
      expect(splitUnitValue(99.089), [1, 99, 0.089]);
      expect(splitUnitValue(123456789012004), [1, 123456789012004]);
    });

    test(
      'tafqeetNumberWithParts Test',
      () {
        var tafqeet = Tafqeet();

        expect(
            tafqeet.tafqeetNumberWithParts(
                listOfNumberAndParts: [2, 62],
                tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal),
            'فقط ريالان سعوديان واثنتان وستون هللةً لاغير');
        expect(
            tafqeet.tafqeetNumberWithParts(
                listOfNumberAndParts: [0, 62],
                tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal),
            'فقط اثنتان وستون هللةً سعوديةً لاغير');
        expect(
            tafqeet.tafqeetNumberWithParts(
                listOfNumberAndParts: [0.9, 62],
                tafqeetUnitCode: TafqeetUnitCode.saudiArabianRiyal,
                tryTafqeet: true),
            null);

        expect(
            tafqeet.tafqeetNumberWithParts(
                listOfNumberAndParts: [23, 2, 59],
                tafqeetUnitCode: TafqeetUnitCode.hour),
            'فقط ثلاث وعشرون ساعةً ودقيقتان وتسع وخمسون ثانيةً لاغير');
      },
    );

    test(
      'tafqeetNumberWithParts User defiend "justWord" and "noOtherWord" Test',
      () {
        var tafqeet = Tafqeet();
        expect(
            tafqeet.tafqeetNumberWithParts(
                listOfNumberAndParts: [23, 2, 59],
                tafqeetUnitCode: TafqeetUnitCode.hour),
            'فقط ثلاث وعشرون ساعةً ودقيقتان وتسع وخمسون ثانيةً لاغير');

        expect(
            tafqeet.tafqeetNumberWithParts(
              listOfNumberAndParts: [23, 2, 59],
              tafqeetUnitCode: TafqeetUnitCode.hour,
              justWord: 'الوقت المتوقع هو:',
              noOtherWord: 'بدأً من ساعة الصفر',
            ),
            'الوقت المتوقع هو: ثلاث وعشرون ساعةً ودقيقتان وتسع وخمسون ثانيةً بدأً من ساعة الصفر');
      },
    );

    test('tafqeetByUserDefinedUnit Test', () {
      var tafqeet = Tafqeet();
      var number1 = 234234;
      var aPotunit = {
        'unit': 'طنجرة',
        'unitPlural': 'طناجر',
        'unitGender': TafqeetUnitGender.feminine
      };

      expect(
          tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
            {number1: aPotunit}
          ]),
          'فقط مئتان واربعة وثلاثون الفاً ومئتان واربع وثلاثون طنجرةً لاغير');

      var boxesNumber = 234234;
      var unitBoxes = {
        'unit': 'صندوق',
        'unitPlural': 'صناديق',
        'unitGender': TafqeetUnitGender.masculine,
      };

      var partsNumber = 11;

      var partsUnit = {
        'unit': 'قطعة',
        'unitPlural': 'قطع',
        'unitMaxValue': 12,
        'unitGender': TafqeetUnitGender.feminine,
      };

      expect(
          tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
            {boxesNumber: unitBoxes},
            {partsNumber: partsUnit}
          ]),
          'فقط مئتان واربعة وثلاثون الفاً ومئتان واربعة وثلاثون صندوقاً واحدى عشرة قطعةً لاغير');

      expect(
          tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
            {boxesNumber: null},
            {partsNumber: null}
          ]),
          'فقط مئتان واربعة وثلاثون الفاً ومئتان واربعة وثلاثون قلماً واحد عشر جزءاً لاغير');
      var mellonUnit = {
        'unit': 'بطيخة',
        'unitPlural': 'بطيخات',
        'unitGender': TafqeetUnitGender.feminine,
      };

      expect(
          tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
            {1: mellonUnit}
          ]),
          'فقط بطيخةً واحدة لاغير');

      expect(
          tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
            {2: mellonUnit}
          ]),
          'فقط بطيختان لاغير');

      expect(
          tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
            {3: mellonUnit}
          ]),
          'فقط ثلاث بطيخات لاغير');

      // بات تايلدندي - ساتانغ 100
      var batUnit = {
        'country': 'تايلندي',
        'unit': 'بات',
        'unitPlural': 'باتات',
        'unitGender': TafqeetUnitGender.masculine,
      };
      var batPennyUnit = {
        'country': 'تايلندي',
        'unit': 'ساتانغ',
        'unitPlural': 'ساتانغات',
        'unitMaxValue': 100,
        'unitGender': TafqeetUnitGender.masculine,
      };

      expect(
          tafqeet.tafqeetByUserDefinedUnit(listOfNumberAndParts: [
            {3: batUnit},
            {11: batPennyUnit}
          ]),
          'فقط ثلاثة باتات تايلندية واحد عشر ساتانغاً لاغير');
    });
  });
}
