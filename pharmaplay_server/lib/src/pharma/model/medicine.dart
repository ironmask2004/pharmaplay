import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'medicine.g.dart';

@JsonSerializable(explicitToJson: true)
class Medicine extends Equatable {
  final int medicineID;
  final String tradename;
  final String caliber;
  final int formulaID;
  final String formula;
  final int factoryID;
  final String factoryName;
  final int chemicalNameID;
  final String chemicalName;
  final int genericnameID;
  final String genericname;
  final int pharmaFormID;
  final String pharmaForm;
  final String licenseNumber;
  final String licenseDate;
  Medicine({
    required this.medicineID,
    required this.tradename,
    required this.caliber,
    required this.formulaID,
    required this.formula,
    required this.factoryID,
    required this.factoryName,
    required this.chemicalNameID,
    required this.chemicalName,
    required this.genericnameID,
    required this.genericname,
    required this.pharmaFormID,
    required this.pharmaForm,
    required this.licenseNumber,
    required this.licenseDate,
  });

  Medicine copyWithFromMap(Map<String, dynamic> map) {
    return Medicine(
        medicineID: map['medicineID']?.toInt() ?? medicineID,
        tradename: map['tradename'] ?? tradename,
        caliber: map['caliber'] ?? caliber,
        formulaID: map['formulaID']?.toInt() ?? formulaID,
        formula: map['formula'] ?? formula,
        factoryID: map['factoryID']?.toInt() ?? factoryID,
        factoryName: map['factoryName'] ?? factoryName,
        chemicalNameID: map['chemicalNameID']?.toInt() ?? chemicalNameID,
        chemicalName: map['chemicalName'] ?? chemicalName,
        genericnameID: map['genericnameID']?.toInt() ?? genericnameID,
        genericname: map['genericname'] ?? genericname,
        pharmaFormID: map['pharmaFormID']?.toInt() ?? pharmaFormID,
        pharmaForm: map['pharmaForm'] ?? pharmaForm,
        licenseNumber: map['licenseNumber'] ?? licenseNumber,
        licenseDate: map['licenseDate'] ?? licenseDate);
  }
}
