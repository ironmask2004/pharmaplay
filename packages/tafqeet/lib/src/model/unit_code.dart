/* Json UNIT CODE
{"unitCode":"SYP",
"country":"سورية","unit":"ليرة",
"unitMultiple":"ليرتين","unitPlural":"ليرات",
"unitGender":"F","unitPartDigits":2,"unitPart":"قرشاً",
"unitPartMultiple":"قرشان","unitPartPlural":"قروش",
"unitPartGender":"M"}
*/

enum TafqeetUnitCode {
  undefined('UND'),
  userDefined('USR'),
  syrianPound('SYP'),
  unitedStatesDollar('USD'),
  saudiArabianRiyal('SAR'),
  kuwaitiDinar('DK'),
  kiloGram('KG'),
  ounce('OZ'),
  kiloMetre('KM'),
  metre('M'),
  hour('HR'),
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
enum TafqeetGender {
  masculine('M'),
  feminine('F');

  //final int codeIndex;
  final String code;
  const TafqeetGender(this.code);
  @override
  String toString() => 'The $name Code is $code';

  String toMap() => code;

  //tafqeetUnitCode fromMap(String unitCode) =>
  //   tafqeetUnitCode.values.firstWhere((e) => e.toMap() == unitCode);
  factory TafqeetGender.fromMap(String x) {
    return (TafqeetGender.values.firstWhere((e) => e.toMap() == x));
  }
}
