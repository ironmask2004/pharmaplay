// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugrecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DrugRecord _$$_DrugRecordFromJson(Map<String, dynamic> json) =>
    _$_DrugRecord(
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
      drugGroup: DrugGroup.fromJson(json['drugGroup'] as Map<String, dynamic>),
      drugFamily:
          DrugFamily.fromJson(json['drugFamily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DrugRecordToJson(_$_DrugRecord instance) =>
    <String, dynamic>{
      'drug': instance.drug,
      'genericDrug': instance.genericDrug,
      'chemicalDrug': instance.chemicalDrug,
      'manufactory': instance.manufactory,
      'dosageForm': instance.dosageForm,
      'drugClass': instance.drugClass,
      'drugGroup': instance.drugGroup,
      'drugFamily': instance.drugFamily,
    };
