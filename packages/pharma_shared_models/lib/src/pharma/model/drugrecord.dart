import 'package:pharma_shared_models/pharma_shared_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
//import 'package:flutter/foundation.dart';

part 'drugrecord.freezed.dart';
part 'drugrecord.g.dart';

@freezed
class DrugRecord with _$DrugRecord {
  factory DrugRecord(
      {required final Drug drug,
      required final GenericDrug genericDrug,
      required final ChemicalDrug chemicalDrug,
      required final Manufactory manufactory,
      required final DosageForm dosageForm,
      required final DrugClass drugClass,
      required final DrugGroup drugGroup,
      required final DrugFamily drugFamily}) = _DrugRecord;

  //factory DrugRecord.blank() => DrugRecord();

  factory DrugRecord.fromJson(Map<String, dynamic> json) =>
      _$DrugRecordFromJson(json);

  factory DrugRecord.blank() => DrugRecord(
      drug: Drug.blank(),
      genericDrug: GenericDrug.blank(),
      chemicalDrug: ChemicalDrug.bank(),
      manufactory: Manufactory.blank(),
      dosageForm: DosageForm.blank(),
      drugClass: DrugClass.blank(),
      drugGroup: DrugGroup.blank(),
      drugFamily: DrugFamily.blank());
}
