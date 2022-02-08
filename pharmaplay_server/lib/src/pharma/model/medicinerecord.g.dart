// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicinerecord.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineRecord _$MedicineRecordFromJson(Map<String, dynamic> json) =>
    MedicineRecord(
      medicine: Medicine.fromJson(json['medicine'] as Map<String, dynamic>),
      medicFactory:
          MedicFactory.fromJson(json['medicFactory'] as Map<String, dynamic>),
      chemicalName:
          ChemicalName.fromJson(json['chemicalName'] as Map<String, dynamic>),
      genericName:
          GenericName.fromJson(json['genericName'] as Map<String, dynamic>),
      pharmaForm:
          PharmaForm.fromJson(json['pharmaForm'] as Map<String, dynamic>),
      formula: Formula.fromJson(json['formula'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MedicineRecordToJson(MedicineRecord instance) =>
    <String, dynamic>{
      'medicine': instance.medicine.toJson(),
      'medicFactory': instance.medicFactory.toJson(),
      'chemicalName': instance.chemicalName.toJson(),
      'genericName': instance.genericName.toJson(),
      'pharmaForm': instance.pharmaForm.toJson(),
      'formula': instance.formula.toJson(),
    };
