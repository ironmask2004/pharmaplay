import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'genericdrug.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericDrug extends Equatable {
  final int genericDrugID;
  final String en__genericDrugName;
  final String ar__genericDrugName;
  GenericDrug({
    required this.genericDrugID,
    required this.en__genericDrugName,
    required this.ar__genericDrugName,
  });

  factory GenericDrug.fromJson(Map<String, dynamic> json) =>
      _$GenericDrugFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GenericDrugToJson(this);

  GenericDrug copyWith({
    int? genericDrugID,
    String? en__genericDrugName,
    String? ar__genericDrugName,
  }) {
    return GenericDrug(
      genericDrugID: genericDrugID ?? this.genericDrugID,
      en__genericDrugName: en__genericDrugName ?? this.en__genericDrugName,
      ar__genericDrugName: ar__genericDrugName ?? this.ar__genericDrugName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genericDrugID': genericDrugID,
      'en__genericDrugName': en__genericDrugName,
      'ar__genericDrugName': ar__genericDrugName,
    };
  }

  factory GenericDrug.fromMap(Map<String, dynamic> map) {
    return GenericDrug(
      genericDrugID: map['genericDrugID']?.toInt() ?? 0,
      en__genericDrugName: map['en__genericDrugName'] ?? '',
      ar__genericDrugName: map['ar__genericDrugName'] ?? '',
    );
  }

  @override
  String toString() =>
      'GenericDrug(genericDrugID: $genericDrugID, en__genericDrugName: $en__genericDrugName, ar__genericDrugName: $ar__genericDrugName)';

  @override
  List<Object> get props =>
      [genericDrugID, en__genericDrugName, ar__genericDrugName];
}
