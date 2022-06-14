import 'tafqeet_unit.dart';
import 'unit_code.dart';

const List<Map<String, dynamic>> tafqeetPredefinedUnits = [
  {
    'unitCode': TafqeetUnitCode.none,
    'country': '',
    'unit': '',
    'unitPlural': '',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none,
  },
  {
    'unitCode': TafqeetUnitCode.undefined,
    'country': '',
    'unit': 'قلم',
    'unitPlural': 'أٌقلام',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.undefinedPart,
  },
  {
    'unitCode': TafqeetUnitCode.undefinedPart,
    'country': '',
    'unit': 'جزء',
    'unitPlural': 'أجزاء',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  // ========  weight Units
  {
    'unitCode': TafqeetUnitCode.metricTon,
    'country': '',
    'unit': 'طن',
    'unitPlural': 'أطنان',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.kiloGram,
  },
  {
    'unitCode': TafqeetUnitCode.kiloGram,
    'country': '',
    'unit': 'كيلو غرام',
    'unitPlural': 'كيلو غرامات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.gram,
  },
  {
    'unitCode': TafqeetUnitCode.gram,
    'country': '',
    'unit': 'غرام',
    'unitPlural': 'غرامات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.ounce,
    'country': '',
    'unit': 'أونصة',
    'unitPlural': 'أونصات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  //====== Units of times
  {
    'unitCode': TafqeetUnitCode.hour,
    'country': '',
    'unit': 'ساعة',
    'unitPlural': 'ساعات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.minute
  },
  {
    'country': '',
    'unit': 'دقيقة',
    'unitPlural': 'دقائق',
    'unitMaxValue': 60,
    'unitGender': TafqeetUnitGender.feminine,
    'unitCode': TafqeetUnitCode.minute,
    'partialUnitCode': TafqeetUnitCode.second
  },
  {
    'unitCode': TafqeetUnitCode.second,
    'country': '',
    'unit': 'ثانية',
    'unitPlural': 'ثواني',
    'unitMaxValue': 60,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.millisecond,
  },
  {
    'unitCode': TafqeetUnitCode.millisecond,
    'country': '',
    'unit': 'ميللي ثانية',
    'unitPlural': 'ميللي ثواني',
    'unitMaxValue': 60,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none,
  },
  //=============== Units of  distances and lengths
  {
    'unitCode': TafqeetUnitCode.kiloMetre,
    'country': '',
    'unit': 'كيلو متر',
    'unitPlural': 'كيلو مترات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.metre,
  },
  {
    'unitCode': TafqeetUnitCode.metre,
    'country': '',
    'unit': 'متر',
    'unitPlural': 'امتار',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.centimeter
  },
  {
    'unitCode': TafqeetUnitCode.centimeter,
    'country': '',
    'unit': 'سنتميتر',
    'unitPlural': 'سنتيمترات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.millimeter
  },
  {
    'unitCode': TafqeetUnitCode.millimeter,
    'country': '',
    'unit': 'ميللي',
    'unitPlural': 'ميلليات',
    'unitMaxValue': 10,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  // ===== Units of currencies
  {
    'unitCode': TafqeetUnitCode.unitedStatesDollar,
    'country': 'أميريكي',
    'unit': 'دولار',
    'unitPlural': 'دولارات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.unitedStatesDollarPenny,
  },
  {
    'unitCode': TafqeetUnitCode.unitedStatesDollarPenny,
    'country': 'أميريكي',
    'unit': 'سنت',
    'unitPlural': 'سنتات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.kuwaitiDinar,
    'country': 'كويتي',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.kuwaitiDinarFulus
  },
  {
    'unitCode': TafqeetUnitCode.kuwaitiDinarFulus,
    'country': 'كويتي',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.saudiArabianRiyal,
    'country': 'سعودي',
    'unit': 'ريال',
    'unitPlural': 'ريالات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.saudiArabianRiyalHalala
  },
  {
    'unitCode': TafqeetUnitCode.saudiArabianRiyalHalala,
    'country': 'سعودي',
    'unit': 'هللة',
    'unitPlural': 'هللات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.syrianPound,
    'country': 'سورية',
    'unit': 'ليرة',
    'unitPlural': 'ليرات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.syrianPoundqirsh
  },
  {
    'unitCode': TafqeetUnitCode.syrianPoundqirsh,
    'country': 'سورية',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.lebanonPound,
    'country': 'لبنانية',
    'unit': 'ليرة',
    'unitPlural': 'ليرات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.lebanonPoundPenny
  },
  {
    'unitCode': TafqeetUnitCode.lebanonPoundPenny,
    'country': 'لبنانية',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.emiratesDirham,
    'country': 'إماراتي',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.emiratesDirhamPenny
  },
  {
    'unitCode': TafqeetUnitCode.emiratesDirhamPenny,
    'country': 'إماراتي',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.egyptianPound,
    'country': 'مصري',
    'unit': 'جنيه',
    'unitPlural': 'جنيهات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.egyptianPoundPiastre
  },
  {
    'unitCode': TafqeetUnitCode.egyptianPoundPiastre,
    'country': 'مصري',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.egyptianPoundMillieme
  },
  {
    'unitCode': TafqeetUnitCode.egyptianPoundMillieme,
    'country': 'مصري',
    'unit': 'مليم',
    'unitPlural': 'مليمات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.jordanianDinar,
    'country': 'أردني',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.jordanianDinardirhams
  },
  {
    'unitCode': TafqeetUnitCode.jordanianDinardirhams,
    'country': 'أردني',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 10,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.jordanianDinarqirsh
  },
  {
    'unitCode': TafqeetUnitCode.jordanianDinarqirsh,
    'country': 'أردني',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.jordanianDinarFulus
  },
  {
    'unitCode': TafqeetUnitCode.jordanianDinarFulus,
    'country': 'أردني',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.bahrainiDinar,
    'country': 'بحريني',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.bahrainiDinarFulus
  },
  {
    'unitCode': TafqeetUnitCode.bahrainiDinarFulus,
    'country': 'بحريني',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
];
