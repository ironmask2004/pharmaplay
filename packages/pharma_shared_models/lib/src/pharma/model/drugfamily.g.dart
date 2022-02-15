// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugfamily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugFamily _$DrugFamilyFromJson(Map<String, dynamic> json) => DrugFamily(
      drugFamilyID: json['drugFamilyID'] as int,
      drugClassID: json['drugClassID'] as int,
      drugFamilyName: json['drugFamilyName'] as String,
    );

Map<String, dynamic> _$DrugFamilyToJson(DrugFamily instance) =>
    <String, dynamic>{
      'drugFamilyID': instance.drugFamilyID,
      'drugClassID': instance.drugClassID,
      'drugFamilyName': instance.drugFamilyName,
    };
