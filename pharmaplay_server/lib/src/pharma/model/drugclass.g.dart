// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drugclass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugClass _$DrugClassFromJson(Map<String, dynamic> json) => DrugClass(
      drugClassID: json['drugClassID'] as int,
      drugGroup: DrugGroup.fromJson(json['drugGroup'] as Map<String, dynamic>),
      drugClassName: json['drugClassName'] as String,
    );

Map<String, dynamic> _$DrugClassToJson(DrugClass instance) => <String, dynamic>{
      'drugClassID': instance.drugClassID,
      'drugGroup': instance.drugGroup.toJson(),
      'drugClassName': instance.drugClassName,
    };
