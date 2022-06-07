/* Json UNIT CODE
{"unitCode":"SYP",
"country":"سورية","unit":"ليرة",
"unitMultiple":"ليرتين","unitPlural":"ليرات",
"unitGender":"F","unitPartDigits":2,"unitPart":"قرشاً",
"unitPartMultiple":"قرشان","unitPartPlural":"قروش",
"unitPartGender":"M"}
*/

enum UnitCode {
  undefined('UND'),
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
  const UnitCode(this.code);
  @override
  String toString() => 'The $name Code is $code';

  String toMap() => code;

  //UnitCode fromMap(String unitCode) =>
  //   UnitCode.values.firstWhere((e) => e.toMap() == unitCode);
  factory UnitCode.fromMap(String x) {
    return (UnitCode.values.firstWhere((e) => e.toMap() == x));
  }
}

//=== Gender

/* Json UNIT CODE
{"unitCode":"SYP",
"country":"سورية","unit":"ليرة",
"unitMultiple":"ليرتين","unitPlural":"ليرات",
"unitGender":"F","unitPartDigits":2,"unitPart":"قرشاً",
"unitPartMultiple":"قرشان","unitPartPlural":"قروش",
"unitPartGender":"M"}
*/

enum Gender {
  male('M'),
  female('F');

  //final int codeIndex;
  final String code;
  const Gender(this.code);
  @override
  String toString() => 'The $name Code is $code';

  String toMap() => code;

  //UnitCode fromMap(String unitCode) =>
  //   UnitCode.values.firstWhere((e) => e.toMap() == unitCode);
  factory Gender.fromMap(String x) {
    return (Gender.values.firstWhere((e) => e.toMap() == x));
  }
}

void main() {
  print(Gender.female);
  print(Gender.fromMap('F').runtimeType); // Prints “The frozen water is 32 F.”
}

//===

void main1() {
  print(UnitCode.syrianPound);
  print(UnitCode.fromMap('SAR')
      .runtimeType); // Prints “The frozen water is 32 F.”
}
