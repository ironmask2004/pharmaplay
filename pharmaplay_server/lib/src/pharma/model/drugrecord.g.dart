// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugrecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugRecord _$DrugRecordFromJson(Map<String, dynamic> json) => DrugRecord(
      drug: Drug.fromJson(json['drug'] as Map<String, dynamic>),
      genericDrug:
          GenericDrug.fromJson(json['genericDrug'] as Map<String, dynamic>),
      chemicalDrug:
          ChemicalDrug.fromJson(json['chemicalDrug'] as Map<String, dynamic>),
      manufactory:
          Manufactory.fromJson(json['manufactory'] as Map<String, dynamic>),
      dosageForm:
          DosageForm.fromJson(json['dosageForm'] as Map<String, dynamic>),
      drugClass: DrugClass.fromJson(json['drugClass'] as Map<String, dynamic>),
      drugFamily:
          DrugFamily.fromJson(json['drugFamily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DrugRecordToJson(DrugRecord instance) =>
    <String, dynamic>{
      'drug': instance.drug.toJson(),
      'genericDrug': instance.genericDrug.toJson(),
      'chemicalDrug': instance.chemicalDrug.toJson(),
      'manufactory': instance.manufactory.toJson(),
      'dosageForm': instance.dosageForm.toJson(),
      'drugClass': instance.drugClass.toJson(),
      'drugFamily': instance.drugFamily.toJson(),
    };
