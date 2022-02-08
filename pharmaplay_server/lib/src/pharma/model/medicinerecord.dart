import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/pharma/model/formula.dart';

import 'chemicalname.dart';
import 'genericname.dart';
import 'medicfactory.dart';
import 'pharmaform.dart';

part 'medicinerecord.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicineRecord extends Equatable {
  final Medicine medicine;
  final MedicFactory medicFactory;
  final ChemicalName chemicalName;
  final GenericName genericName;
  final PharmaForm pharmaForm;
  final Formula formula;
  MedicineRecord({
    required this.medicine,
    required this.medicFactory,
    required this.chemicalName,
    required this.genericName,
    required this.pharmaForm,
    required this.formula,
  });

  factory MedicineRecord.fromJson(Map<String, dynamic> json) =>
      _$MedicineRecordFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MedicineRecordToJson(this);

  MedicineRecord copyWith({
    Medicine? medicine,
    MedicFactory? medicFactory,
    ChemicalName? chemicalName,
    GenericName? genericName,
    PharmaForm? pharmaForm,
    Formula? formula,
  }) {
    return MedicineRecord(
      medicine: medicine ?? this.medicine,
      medicFactory: medicFactory ?? this.medicFactory,
      chemicalName: chemicalName ?? this.chemicalName,
      genericName: genericName ?? this.genericName,
      pharmaForm: pharmaForm ?? this.pharmaForm,
      formula: formula ?? this.formula,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicine': medicine.toMap(),
      'medicFactory': medicFactory.toMap(),
      'chemicalName': chemicalName.toMap(),
      'genericName': genericName.toMap(),
      'pharmaForm': pharmaForm.toMap(),
      'formula': formula.toMap(),
    };
  }

  factory MedicineRecord.fromMap(Map<String, dynamic> map) {
    return MedicineRecord(
      medicine: Medicine.fromMap(map['medicine']),
      medicFactory: MedicFactory.fromMap(map['medicFactory']),
      chemicalName: ChemicalName.fromMap(map['chemicalName']),
      genericName: GenericName.fromMap(map['genericName']),
      pharmaForm: PharmaForm.fromMap(map['pharmaForm']),
      formula: Formula.fromMap(map['formula']),
    );
  }

  @override
  String toString() {
    return 'MedicineRecord(medicine: $medicine, medicFactory: $medicFactory, chemicalName: $chemicalName, genericName: $genericName, pharmaForm: $pharmaForm, formula: $formula)';
  }

  @override
  List<Object> get props {
    return [
      medicine,
      medicFactory,
      chemicalName,
      genericName,
      pharmaForm,
      formula,
    ];
  }
}
