import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

import 'chemicaldrug.dart';
import 'dosageform.dart';
import 'drugclass.dart';
import 'drugfamily.dart';
import 'genericdrug.dart';
import 'manufactory.dart';

part 'drugrecord.g.dart';
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
 --   "drugGroupID" integer,
 ----   "drugClassID" integer,
  --  "drugFamilyID" integer,
  --  "ar__brandName" character varying(512) COLLATE pg_catalog."default",
   -- "drugID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "chemicalDrugID" integer,
    CONSTRAINT drug_pkey PRIMARY KEY ("drugID")
)


*/

@JsonSerializable(explicitToJson: true)
class DrugRecord extends Equatable {
  final Drug drug;
  final GenericDrug genericDrug;
  final ChemicalDrug chemicalDrug;
  final Manufactory manufactory;
  final DosageForm dosageForm;
  final DrugClass drugClass;
  final DrugFamily drugFamily;
  DrugRecord({
    required this.drug,
    required this.genericDrug,
    required this.chemicalDrug,
    required this.manufactory,
    required this.dosageForm,
    required this.drugClass,
    required this.drugFamily,
  });

  Map<String, dynamic> toJson() => _$DrugRecordToJson(this);
  factory DrugRecord.fromJson(Map<String, dynamic> json) =>
      _$DrugRecordFromJson(json);

  DrugRecord copyWith({
    Drug? drug,
    GenericDrug? genericDrug,
    ChemicalDrug? chemicalDrug,
    Manufactory? manufactory,
    DosageForm? dosageForm,
    DrugClass? drugClass,
    DrugFamily? drugFamily,
  }) {
    return DrugRecord(
      drug: drug ?? this.drug,
      genericDrug: genericDrug ?? this.genericDrug,
      chemicalDrug: chemicalDrug ?? this.chemicalDrug,
      manufactory: manufactory ?? this.manufactory,
      dosageForm: dosageForm ?? this.dosageForm,
      drugClass: drugClass ?? this.drugClass,
      drugFamily: drugFamily ?? this.drugFamily,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drug': drug.toMap(),
      'genericDrug': genericDrug.toMap(),
      'chemicalDrug': chemicalDrug.toMap(),
      'manufactory': manufactory.toMap(),
      'dosageForm': dosageForm.toMap(),
      'drugClass': drugClass.toMap(),
      'drugFamily': drugFamily.toMap(),
    };
  }

  factory DrugRecord.fromMap(Map<String, dynamic> map) {
    return DrugRecord(
      drug: Drug.fromMap(map['drug']),
      genericDrug: GenericDrug.fromMap(map['genericDrug']),
      chemicalDrug: ChemicalDrug.fromMap(map['chemicalDrug']),
      manufactory: Manufactory.fromMap(map['manufactory']),
      dosageForm: DosageForm.fromMap(map['dosageForm']),
      drugClass: DrugClass.fromMap(map['drugClass']),
      drugFamily: DrugFamily.fromMap(map['drugFamily']),
    );
  }

  @override
  String toString() {
    return 'DrugRecord(drug: $drug, genericDrug: $genericDrug, chemicalDrug: $chemicalDrug, manufactory: $manufactory, dosageForm: $dosageForm, drugClass: $drugClass, drugFamily: $drugFamily)';
  }

  @override
  List<Object> get props {
    return [
      drug,
      genericDrug,
      chemicalDrug,
      manufactory,
      dosageForm,
      drugClass,
      drugFamily,
    ];
  }
}
