// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugfamily.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DrugFamily _$$_DrugFamilyFromJson(Map<String, dynamic> json) =>
    _$_DrugFamily(
      drugFamilyID: json['drugFamilyID'] as int,
      drugClassID: json['drugClassID'] as int,
      drugFamilyName: json['drugFamilyName'] as String,
    );

Map<String, dynamic> _$$_DrugFamilyToJson(_$_DrugFamily instance) =>
    <String, dynamic>{
      'drugFamilyID': instance.drugFamilyID,
      'drugClassID': instance.drugClassID,
      'drugFamilyName': instance.drugFamilyName,
    };
