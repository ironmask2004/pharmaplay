// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugfamily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugFamily _$DrugFamilyFromJson(Map<String, dynamic> json) => DrugFamily(
      drugFamilyID: json['drugFamilyID'] as int,
      drugClass: DrugClass.fromJson(json['drugClass'] as Map<String, dynamic>),
      drugFamilyName: json['drugFamilyName'] as String,
    );

Map<String, dynamic> _$DrugFamilyToJson(DrugFamily instance) =>
    <String, dynamic>{
      'drugFamilyID': instance.drugFamilyID,
      'drugClass': instance.drugClass.toJson(),
      'drugFamilyName': instance.drugFamilyName,
    };
