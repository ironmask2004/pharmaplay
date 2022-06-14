enum TafqeetUnitCode {
  test('TST'),

  none('NON'),
  undefined('UND'),
  undefinedPart('UNDP'),
  userDefined('USRD'),

  syrianPound('SYP'),
  syrianPoundqirsh('SYPQ'),

  turkishLira('TRY'),
  turkishLiraQirsh('TRYQ'),

  lebanonPound('LBP'),
  lebanonPoundPenny('LBPP'),

  emiratesDirham('AED'),
  emiratesDirhamPenny('AEDP'),

  unitedStatesDollar('USD'),
  unitedStatesDollarPenny('USDP'),

  egyptianPound('EGP'),
  egyptianPoundPiastre('EGPP'),
  egyptianPoundMillieme('EGPM'),

  jordanianDinar('JOD'),
  jordanianDinardirham('JODD'), //10 dirham
  jordanianDinarqirsh('JODQ'), //100 qirsh
  jordanianDinarFulus('JODF'), //1000 fulus

  saudiArabianRiyal('SAR'),
  saudiArabianRiyalHalala('SARP'),

  kuwaitiDinar('DK'),
  kuwaitiDinarFulus('DKF'),

  bahrainiDinar('BHD'),
  bahrainiDinarFulus('BHDF'),

  tunisianDinar('TD'),
  tunisianDinarMillim('TDM'),

  algerianDinar('DZD'),
  algerianDinarCentime('DZDM'),

  iraqiDinar('IQD'),
  iraqiDinarFils('IQDF'),

  euro('EUR'),
  euroCent('EURC'),

  australianDollar('AUSD'),
  australianDollarCent('AUSC'),
  canadianDollar('CAD'),
  canadianDollarCent('CADC'),

  poundSterling('GBP'),
  poundSterlingPence('GBPP'),

  moroccanDirham('MAD'),
  moroccanDirhamCentime('MADC'),

  qatariRiyal('QR'),
  qatariRiyalDirham('QRD'),

  metricTon('MTON'),
  kiloGram('KG'),
  gram('GRAM'),

  ounce('OZ'),

  kiloMetre('KM'),
  metre('M'),
  centimeter('CM'),
  millimeter('MM'),

  hour('HR'),
  minute('MIN'),
  second('SEC'),
  millisecond('MSEC'),
  ;

  //final int codeIndex;
  final String code;
  const TafqeetUnitCode(this.code);
  @override
  String toString() => 'The $name Code is $code';

  String toMap() => code;

  //tafqeetUnitCode fromMap(String unitCode) =>
  //   tafqeetUnitCode.values.firstWhere((e) => e.toMap() == unitCode);
  factory TafqeetUnitCode.fromMap(TafqeetUnitCode x) {
    return (x); //(TafqeetUnitCode.values.firstWhere((e) => e.toMap() == x));
  }
}

//=== Gender
//Determine if the number is masculine or feminine
enum TafqeetUnitGender {
  masculine('M'),
  feminine('F');

  //final int codeIndex;
  final String code;
  const TafqeetUnitGender(this.code);
  @override
  String toString() => 'The $name Code is $code';

  String toMap() => code;

  //tafqeetUnitCode fromMap(String unitCode) =>
  //   tafqeetUnitCode.values.firstWhere((e) => e.toMap() == unitCode);
  factory TafqeetUnitGender.fromMap(TafqeetUnitGender x) {
    return (x);
    // (TafqeetUnitGender.values.firstWhere((e) => e.toMap() == x));
  }
}
