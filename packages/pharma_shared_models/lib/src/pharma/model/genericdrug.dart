import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharma_shared_models/pharma_shared_models.dart';

part 'genericdrug.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericDrug extends Equatable {
  final int genericDrugID;
  final String genericDrugName;
  GenericDrug({
    required this.genericDrugID,
    required this.genericDrugName,
  });

  factory GenericDrug.fromJson(Map<String, dynamic> json) =>
      _$GenericDrugFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GenericDrugToJson(this);

  GenericDrug copyWith({
    int? genericDrugID,
    String? genericDrugName,
  }) {
    return GenericDrug(
      genericDrugID: genericDrugID ?? this.genericDrugID,
      genericDrugName: genericDrugName ?? this.genericDrugName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genericDrugID': genericDrugID,
      'genericDrugName': genericDrugName,
    };
  }

  factory GenericDrug.fromMap(Map<String, dynamic> map) {
    return GenericDrug(
      genericDrugID: map['genericDrugID']?.toInt() ?? 0,
      genericDrugName: map['genericDrugName'] ?? '',
    );
  }

  @override
  String toString() =>
      'GenericDrug(genericDrugID: $genericDrugID, genericDrugName: $genericDrugName)';

  @override
  List<Object> get props => [genericDrugID, genericDrugName];
}
