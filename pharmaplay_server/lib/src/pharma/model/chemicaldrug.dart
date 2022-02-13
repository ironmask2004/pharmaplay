import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'chemicaldrug.g.dart';

@JsonSerializable(explicitToJson: true)
class ChemicalDrug extends Equatable {
  final int chemicalDrugID;
  final String ar__chemicalDrugName;
  final String en__chemicalDrugName;

  ChemicalDrug({
    required this.chemicalDrugID,
    required this.ar__chemicalDrugName,
    required this.en__chemicalDrugName,
  });

  factory ChemicalDrug.fromJson(Map<String, dynamic> json) =>
      _$ChemicalDrugFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChemicalDrugToJson(this);

  ChemicalDrug copyWith({
    int? chemicalDrugID,
    String? ar__chemicalDrugName,
    String? en__chemicalDrugName,
  }) {
    return ChemicalDrug(
      chemicalDrugID: chemicalDrugID ?? this.chemicalDrugID,
      ar__chemicalDrugName: ar__chemicalDrugName ?? this.ar__chemicalDrugName,
      en__chemicalDrugName: en__chemicalDrugName ?? this.en__chemicalDrugName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chemicalDrugID': chemicalDrugID,
      'ar__chemicalDrugName': ar__chemicalDrugName,
      'en__chemicalDrugName': en__chemicalDrugName,
    };
  }

  factory ChemicalDrug.fromMap(Map<String, dynamic> map) {
    return ChemicalDrug(
      chemicalDrugID: map['chemicalDrugID']?.toInt() ?? 0,
      ar__chemicalDrugName: map['ar__chemicalDrugName'] ?? '',
      en__chemicalDrugName: map['en__chemicalDrugName'] ?? '',
    );
  }

  @override
  String toString() =>
      'ChemicalDrug(chemicalDrugID: $chemicalDrugID, ar__chemicalDrugName: $ar__chemicalDrugName, en__chemicalDrugName: $en__chemicalDrugName)';

  @override
  List<Object> get props =>
      [chemicalDrugID, ar__chemicalDrugName, en__chemicalDrugName];
}
