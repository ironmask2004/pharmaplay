import 'package:pharma_shared_models/pharma_shared_models.dart';

part 'chemicaldrug.g.dart';

@JsonSerializable(explicitToJson: true)
class ChemicalDrug extends Equatable {
  final int chemicalDrugID;
  final String chemicalDrugName;

  ChemicalDrug({
    required this.chemicalDrugID,
    required this.chemicalDrugName,
  });

  factory ChemicalDrug.fromJson(Map<String, dynamic> json) =>
      _$ChemicalDrugFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChemicalDrugToJson(this);

  ChemicalDrug copyWith({
    int? chemicalDrugID,
    String? chemicalDrugName,
  }) {
    return ChemicalDrug(
      chemicalDrugID: chemicalDrugID ?? this.chemicalDrugID,
      chemicalDrugName: chemicalDrugName ?? this.chemicalDrugName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chemicalDrugID': chemicalDrugID,
      'chemicalDrugName': chemicalDrugName,
    };
  }

  factory ChemicalDrug.fromMap(Map<String, dynamic> map) {
    return ChemicalDrug(
      chemicalDrugID: map['chemicalDrugID']?.toInt() ?? 0,
      chemicalDrugName: map['chemicalDrugName'] ?? '',
    );
  }
  @override
  String toString() =>
      'ChemicalDrug(chemicalDrugID: $chemicalDrugID, chemicalDrugName: $chemicalDrugName)';

  @override
  List<Object> get props => [chemicalDrugID, chemicalDrugName];
}
