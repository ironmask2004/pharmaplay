import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'medicine.g.dart';

@JsonSerializable(explicitToJson: true)
class Medicine extends Equatable {
  final int medicineID;
  final String tradeName;
  final String caliber;
  final int formulaID;
  final int medicineFactoryID;
  final int chemicalNameID;
  final int genericNameID;
  final int pharmaFormID;
  final String licenseNumber;
  final String licenseDate;
  Medicine({
    required this.medicineID,
    required this.tradeName,
    required this.caliber,
    required this.formulaID,
    required this.medicineFactoryID,
    required this.chemicalNameID,
    required this.genericNameID,
    required this.pharmaFormID,
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
    int? medicineFactoryID,
    int? chemicalNameID,
    int? genericNameID,
    int? pharmaFormID,
    String? licenseNumber,
    String? licenseDate,
  }) {
    return Medicine(
      medicineID: medicineID ?? this.medicineID,
      tradeName: tradeName ?? this.tradeName,
      caliber: caliber ?? this.caliber,
      formulaID: formulaID ?? this.formulaID,
      medicineFactoryID: medicineFactoryID ?? this.medicineFactoryID,
      chemicalNameID: chemicalNameID ?? this.chemicalNameID,
      genericNameID: genericNameID ?? this.genericNameID,
      pharmaFormID: pharmaFormID ?? this.pharmaFormID,
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
      'medicineFactoryID': medicineFactoryID,
      'chemicalNameID': chemicalNameID,
      'genericNameID': genericNameID,
      'pharmaFormID': pharmaFormID,
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
      medicineFactoryID: map['medicineFactoryID']?.toInt() ?? 0,
      chemicalNameID: map['chemicalNameID']?.toInt() ?? 0,
      genericNameID: map['genericNameID']?.toInt() ?? 0,
      pharmaFormID: map['pharmaFormID']?.toInt() ?? 0,
      licenseNumber: map['licenseNumber'] ?? '',
      licenseDate: map['licenseDate'] ?? '',
    );
  }
  @override
  String toString() {
    return 'Medicine(medicineID: $medicineID, tradeName: $tradeName, caliber: $caliber, formulaID: $formulaID, medicineFactoryID: $medicineFactoryID, chemicalNameID: $chemicalNameID, genericNameID: $genericNameID, pharmaFormID: $pharmaFormID, licenseNumber: $licenseNumber, licenseDate: $licenseDate)';
  }

  @override
  List<Object> get props {
    return [
      medicineID,
      tradeName,
      caliber,
      formulaID,
      medicineFactoryID,
      chemicalNameID,
      genericNameID,
      pharmaFormID,
      licenseNumber,
      licenseDate,
    ];
  }
}
