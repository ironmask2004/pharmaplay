import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'drug.g.dart';
/*

CREATE TABLE IF NOT EXISTS pharmaplay.drug
(
  --  "drugNo" character varying(556) COLLATE pg_catalog."default",
   -- "en__brandName" character varying(556) COLLATE pg_catalog."default",
  --  caliber character varying(556) COLLATE pg_catalog."default",
 --   "genericDrugID" integer,
 --   "manufactoryID" integer,
  --  "dosageFormID" integer,
  --  "licenseNumber" character varying(128) COLLATE pg_catalog."default",
--    "licenseDate" character varying(128) COLLATE pg_catalog."default",
  ----   "drugClassID" integer,
  --  "drugFamilyID" integer,
  --  "ar__brandName" character varying(512) COLLATE pg_catalog."default",
   -- "drugID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "chemicalDrugID" integer,
    CONSTRAINT drug_pkey PRIMARY KEY ("drugID")
)


*/

@JsonSerializable(explicitToJson: true)
class Drug extends Equatable {
  final int drugID;
  final String drugNo;
  final String brandName;
  final String caliber;
  final int genericDrugID;
  final int chemicalDrugID;
  final int manufactoryID;
  final int dosageFormID;
  final int drugClassID;
  final int drugFamilyid;
  final String licenseNumber;
  final String licenseDate;
  Drug({
    required this.drugID,
    required this.drugNo,
    required this.brandName,
    required this.caliber,
    required this.genericDrugID,
    required this.chemicalDrugID,
    required this.manufactoryID,
    required this.dosageFormID,
    required this.drugClassID,
    required this.drugFamilyid,
    required this.licenseNumber,
    required this.licenseDate,
  });

  Map<String, dynamic> toJson() => _$DrugToJson(this);
  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);

  Drug copyWith({
    int? drugID,
    String? drugNo,
    String? brandName,
    String? caliber,
    int? genericDrugID,
    int? chemicalDrugID,
    int? manufactoryID,
    int? dosageFormID,
    int? drugClassID,
    int? drugFamilyid,
    String? licenseNumber,
    String? licenseDate,
  }) {
    return Drug(
      drugID: drugID ?? this.drugID,
      drugNo: drugNo ?? this.drugNo,
      brandName: brandName ?? this.brandName,
      caliber: caliber ?? this.caliber,
      genericDrugID: genericDrugID ?? this.genericDrugID,
      chemicalDrugID: chemicalDrugID ?? this.chemicalDrugID,
      manufactoryID: manufactoryID ?? this.manufactoryID,
      dosageFormID: dosageFormID ?? this.dosageFormID,
      drugClassID: drugClassID ?? this.drugClassID,
      drugFamilyid: drugFamilyid ?? this.drugFamilyid,
      licenseNumber: licenseNumber ?? this.licenseNumber,
      licenseDate: licenseDate ?? this.licenseDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drugID': drugID,
      'drugNo': drugNo,
      'brandName': brandName,
      'caliber': caliber,
      'genericDrugID': genericDrugID,
      'chemicalDrugID': chemicalDrugID,
      'manufactoryID': manufactoryID,
      'dosageFormID': dosageFormID,
      'drugClassID': drugClassID,
      'drugFamilyid': drugFamilyid,
      'licenseNumber': licenseNumber,
      'licenseDate': licenseDate,
    };
  }

  factory Drug.fromMap(Map<String, dynamic> map) {
    return Drug(
      drugID: map['drugID']?.toInt() ?? 0,
      drugNo: map['drugNo'] ?? '',
      brandName: map['brandName'] ?? '',
      caliber: map['caliber'] ?? '',
      genericDrugID: map['genericDrugID']?.toInt() ?? 0,
      chemicalDrugID: map['chemicalDrugID']?.toInt() ?? 0,
      manufactoryID: map['manufactoryID']?.toInt() ?? 0,
      dosageFormID: map['dosageFormID']?.toInt() ?? 0,
      drugClassID: map['drugClassID']?.toInt() ?? 0,
      drugFamilyid: map['drugFamilyid']?.toInt() ?? 0,
      licenseNumber: map['licenseNumber'] ?? '',
      licenseDate: map['licenseDate'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Drug(drugID: $drugID, drugNo: $drugNo, brandName: $brandName, caliber: $caliber, genericDrugID: $genericDrugID, chemicalDrugID: $chemicalDrugID, manufactoryID: $manufactoryID, dosageFormID: $dosageFormID, drugClassID: $drugClassID, drugFamilyid: $drugFamilyid, licenseNumber: $licenseNumber, licenseDate: $licenseDate)';
  }

  @override
  List<Object> get props {
    return [
      drugID,
      drugNo,
      brandName,
      caliber,
      genericDrugID,
      chemicalDrugID,
      manufactoryID,
      dosageFormID,
      drugClassID,
      drugFamilyid,
      licenseNumber,
      licenseDate,
    ];
  }
}
