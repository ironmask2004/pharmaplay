/* Json UNIT CODE
{"unitCode":"SYP",
"country":"سورية","unit":"ليرة",
"unitMultiple":"ليرتين","unitPlural":"ليرات",
"unitGender":"F","unitPartDigits":2,"unitPart":"قرشاً",
"unitPartMultiple":"قرشان","unitPartPlural":"قروش",
"unitPartGender":"M"}
*/
enum TafqeetUnitCode {
  none('NONE'),
  undefined('UND'),
  undefinedPart('UNDP'),
  userDefined('USRD'),

  syrianPound('SYP'),
  syrianPoundPenny('SYPP'),

  unitedStatesDollar('USD'),
  unitedStatesDollarPenny('USDP'),

  saudiArabianRiyal('SAR'),
  saudiArabianRiyalPenny('SARP'),

  kuwaitiDinar('DK'),
  kuwaitiDinarPenny('DKP'),

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
  factory TafqeetUnitCode.fromMap(String x) {
    return (TafqeetUnitCode.values.firstWhere((e) => e.toMap() == x));
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
  factory TafqeetUnitGender.fromMap(String x) {
    return (TafqeetUnitGender.values.firstWhere((e) => e.toMap() == x));
  }
}
