import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharma_shared_models/pharma_shared_models.dart';

part 'drug.g.dart';

@JsonSerializable(explicitToJson: true)
class Drug extends Equatable {
  final int drugID;
  final String drugNo;
  final String brandName;
  final String caliber;
  final int genericDrugID;
  final int chemicalDrugID;
  final int manufactoryID;
  final int dosageFormID;
  final int drugClassID;
  final int drugFamilyID;
  final String licenseNumber;
  final String licenseDate;
  Drug({
    required this.drugID,
    required this.drugNo,
    required this.brandName,
    required this.caliber,
    required this.genericDrugID,
    required this.chemicalDrugID,
    required this.manufactoryID,
    required this.dosageFormID,
    required this.drugClassID,
    required this.drugFamilyID,
    required this.licenseNumber,
    required this.licenseDate,
  });

  Map<String, dynamic> toJson() => _$DrugToJson(this);
  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);

  Drug copyWith({
    int? drugID,
    String? drugNo,
    String? brandName,
    String? caliber,
    int? genericDrugID,
    int? chemicalDrugID,
    int? manufactoryID,
    int? dosageFormID,
    int? drugClassID,
    int? drugFamilyID,
    String? licenseNumber,
    String? licenseDate,
  }) {
    return Drug(
      drugID: drugID ?? this.drugID,
      drugNo: drugNo ?? this.drugNo,
      brandName: brandName ?? this.brandName,
      caliber: caliber ?? this.caliber,
      genericDrugID: genericDrugID ?? this.genericDrugID,
      chemicalDrugID: chemicalDrugID ?? this.chemicalDrugID,
      manufactoryID: manufactoryID ?? this.manufactoryID,
      dosageFormID: dosageFormID ?? this.dosageFormID,
      drugClassID: drugClassID ?? this.drugClassID,
      drugFamilyID: drugFamilyID ?? this.drugFamilyID,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      licenseDate: licenseDate ?? this.licenseDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drugID': drugID,
      'drugNo': drugNo,
      'brandName': brandName,
      'caliber': caliber,
      'genericDrugID': genericDrugID,
      'chemicalDrugID': chemicalDrugID,
      'manufactoryID': manufactoryID,
      'dosageFormID': dosageFormID,
      'drugClassID': drugClassID,
      'drugFamilyID': drugFamilyID,
      'licenseNumber': licenseNumber,
      'licenseDate': licenseDate,
    };
  }

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      drugID: map['drugID']?.toInt() ?? 0,
      drugNo: map['drugNo'] ?? '',
      brandName: map['brandName'] ?? '',
      caliber: map['caliber'] ?? '',
      genericDrugID: map['genericDrugID']?.toInt() ?? 0,
      chemicalDrugID: map['chemicalDrugID']?.toInt() ?? 0,
      manufactoryID: map['manufactoryID']?.toInt() ?? 0,
      dosageFormID: map['dosageFormID']?.toInt() ?? 0,
      drugClassID: map['drugClassID']?.toInt() ?? 0,
      drugFamilyID: map['drugFamilyID']?.toInt() ?? 0,
      licenseNumber: map['licenseNumber'] ?? '',
      licenseDate: map['licenseDate'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Drug(drugID: $drugID, drugNo: $drugNo, brandName: $brandName, caliber: $caliber, genericDrugID: $genericDrugID, chemicalDrugID: $chemicalDrugID, manufactoryID: $manufactoryID, dosageFormID: $dosageFormID, drugClassID: $drugClassID, drugFamilyID: $drugFamilyID, licenseNumber: $licenseNumber, licenseDate: $licenseDate)';
  }

  @override
  List<Object> get props {
    return [
      drugID,
      drugNo,
      brandName,
      caliber,
      genericDrugID,
      chemicalDrugID,
      manufactoryID,
      dosageFormID,
      drugClassID,
      drugFamilyID,
      licenseNumber,
      licenseDate,
    ];
  }
}
