// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Medicine _$MedicineFromJson(Map<String, dynamic> json) => Medicine(
      medicineID: json['medicineID'] as int,
      tradename: json['tradename'] as String,
      caliber: json['caliber'] as String,
      formulaID: json['formulaID'] as int,
      medicineFactoryID: json['medicineFactoryID'] as int,
      chemicalNameID: json['chemicalNameID'] as int,
      genericNameID: json['genericNameID'] as int,
      pharmaFormID: json['pharmaFormID'] as int,
      licenseNumber: json['licenseNumber'] as String,
      licenseDate: json['licenseDate'] as String,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'medicineID': instance.medicineID,
      'tradename': instance.tradename,
      'caliber': instance.caliber,
      'formulaID': instance.formulaID,
      'medicineFactoryID': instance.medicineFactoryID,
      'chemicalNameID': instance.chemicalNameID,
      'genericNameID': instance.genericNameID,
      'pharmaFormID': instance.pharmaFormID,
      'licenseNumber': instance.licenseNumber,
      'licenseDate': instance.licenseDate,
    };
