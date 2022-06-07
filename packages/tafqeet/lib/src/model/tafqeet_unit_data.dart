import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/src/model/unit_code.dart';

//====

TafqeetUnit unitOnce = TafqeetUnit(
    country: '',
    unit: 'أونصة',
    unitPlural: 'أونصات',
    unitPartDigits: 0,
    unitPart: '',
    unitPartPlural: '',
    unitGender: Gender.female,
    unitPartGender: Gender.female,
    unitCode: UnitCode.ounce);

TafqeetUnit unitKM = TafqeetUnit(
    country: '',
    unit: 'كيلو متر',
    unitPlural: 'كيلو مترات',
    unitPartDigits: 3,
    unitPart: 'متر',
    unitPartPlural: 'مترات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.kiloMetre);

TafqeetUnit unitHR = TafqeetUnit(
    country: '',
    unit: 'ساعة',
    unitPlural: 'ساعات',
    unitPartDigits: 2,
    unitPart: 'دقيقة',
    unitPartPlural: 'دقائق',
    unitGender: Gender.female,
    unitPartGender: Gender.female,
    unitCode: UnitCode.hour);

TafqeetUnit unitM = TafqeetUnit(
    country: '',
    unit: 'متر',
    unitPlural: 'أمتار',
    unitPartDigits: 2,
    unitPart: 'سنتميتر',
    unitPartPlural: 'سنتيمترات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.metre);

TafqeetUnit unitUsa = TafqeetUnit(
    country: 'أميريكي',
    unit: 'دولار',
    unitPlural: 'دولارات',
    unitPartDigits: 2,
    unitPart: 'سنت',
    unitPartPlural: 'سنتات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.unitedStatesDollar);

TafqeetUnit unitSA = TafqeetUnit(
    country: 'سعودي',
    unit: 'ريال',
    unitPlural: 'ريالات',
    unitPartDigits: 2,
    unitPart: 'هللة',
    unitPartPlural: 'هللات',
    unitGender: Gender.male,
    unitPartGender: Gender.female,
    unitCode: UnitCode.saudiArabianRiyal);

TafqeetUnit unitSY = TafqeetUnit(
    country: 'سورية',
    unit: 'ليرة',
    unitPlural: 'ليرات',
    unitPartDigits: 2,
    unitPart: 'قرش',
    unitPartPlural: 'قروش',
    unitGender: Gender.female,
    unitPartGender: Gender.male,
    unitCode: UnitCode.syrianPound);

TafqeetUnit unitund = TafqeetUnit(
    country: '',
    unit: 'قطعة',
    unitPlural: 'قطع',
    unitPartDigits: 2,
    unitPart: 'جزء',
    unitPartPlural: 'أجزاء',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.undefined);

TafqeetUnit unitDK = TafqeetUnit(
    country: 'كويتي',
    unit: 'دينار',
    unitPlural: 'دنانير',
    unitPartDigits: 3,
    unitPart: 'فلس',
    unitPartPlural: 'فلوس',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.kuwaitiDinar);

TafqeetUnit unitKG = TafqeetUnit(
    country: '',
    unit: 'كيلو غرام',
    unitPlural: 'كيلو غرامات',
    unitPartDigits: 3,
    unitPart: 'غرام',
    unitPartPlural: 'غرامات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.kiloGram);
