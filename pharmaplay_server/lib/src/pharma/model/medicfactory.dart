import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'medicfactory.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicFactory extends Equatable {
  final int medicFactoryID;
  final String medicFactoryName;
  MedicFactory({
    required this.medicFactoryID,
    required this.medicFactoryName,
  });

  factory MedicFactory.fromJson(Map<String, dynamic> json) =>
      _$MedicFactoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MedicFactoryToJson(this);

  MedicFactory copyWith({
    int? medicFactoryID,
    String? medicFactoryName,
  }) {
    return MedicFactory(
      medicFactoryID: medicFactoryID ?? this.medicFactoryID,
      medicFactoryName: medicFactoryName ?? this.medicFactoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicFactoryID': medicFactoryID,
      'medicFactoryName': medicFactoryName,
    };
  }

  factory MedicFactory.fromMap(Map<String, dynamic> map) {
    return MedicFactory(
      medicFactoryID: map['medicFactoryID']?.toInt() ?? 0,
      medicFactoryName: map['medicFactoryName'] ?? '',
    );
  }

  @override
  String toString() =>
      'MedicFactory(medicFactoryID: $medicFactoryID, medicFactoryName: $medicFactoryName)';

  @override
  List<Object> get props => [medicFactoryID, medicFactoryName];
}
