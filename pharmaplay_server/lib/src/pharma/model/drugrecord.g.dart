// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugrecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugRecord _$DrugRecordFromJson(Map<String, dynamic> json) => DrugRecord(
      medicine: Medicine.fromJson(json['medicine'] as Map<String, dynamic>),
      medicFactory:
          Manufactory.fromJson(json['medicFactory'] as Map<String, dynamic>),
      chemicalDrug:
          ChemicalDrug.fromJson(json['chemicalDrug'] as Map<String, dynamic>),
      genericDrugName:
          GenericDrug.fromJson(json['genericDrugName'] as Map<String, dynamic>),
      dosageForm:
          DosageForm.fromJson(json['dosageForm'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DrugRecordToJson(DrugRecord instance) =>
    <String, dynamic>{
      'medicine': instance.medicine.toJson(),
      'medicFactory': instance.medicFactory.toJson(),
      'chemicalDrug': instance.chemicalDrug.toJson(),
      'genericDrugName': instance.genericDrugName.toJson(),
      'dosageForm': instance.dosageForm.toJson(),
    };
