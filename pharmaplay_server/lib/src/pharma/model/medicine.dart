import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'medicine.g.dart';

@JsonSerializable(explicitToJson: true)
class Medicine extends Equatable {
  final int medicineID;
  final String tradeName;
  final String caliber;
  final int formulaID;
  final int manufactoryID;
  final int chemicalDrugID;
  final int genericDrugID;
  final int dosageFormID;
  final String licenseNumber;
  final String licenseDate;
  Medicine({
    required this.medicineID,
    required this.tradeName,
    required this.caliber,
    required this.formulaID,
    required this.manufactoryID,
    required this.chemicalDrugID,
    required this.genericDrugID,
    required this.dosageFormID,
    required this.licenseNumber,
    required this.licenseDate,
  });

  Map<String, dynamic> toJson() => _$MedicineToJson(this);
  factory Medicine.fromJson(Map<String, dynamic> json) =>
      _$MedicineFromJson(json);

  Medicine copyWith({
    int? medicineID,
    String? tradeName,
    String? caliber,
    int? formulaID,
    int? manufactoryID,
    int? chemicalDrugID,
    int? genericDrugID,
    int? dosageFormID,
    String? licenseNumber,
    String? licenseDate,
  }) {
    return Medicine(
      medicineID: medicineID ?? this.medicineID,
      tradeName: tradeName ?? this.tradeName,
      caliber: caliber ?? this.caliber,
      formulaID: formulaID ?? this.formulaID,
      manufactoryID: manufactoryID ?? this.manufactoryID,
      chemicalDrugID: chemicalDrugID ?? this.chemicalDrugID,
      genericDrugID: genericDrugID ?? this.genericDrugID,
      dosageFormID: dosageFormID ?? this.dosageFormID,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      licenseDate: licenseDate ?? this.licenseDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicineID': medicineID,
      'tradeName': tradeName,
      'caliber': caliber,
      'formulaID': formulaID,
      'manufactoryID': manufactoryID,
      'chemicalDrugID': chemicalDrugID,
      'genericDrugID': genericDrugID,
      'dosageFormID': dosageFormID,
      'licenseNumber': licenseNumber,
      'licenseDate': licenseDate,
    };
  }

  factory Medicine.fromMap(Map<String, dynamic> map) {
    return Medicine(
      medicineID: map['medicineID']?.toInt() ?? 0,
      tradeName: map['tradeName'] ?? '',
      caliber: map['caliber'] ?? '',
      formulaID: map['formulaID']?.toInt() ?? 0,
      manufactoryID: map['manufactoryID']?.toInt() ?? 0,
      chemicalDrugID: map['chemicalDrugID']?.toInt() ?? 0,
      genericDrugID: map['genericDrugID']?.toInt() ?? 0,
      dosageFormID: map['dosageFormID']?.toInt() ?? 0,
      licenseNumber: map['licenseNumber'] ?? '',
      licenseDate: map['licenseDate'] ?? '',
    );
  }
  @override
  String toString() {
    return 'Medicine(medicineID: $medicineID, tradeName: $tradeName, caliber: $caliber, formulaID: $formulaID, manufactoryID: $manufactoryID, chemicalDrugID: $chemicalDrugID, genericDrugID: $genericDrugID, dosageFormID: $dosageFormID, licenseNumber: $licenseNumber, licenseDate: $licenseDate)';
  }

  @override
  List<Object> get props {
    return [
      medicineID,
      tradeName,
      caliber,
      formulaID,
      manufactoryID,
      chemicalDrugID,
      genericDrugID,
      dosageFormID,
      licenseNumber,
      licenseDate,
    ];
  }
}
