// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
      drugID: json['drugID'] as int,
      drugNo: json['drugNo'] as String,
      brandName: json['brandName'] as String,
      caliber: json['caliber'] as String,
      genericDrugID: json['genericDrugID'] as int,
      chemicalDrugID: json['chemicalDrugID'] as int,
      manufactoryID: json['manufactoryID'] as int,
      dosageFormID: json['dosageFormID'] as int,
      drugClassID: json['drugClassID'] as int,
      drugFamilyID: json['drugFamilyID'] as int,
      licenseNumber: json['licenseNumber'] as String,
      licenseDate: json['licenseDate'] as String,
    );

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'drugID': instance.drugID,
      'drugNo': instance.drugNo,
      'brandName': instance.brandName,
      'caliber': instance.caliber,
      'genericDrugID': instance.genericDrugID,
      'chemicalDrugID': instance.chemicalDrugID,
      'manufactoryID': instance.manufactoryID,
      'dosageFormID': instance.dosageFormID,
      'drugClassID': instance.drugClassID,
      'drugFamilyID': instance.drugFamilyID,
      'licenseNumber': instance.licenseNumber,
      'licenseDate': instance.licenseDate,
    };
