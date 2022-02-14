// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugClass _$DrugClassFromJson(Map<String, dynamic> json) => DrugClass(
      drugClassID: json['drugClassID'] as int,
      drugGroupID: json['drugGroupID'] as int,
      drugClassName: json['drugClassName'] as String,
    );

Map<String, dynamic> _$DrugClassToJson(DrugClass instance) => <String, dynamic>{
      'drugClassID': instance.drugClassID,
      'drugGroupID': instance.drugGroupID,
      'drugClassName': instance.drugClassName,
    };
