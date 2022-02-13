// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genericdrug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericDrug _$GenericDrugFromJson(Map<String, dynamic> json) => GenericDrug(
      genericDrugID: json['genericDrugID'] as int,
      en__genericDrugName: json['en__genericDrugName'] as String,
      ar__genericDrugName: json['ar__genericDrugName'] as String,
    );

Map<String, dynamic> _$GenericDrugToJson(GenericDrug instance) =>
    <String, dynamic>{
      'genericDrugID': instance.genericDrugID,
      'en__genericDrugName': instance.en__genericDrugName,
      'ar__genericDrugName': instance.ar__genericDrugName,
    };
