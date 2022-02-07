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
      formula: json['formula'] as String,
      factoryID: json['factoryID'] as int,
      factoryName: json['factoryName'] as String,
      chemicalNameID: json['chemicalNameID'] as int,
      chemicalName: json['chemicalName'] as String,
      genericnameID: json['genericnameID'] as int,
      genericname: json['genericname'] as String,
      pharmaFormID: json['pharmaFormID'] as int,
      pharmaForm: json['pharmaForm'] as String,
      licenseNumber: json['licenseNumber'] as String,
      licenseDate: json['licenseDate'] as String,
    );

Map<String, dynamic> _$MedicineToJson(Medicine instance) => <String, dynamic>{
      'medicineID': instance.medicineID,
      'tradename': instance.tradename,
      'caliber': instance.caliber,
      'formulaID': instance.formulaID,
      'formula': instance.formula,
      'factoryID': instance.factoryID,
      'factoryName': instance.factoryName,
      'chemicalNameID': instance.chemicalNameID,
      'chemicalName': instance.chemicalName,
      'genericnameID': instance.genericnameID,
      'genericname': instance.genericname,
      'pharmaFormID': instance.pharmaFormID,
      'pharmaForm': instance.pharmaForm,
      'licenseNumber': instance.licenseNumber,
      'licenseDate': instance.licenseDate,
    };
