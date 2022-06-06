import 'package:tafqeet/src/model/tafqeet_unit.dart';
import 'package:tafqeet/src/model/unit_code.dart';

TafqeetUnit unitUsa = TafqeetUnit(
    country: 'أميريكياً',
    unit: 'دولاراً',
    unitMultiple: 'دولارين',
    unitPlural: 'دولارات',
    unitPartDigits: 2,
    unitPart: 'سنت',
    unitPartMultiple: 'سنتين',
    unitPartPlural: 'سنتات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

//====

TafqeetUnit unitOnce = TafqeetUnit(
    country: '',
    unit: 'أونصة',
    unitMultiple: 'أونصتين',
    unitPlural: 'أونصات',
    unitPartDigits: 0,
    unitPart: '',
    unitPartMultiple: '',
    unitPartPlural: '',
    unitGender: Gender.female,
    unitPartGender: Gender.female,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitKM = TafqeetUnit(
    country: '',
    unit: 'متراً',
    unitMultiple: 'أثنين متراً',
    unitPlural: 'مترات',
    unitPartDigits: 2,
    unitPart: 'سنتميتراً',
    unitPartMultiple: 'سنتيمتران',
    unitPartPlural: 'سنتيمترات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitSY = TafqeetUnit(
    country: 'سورية',
    unit: 'ليرة',
    unitMultiple: 'ليرتين',
    unitPlural: 'ليرات',
    unitPartDigits: 2,
    unitPart: 'قرشاً',
    unitPartMultiple: 'قرشان',
    unitPartPlural: 'قروش',
    unitGender: Gender.female,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitSA = TafqeetUnit(
    country: 'سعودياً',
    unit: 'ريالاً',
    unitMultiple: 'ريالين',
    unitPlural: 'ريالات',
    unitPartDigits: 2,
    unitPart: 'هللة',
    unitPartMultiple: 'هللاتين',
    unitPartPlural: 'هللات',
    unitGender: Gender.male,
    unitPartGender: Gender.female,
    unitCode: UnitCode.SaudiArabianRiyal);

TafqeetUnit unitDK = TafqeetUnit(
    country: 'كويتياً',
    unit: 'ديناراً',
    unitMultiple: 'دينارين',
    unitPlural: 'دنانير',
    unitPartDigits: 3,
    unitPart: 'فلس',
    unitPartMultiple: 'فلسين',
    unitPartPlural: 'فلوس',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitKG = TafqeetUnit(
    country: '',
    unit: 'كيلو غراماً',
    unitMultiple: 'أثنين كيلو غراماً',
    unitPlural: 'كيلو غرامات',
    unitPartDigits: 3,
    unitPart: 'غرام',
    unitPartMultiple: 'غرامين',
    unitPartPlural: 'غرامات',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.UnitedStatesDollar);

TafqeetUnit unitund = TafqeetUnit(
    country: '',
    unit: 'قطعة',
    unitMultiple: '',
    unitPlural: 'قطع',
    unitPartDigits: 3,
    unitPart: 'جزء',
    unitPartMultiple: '',
    unitPartPlural: '',
    unitGender: Gender.male,
    unitPartGender: Gender.male,
    unitCode: UnitCode.Undefined);
