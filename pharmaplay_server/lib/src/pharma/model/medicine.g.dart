// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      medicineID: json['medicineID'] as int,
      tradeName: json['tradeName'] as String,
      caliber: json['caliber'] as String,
      formulaID: json['formulaID'] as int,
      manufactoryID: json['manufactoryID'] as int,
      chemicalDrugID: json['chemicalDrugID'] as int,
      genericDrugID: json['genericDrugID'] as int,
      dosageFormID: json['dosageFormID'] as int,
      licenseNumber: json['licenseNumber'] as String,
      licenseDate: json['licenseDate'] as String,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'medicineID': instance.medicineID,
      'tradeName': instance.tradeName,
      'caliber': instance.caliber,
      'formulaID': instance.formulaID,
      'manufactoryID': instance.manufactoryID,
      'chemicalDrugID': instance.chemicalDrugID,
      'genericDrugID': instance.genericDrugID,
      'dosageFormID': instance.dosageFormID,
      'licenseNumber': instance.licenseNumber,
      'licenseDate': instance.licenseDate,
    };
