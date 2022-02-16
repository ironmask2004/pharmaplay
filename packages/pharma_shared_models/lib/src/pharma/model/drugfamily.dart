import 'package:pharma_shared_models/pharma_shared_models.dart';

part 'drugfamily.g.dart';

@JsonSerializable(explicitToJson: true)
class DrugFamily extends Equatable {
  final int drugFamilyID;
  final int drugClassID;
  final String drugFamilyName;
  DrugFamily({
    required this.drugFamilyID,
    required this.drugClassID,
    required this.drugFamilyName,
  });

  factory DrugFamily.fromJson(Map<String, dynamic> json) =>
      _$DrugFamilyFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DrugFamilyToJson(this);

  DrugFamily copyWith({
    int? drugFamilyID,
    int? drugClassID,
    String? drugFamilyName,
  }) {
    return DrugFamily(
      drugFamilyID: drugFamilyID ?? this.drugFamilyID,
      drugClassID: drugClassID ?? this.drugClassID,
      drugFamilyName: drugFamilyName ?? this.drugFamilyName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drugFamilyID': drugFamilyID,
      'drugClassID': drugClassID,
      'drugFamilyName': drugFamilyName,
    };
  }

  factory DrugFamily.fromMap(Map<String, dynamic> map) {
    return DrugFamily(
      drugFamilyID: map['drugFamilyID']?.toInt() ?? 0,
      drugClassID: map['drugClassID']?.toInt() ?? 0,
      drugFamilyName: map['drugFamilyName'] ?? '',
    );
  }

  @override
  String toString() =>
      'DrugFamily(drugFamilyID: $drugFamilyID, drugClassID: $drugClassID, drugFamilyName: $drugFamilyName)';

  @override
  List<Object> get props => [drugFamilyID, drugClassID, drugFamilyName];
}
