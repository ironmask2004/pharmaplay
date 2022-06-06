import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/src/model/unit_code.dart';

TafqeetUnit unitUsa = TafqeetUnit(
    country: 'أميريكياً',
    unit: 'دولاراً',
    unitPlural: 'دولارات',
    unitPartDigits: 2,
    unitPart: 'سنت',
    unitPartPlural: 'سنتات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

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
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitKM = TafqeetUnit(
    country: '',
    unit: 'متراً',
    unitPlural: 'مترات',
    unitPartDigits: 2,
    unitPart: 'سنتميتراً',
    unitPartPlural: 'سنتيمترات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitSY = TafqeetUnit(
    country: 'سورية',
    unit: 'ليرة',
    unitPlural: 'ليرات',
    unitPartDigits: 2,
    unitPart: 'قرشاً',
    unitPartPlural: 'قروش',
    unitGender: Gender.female,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitSA = TafqeetUnit(
    country: 'سعودياً',
    unit: 'ريالاً',
    unitPlural: 'ريالات',
    unitPartDigits: 2,
    unitPart: 'هللة',
    unitPartPlural: 'هللات',
    unitGender: Gender.male,
    unitPartGender: Gender.female,
    unitCode: UnitCode.SaudiArabianRiyal);

TafqeetUnit unitDK = TafqeetUnit(
    country: 'كويتياً',
    unit: 'ديناراً',
    unitPlural: 'دنانير',
    unitPartDigits: 3,
    unitPart: 'فلس',
    unitPartPlural: 'فلوس',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitKG = TafqeetUnit(
    country: '',
    unit: 'كيلو غراماً',
    unitPlural: 'كيلو غرامات',
    unitPartDigits: 3,
    unitPart: 'غرام',
    unitPartPlural: 'غرامات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitund = TafqeetUnit(
    country: '',
    unit: 'قطعة',
    unitPlural: 'قطع',
    unitPartDigits: 3,
    unitPart: 'جزء',
    unitPartPlural: 'أجزاء',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.Undefined);
