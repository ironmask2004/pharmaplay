import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'formula.g.dart';

@JsonSerializable(explicitToJson: true)
class Formula extends Equatable {
  final int formulaID;
  final String formulaName;
  Formula({
    required this.formulaID,
    required this.formulaName,
  });

  factory Formula.fromJson(Map<String, dynamic> json) =>
      _$FormulaFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$FormulaToJson(this);

  Formula copyWith({
    int? formulaID,
    String? formulaName,
  }) {
    return Formula(
      formulaID: formulaID ?? this.formulaID,
      formulaName: formulaName ?? this.formulaName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'formulaID': formulaID,
      'formulaName': formulaName,
    };
  }

  factory Formula.fromMap(Map<String, dynamic> map) {
    return Formula(
      formulaID: map['formulaID']?.toInt() ?? 0,
      formulaName: map['formulaName'] ?? '',
    );
  }

  @override
  String toString() =>
      'Formula(formulaID: $formulaID, formulaName: $formulaName)';

  @override
  List<Object> get props => [formulaID, formulaName];
}
