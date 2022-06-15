import 'tafqeet_unit.dart';
import 'unit_code.dart';

const List<Map<String, dynamic>> tafqeetPredefinedUnits = [
  {
    'unitCode': TafqeetUnitCode.none,
    'comprehensiveUnit': '',
    'unit': '',
    'unitPlural': '',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none,
  },
  {
    'unitCode': TafqeetUnitCode.undefined,
    'comprehensiveUnit': '',
    'unit': 'قلم',
    'unitPlural': 'أٌقلام',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.undefinedPart,
  },
  {
    'unitCode': TafqeetUnitCode.undefinedPart,
    'comprehensiveUnit': '',
    'unit': 'جزء',
    'unitPlural': 'أجزاء',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  // ========  weight Units
  {
    'unitCode': TafqeetUnitCode.metricTon,
    'comprehensiveUnit': '',
    'unit': 'طن',
    'unitPlural': 'أطنان',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.kiloGram,
  },
  {
    'unitCode': TafqeetUnitCode.kiloGram,
    'comprehensiveUnit': '',
    'unit': 'كيلو غرام',
    'unitPlural': 'كيلو غرامات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.gram,
  },
  {
    'unitCode': TafqeetUnitCode.gram,
    'comprehensiveUnit': '',
    'unit': 'غرام',
    'unitPlural': 'غرامات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.ounce,
    'comprehensiveUnit': '',
    'unit': 'أونصة',
    'unitPlural': 'أونصات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  //====== Units of times
  {
    'unitCode': TafqeetUnitCode.hour,
    'comprehensiveUnit': '',
    'unit': 'ساعة',
    'unitPlural': 'ساعات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.minute
  },
  {
    'comprehensiveUnit': '',
    'unit': 'دقيقة',
    'unitPlural': 'دقائق',
    'unitMaxValue': 60,
    'unitGender': TafqeetUnitGender.feminine,
    'unitCode': TafqeetUnitCode.minute,
    'partialUnitCode': TafqeetUnitCode.second
  },
  {
    'unitCode': TafqeetUnitCode.second,
    'comprehensiveUnit': '',
    'unit': 'ثانية',
    'unitPlural': 'ثواني',
    'unitMaxValue': 60,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.millisecond,
  },
  {
    'unitCode': TafqeetUnitCode.millisecond,
    'comprehensiveUnit': '',
    'unit': 'ميلي ثانية',
    'unitPlural': 'ميلي ثواني',
    'unitMaxValue': 60,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none,
  },
  //=============== Units of  distances and lengths
  {
    'unitCode': TafqeetUnitCode.kiloMetre,
    'comprehensiveUnit': '',
    'unit': 'كيلو متر',
    'unitPlural': 'كيلو مترات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.metre,
  },

  {
    'unitCode': TafqeetUnitCode.kiloMetre2,
    'comprehensiveUnit': 'مربع',
    'unit': 'كيلو متر',
    'unitPlural': 'كيلو مترات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.metre2,
  },
  {
    'unitCode': TafqeetUnitCode.metre,
    'comprehensiveUnit': '',
    'unit': 'متر',
    'unitPlural': 'امتار',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.centimeter
  },
  {
    'unitCode': TafqeetUnitCode.metre2,
    'comprehensiveUnit': 'مربع',
    'unit': 'متر',
    'unitPlural': 'امتار',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.centimeter2
  },

  {
    'unitCode': TafqeetUnitCode.centimeter2,
    'comprehensiveUnit': 'مربع',
    'unit': 'سنتميتر ',
    'unitPlural': 'سنتيمترات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.milliMeter2
  },

  {
    'unitCode': TafqeetUnitCode.milliMeter2,
    'comprehensiveUnit': 'مربع',
    'unit': 'ميلي',
    'unitPlural': 'ميليات',
    'unitMaxValue': 10,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.yard,
    'comprehensiveUnit': '',
    'unit': 'ياردة',
    'unitPlural': 'ياردات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.mile,
    'comprehensiveUnit': '',
    'unit': 'ميل',
    'unitPlural': 'أميال',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.feet,
    'comprehensiveUnit': '',
    'unit': 'قدم',
    'unitPlural': 'أقدام',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.inch,
    'comprehensiveUnit': '',
    'unit': 'إنش',
    'unitPlural': 'إنشات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.degree,
    'comprehensiveUnit': '',
    'unit': 'درجة',
    'unitPlural': 'درجات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.fahrenheit,
    'comprehensiveUnit': '',
    'unit': 'درجة فهرنهايت',
    'unitPlural': 'درجات فهرنهايت',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.centimeter,
    'comprehensiveUnit': '',
    'unit': 'سنتميتر',
    'unitPlural': 'سنتيمترات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.milliMeter
  },
  {
    'unitCode': TafqeetUnitCode.milliMeter,
    'comprehensiveUnit': '',
    'unit': 'ميلي',
    'unitPlural': 'ميليات',
    'unitMaxValue': 10,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  // ===== Units of currencies
  {
    'unitCode': TafqeetUnitCode.unitedStatesDollar,
    'comprehensiveUnit': 'أميريكي',
    'unit': 'دولار',
    'unitPlural': 'دولارات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.unitedStatesDollarPenny,
  },
  {
    'unitCode': TafqeetUnitCode.unitedStatesDollarPenny,
    'comprehensiveUnit': 'أميريكي',
    'unit': 'سنت',
    'unitPlural': 'سنتات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.russianRuble,
    'comprehensiveUnit': 'روسي',
    'unit': 'روبل',
    'unitPlural': 'روبلات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.russianRubleCopeck
  },

  {
    'unitCode': TafqeetUnitCode.russianRubleCopeck,
    'comprehensiveUnit': 'روسي',
    'unit': 'كوبيك',
    'unitPlural': 'كوييكات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none,
  },

  {
    'unitCode': TafqeetUnitCode.canadianDollar,
    'comprehensiveUnit': 'كندي',
    'unit': 'دولار',
    'unitPlural': 'دولارات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.canadianDollarCent,
  },
  {
    'unitCode': TafqeetUnitCode.canadianDollarCent,
    'comprehensiveUnit': 'كندي',
    'unit': 'سنت',
    'unitPlural': 'سنتات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.euro,
    'comprehensiveUnit': 'أوربي',
    'unit': 'يورو',
    'unitPlural': 'يوروهات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.euroCent,
  },
  {
    'unitCode': TafqeetUnitCode.euroCent,
    'comprehensiveUnit': 'أوربي',
    'unit': 'سنت',
    'unitPlural': 'سنتات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.australianDollar,
    'comprehensiveUnit': 'أسترالي',
    'unit': 'جنيه',
    'unitPlural': 'جنيهات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.australianDollarCent,
  },
  {
    'unitCode': TafqeetUnitCode.australianDollarCent,
    'comprehensiveUnit': 'أسترالي',
    'unit': 'سنت',
    'unitPlural': 'سنتات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.poundSterling,
    'comprehensiveUnit': 'أسترليني',
    'unit': 'جنيه',
    'unitPlural': 'جنيهات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.poundSterlingPence,
  },
  {
    'unitCode': TafqeetUnitCode.poundSterlingPence,
    'comprehensiveUnit': 'أسترليني',
    'unit': 'بنس',
    'unitPlural': 'بنسات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.kuwaitiDinar,
    'comprehensiveUnit': 'كويتي',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.kuwaitiDinarFulus
  },
  {
    'unitCode': TafqeetUnitCode.kuwaitiDinarFulus,
    'comprehensiveUnit': 'كويتي',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.saudiArabianRiyal,
    'comprehensiveUnit': 'سعودي',
    'unit': 'ريال',
    'unitPlural': 'ريالات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.saudiArabianRiyalHalala
  },
  {
    'unitCode': TafqeetUnitCode.saudiArabianRiyalHalala,
    'comprehensiveUnit': 'سعودي',
    'unit': 'هللة',
    'unitPlural': 'هللات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.syrianPound,
    'comprehensiveUnit': 'سورية',
    'unit': 'ليرة',
    'unitPlural': 'ليرات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.syrianPoundqirsh
  },
  {
    'unitCode': TafqeetUnitCode.syrianPoundqirsh,
    'comprehensiveUnit': 'سورية',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.mauritanianOuguiya,
    'comprehensiveUnit': 'موريتانية',
    'unit': 'أوقية',
    'unitPlural': 'أوقيات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.mauritanianOuguiyaKhoums
  },
  {
    'unitCode': TafqeetUnitCode.syrianPoundqirsh,
    'comprehensiveUnit': 'موريتانية',
    'unit': 'خمس',
    'unitPlural': 'أخماس',
    'unitMaxValue': 5,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.turkishLira,
    'comprehensiveUnit': 'تركية',
    'unit': 'ليرة',
    'unitPlural': 'ليرات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.turkishLiraQirsh
  },
  {
    'unitCode': TafqeetUnitCode.turkishLiraQirsh,
    'comprehensiveUnit': 'تركية',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.lebanonPound,
    'comprehensiveUnit': 'لبنانية',
    'unit': 'ليرة',
    'unitPlural': 'ليرات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.lebanonPoundPenny
  },
  {
    'unitCode': TafqeetUnitCode.lebanonPoundPenny,
    'comprehensiveUnit': 'لبنانية',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.emiratesDirham,
    'comprehensiveUnit': 'إماراتي',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.emiratesDirhamPenny
  },
  {
    'unitCode': TafqeetUnitCode.emiratesDirhamPenny,
    'comprehensiveUnit': 'إماراتي',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.egyptianPound,
    'comprehensiveUnit': 'مصري',
    'unit': 'جنيه',
    'unitPlural': 'جنيهات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.egyptianPoundPiastre
  },
  {
    'unitCode': TafqeetUnitCode.egyptianPoundPiastre,
    'comprehensiveUnit': 'مصري',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.egyptianPoundMillieme
  },
  {
    'unitCode': TafqeetUnitCode.egyptianPoundMillieme,
    'comprehensiveUnit': 'مصري',
    'unit': 'مليم',
    'unitPlural': 'مليمات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.sudanesePound,
    'comprehensiveUnit': 'سوداني',
    'unit': 'جنيه',
    'unitPlural': 'جنيهات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.sudanesePoundQirsh
  },
  {
    'unitCode': TafqeetUnitCode.sudanesePoundQirsh,
    'comprehensiveUnit': 'سوداني',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.jordanianDinar,
    'comprehensiveUnit': 'أردني',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.jordanianDinardirham
  },
  {
    'unitCode': TafqeetUnitCode.jordanianDinardirham,
    'comprehensiveUnit': 'أردني',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 10,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.jordanianDinarqirsh
  },

  {
    'unitCode': TafqeetUnitCode.qatariRiyal,
    'comprehensiveUnit': 'قطري',
    'unit': 'ريال',
    'unitPlural': 'ريالات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.qatariRiyalDirham
  },
  {
    'unitCode': TafqeetUnitCode.qatariRiyalDirham,
    'comprehensiveUnit': 'قطري',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 10,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.libyanDinar,
    'comprehensiveUnit': 'ليبي',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.libyanDinarDirham
  },
  {
    'unitCode': TafqeetUnitCode.libyanDinarDirham,
    'comprehensiveUnit': 'ليبي',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.yemeniRial,
    'comprehensiveUnit': 'يمني',
    'unit': 'ريال',
    'unitPlural': 'ريالات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.yemeniRialFils
  },
  {
    'unitCode': TafqeetUnitCode.yemeniRialFils,
    'comprehensiveUnit': 'يمني',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.omaniRial,
    'comprehensiveUnit': 'عماني',
    'unit': 'ريال',
    'unitPlural': 'ريالات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.omaniRialBaisa
  },
  {
    'unitCode': TafqeetUnitCode.omaniRialBaisa,
    'comprehensiveUnit': 'عماني',
    'unit': 'بيسة',
    'unitPlural': 'بيسات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.jordanianDinarqirsh
  },

  {
    'unitCode': TafqeetUnitCode.jordanianDinarqirsh,
    'comprehensiveUnit': 'أردني',
    'unit': 'قرش',
    'unitPlural': 'قروش',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.jordanianDinarFulus
  },
  {
    'unitCode': TafqeetUnitCode.jordanianDinarFulus,
    'comprehensiveUnit': 'أردني',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.bahrainiDinar,
    'comprehensiveUnit': 'بحريني',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.bahrainiDinarFulus
  },
  {
    'unitCode': TafqeetUnitCode.bahrainiDinarFulus,
    'comprehensiveUnit': 'بحريني',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.tunisianDinar,
    'comprehensiveUnit': 'تونسي',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.tunisianDinarMillim
  },
  {
    'unitCode': TafqeetUnitCode.tunisianDinarMillim,
    'comprehensiveUnit': 'تونسي',
    'unit': 'مليم',
    'unitPlural': 'مليمات',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.algerianDinar,
    'comprehensiveUnit': 'جزائري',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.algerianDinarCentime
  },
  {
    'unitCode': TafqeetUnitCode.algerianDinarCentime,
    'comprehensiveUnit': 'جزائري',
    'unit': 'سنتيم',
    'unitPlural': 'سنتيمات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.moroccanDirham,
    'comprehensiveUnit': 'مغربي',
    'unit': 'درهم',
    'unitPlural': 'دراهم',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.moroccanDirhamCentime
  },
  {
    'unitCode': TafqeetUnitCode.moroccanDirhamCentime,
    'comprehensiveUnit': 'مغربي',
    'unit': 'سنتيم',
    'unitPlural': 'سنتيمات',
    'unitMaxValue': 100,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.iraqiDinar,
    'comprehensiveUnit': 'عراقي',
    'unit': 'دينار',
    'unitPlural': 'دنانير',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.iraqiDinarFils
  },
  {
    'unitCode': TafqeetUnitCode.iraqiDinarFils,
    'comprehensiveUnit': 'عراقي',
    'unit': 'فلس',
    'unitPlural': 'فلوس',
    'unitMaxValue': 1000,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  ///=======
  ///

  {
    'unitCode': TafqeetUnitCode.container,
    'comprehensiveUnit': '',
    'unit': 'حاوية',
    'unitPlural': 'حاويات',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
  {
    'unitCode': TafqeetUnitCode.package,
    'comprehensiveUnit': '',
    'unit': 'طرد',
    'unitPlural': 'طرود',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.share,
    'comprehensiveUnit': '',
    'unit': 'سهم',
    'unitPlural': 'أسهم',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.box,
    'comprehensiveUnit': '',
    'unit': 'صندوق',
    'unitPlural': 'صناديق',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.can,
    'comprehensiveUnit': '',
    'unit': 'علبة',
    'unitPlural': 'علب',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.feminine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.kiloMetrePerHour,
    'comprehensiveUnit': '',
    'unit': 'كيلومتر في الساعة',
    'unitPlural': 'كيلومترات في الساعة',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },

  {
    'unitCode': TafqeetUnitCode.metrePerSecond,
    'comprehensiveUnit': '',
    'unit': 'متر في الثانية',
    'unitPlural': 'أمتار في الثانية',
    'unitMaxValue': 0,
    'unitGender': TafqeetUnitGender.masculine,
    'partialUnitCode': TafqeetUnitCode.none
  },
];
