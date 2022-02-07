import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'chemicalname.g.dart';

@JsonSerializable(explicitToJson: true)
class ChemicalName extends Equatable {
  final int chemicalNameID;
  final String chemicalName;
  ChemicalName({
    required this.chemicalNameID,
    required this.chemicalName,
  });

  factory ChemicalName.fromJson(Map<String, dynamic> json) =>
      _$ChemicalNameFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChemicalNameToJson(this);

  ChemicalName copyWith({
    int? chemicalNameID,
    String? chemicalName,
  }) {
    return ChemicalName(
      chemicalNameID: chemicalNameID ?? this.chemicalNameID,
      chemicalName: chemicalName ?? this.chemicalName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chemicalNameID': chemicalNameID,
      'chemicalName': chemicalName,
    };
  }

  factory ChemicalName.fromMap(Map<String, dynamic> map) {
    return ChemicalName(
      chemicalNameID: map['chemicalNameID']?.toInt() ?? 0,
      chemicalName: map['chemicalName'] ?? '',
    );
  }

  @override
  String toString() =>
      'ChemicalName(chemicalNameID: $chemicalNameID, chemicalName: $chemicalName)';

  @override
  List<Object> get props => [chemicalNameID, chemicalName];
}
