import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'medicinefactory.g.dart';

@JsonSerializable(explicitToJson: true)
class MedicineFactory extends Equatable {
  final int medicineFactoryID;
  final String medicineFactoryName;
  MedicineFactory({
    required this.medicineFactoryID,
    required this.medicineFactoryName,
  });

  factory MedicineFactory.fromJson(Map<String, dynamic> json) =>
      _$MedicineFactoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MedicineFactoryToJson(this);

  MedicineFactory copyWith({
    int? medicineFactoryID,
    String? medicineFactoryName,
  }) {
    return MedicineFactory(
      medicineFactoryID: medicineFactoryID ?? this.medicineFactoryID,
      medicineFactoryName: medicineFactoryName ?? this.medicineFactoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'medicineFactoryID': medicineFactoryID,
      'medicineFactoryName': medicineFactoryName,
    };
  }

  factory MedicineFactory.fromMap(Map<String, dynamic> map) {
    return MedicineFactory(
      medicineFactoryID: map['medicineFactoryID']?.toInt() ?? 0,
      medicineFactoryName: map['medicineFactoryName'] ?? '',
    );
  }

  @override
  String toString() =>
      'MedicineFactory(medicineFactoryID: $medicineFactoryID, medicineFactoryName: $medicineFactoryName)';

  @override
  List<Object> get props => [medicineFactoryID, medicineFactoryName];
}
