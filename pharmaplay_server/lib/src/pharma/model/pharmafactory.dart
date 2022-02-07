import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'pharmafactory.g.dart';

@JsonSerializable(explicitToJson: true)
class PharmaFactory extends Equatable {
  final int factoryID;
  final String factoryName;
  PharmaFactory({
    required this.factoryID,
    required this.factoryName,
  });

  factory PharmaFactory.fromJson(Map<String, dynamic> json) =>
      _$PharmaFactoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PharmaFactoryToJson(this);

  PharmaFactory copyWith({
    int? factoryID,
    String? factoryName,
  }) {
    return PharmaFactory(
      factoryID: factoryID ?? this.factoryID,
      factoryName: factoryName ?? this.factoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'factoryID': factoryID,
      'factoryName': factoryName,
    };
  }

  factory PharmaFactory.fromMap(Map<String, dynamic> map) {
    return PharmaFactory(
      factoryID: map['factoryID']?.toInt() ?? 0,
      factoryName: map['factoryName'] ?? '',
    );
  }

  @override
  String toString() =>
      'PharmaFactory(factoryID: $factoryID, factoryName: $factoryName)';

  @override
  List<Object> get props => [factoryID, factoryName];
}
