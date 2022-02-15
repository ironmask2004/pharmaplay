import 'package:pharma_shared_models/pharma_shared_models.dart';

part 'manufactory.g.dart';

@JsonSerializable(explicitToJson: true)
class Manufactory extends Equatable {
  final int manufactoryID;
  final String manufactoryName;
  Manufactory({
    required this.manufactoryID,
    required this.manufactoryName,
  });

  factory Manufactory.fromJson(Map<String, dynamic> json) =>
      _$ManufactoryFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ManufactoryToJson(this);

  Manufactory copyWith({
    int? manufactoryID,
    String? manufactoryName,
  }) {
    return Manufactory(
      manufactoryID: manufactoryID ?? this.manufactoryID,
      manufactoryName: manufactoryName ?? this.manufactoryName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'manufactoryID': manufactoryID,
      'manufactoryName': manufactoryName,
    };
  }

  factory Manufactory.fromMap(Map<String, dynamic> map) {
    return Manufactory(
      manufactoryID: map['manufactoryID']?.toInt() ?? 0,
      manufactoryName: map['manufactoryName'] ?? '',
    );
  }

  @override
  String toString() =>
      'Manufactory(manufactoryID: $manufactoryID, manufactoryName: $manufactoryName)';

  @override
  List<Object> get props => [manufactoryID, manufactoryName];
}
