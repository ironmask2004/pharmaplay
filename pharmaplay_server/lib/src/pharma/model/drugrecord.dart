import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

import 'chemicaldrug.dart';
import 'dosageform.dart';
import 'genericdrug.dart';
import 'manufactory.dart';

part 'drugrecord.g.dart';

@JsonSerializable(explicitToJson: true)
class DrugRecord extends Equatable {
  final Medicine medicine;
  final Manufactory medicFactory;
  final ChemicalDrug chemicalDrug;
  final GenericDrug genericDrugName;
  final DosageForm dosageForm;
  DrugRecord({
    required this.medicine,
    required this.medicFactory,
    required this.chemicalDrug,
    required this.genericDrugName,
    required this.dosageForm,
  });

  factory DrugRecord.fromJson(Map<String, dynamic> json) =>
      _$DrugRecordFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DrugRecordToJson(this);

  DrugRecord copyWith({
    Medicine? medicine,
    Manufactory? medicFactory,
    ChemicalDrug? chemicalDrug,
    GenericDrug? genericDrugName,
    DosageForm? dosageForm,
  }) {
    return DrugRecord(
      medicine: medicine ?? this.medicine,
      medicFactory: medicFactory ?? this.medicFactory,
      chemicalDrug: chemicalDrug ?? this.chemicalDrug,
      genericDrugName: genericDrugName ?? this.genericDrugName,
      dosageForm: dosageForm ?? this.dosageForm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicine': medicine.toMap(),
      'medicFactory': medicFactory.toMap(),
      'chemicalDrug': chemicalDrug.toMap(),
      'genericDrugName': genericDrugName.toMap(),
      'dosageForm': dosageForm.toMap(),
    };
  }

  factory DrugRecord.fromMap(Map<String, dynamic> map) {
    return DrugRecord(
      medicine: Medicine.fromMap(map['medicine']),
      medicFactory: Manufactory.fromMap(map['medicFactory']),
      chemicalDrug: ChemicalDrug.fromMap(map['chemicalDrug']),
      genericDrugName: GenericDrug.fromMap(map['genericDrugName']),
      dosageForm: DosageForm.fromMap(map['dosageForm']),
    );
  }

  @override
  String toString() {
    return 'DrugRecord(medicine: $medicine, medicFactory: $medicFactory, chemicalDrug: $chemicalDrug, genericDrugName: $genericDrugName, dosageForm: $dosageForm)';
  }

  @override
  List<Object> get props {
    return [
      medicine,
      medicFactory,
      chemicalDrug,
      genericDrugName,
      dosageForm,
    ];
  }
}
