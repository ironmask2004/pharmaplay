import 'package:pharma_shared_models/pharma_shared_models.dart';

part 'drugrecord.g.dart';

@JsonSerializable(explicitToJson: true)
class DrugRecord extends Equatable {
  final Drug drug;
  final GenericDrug genericDrug;
  final ChemicalDrug chemicalDrug;
  final Manufactory manufactory;
  final DosageForm dosageForm;
  final DrugClass drugClass;
  final DrugGroup drugGroup;
  final DrugFamily drugFamily;
  DrugRecord({
    required this.drug,
    required this.genericDrug,
    required this.chemicalDrug,
    required this.manufactory,
    required this.dosageForm,
    required this.drugClass,
    required this.drugGroup,
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
    DrugGroup? drugGroup,
    DrugFamily? drugFamily,
  }) {
    return DrugRecord(
      drug: drug ?? this.drug,
      genericDrug: genericDrug ?? this.genericDrug,
      chemicalDrug: chemicalDrug ?? this.chemicalDrug,
      manufactory: manufactory ?? this.manufactory,
      dosageForm: dosageForm ?? this.dosageForm,
      drugClass: drugClass ?? this.drugClass,
      drugGroup: drugGroup ?? this.drugGroup,
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
      'drugGroup': drugGroup.toMap(),
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
      drugGroup: DrugGroup.fromMap(map['drugGroup']),
      drugFamily: DrugFamily.fromMap(map['drugFamily']),
    );
  }

  @override
  String toString() {
    return 'DrugRecord(drug: $drug, genericDrug: $genericDrug, chemicalDrug: $chemicalDrug, manufactory: $manufactory, dosageForm: $dosageForm, drugClass: $drugClass, drugGroup: $drugGroup, drugFamily: $drugFamily)';
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
      drugGroup,
      drugFamily,
    ];
  }
}
