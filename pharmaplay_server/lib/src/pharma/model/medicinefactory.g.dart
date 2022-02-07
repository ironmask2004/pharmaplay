// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicinefactory.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineFactory _$MedicineFactoryFromJson(Map<String, dynamic> json) =>
    MedicineFactory(
      medicineFactoryID: json['medicineFactoryID'] as int,
      medicineFactoryName: json['medicineFactoryName'] as String,
    );

Map<String, dynamic> _$MedicineFactoryToJson(MedicineFactory instance) =>
    <String, dynamic>{
      'medicineFactoryID': instance.medicineFactoryID,
      'medicineFactoryName': instance.medicineFactoryName,
    };
