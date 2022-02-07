import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'pharmaform.g.dart';

@JsonSerializable(explicitToJson: true)
class PharmaForm extends Equatable {
  final int pharmaFormID;
  final String pharmaForm;
  PharmaForm({
    required this.pharmaFormID,
    required this.pharmaForm,
  });

  factory PharmaForm.fromJson(Map<String, dynamic> json) =>
      _$PharmaFormFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$PharmaFormToJson(this);

  PharmaForm copyWith({
    int? pharmaFormID,
    String? pharmaForm,
  }) {
    return PharmaForm(
      pharmaFormID: pharmaFormID ?? this.pharmaFormID,
      pharmaForm: pharmaForm ?? this.pharmaForm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'pharmaFormID': pharmaFormID,
      'pharmaForm': pharmaForm,
    };
  }

  factory PharmaForm.fromMap(Map<String, dynamic> map) {
    return PharmaForm(
      pharmaFormID: map['pharmaFormID']?.toInt() ?? 0,
      pharmaForm: map['pharmaForm'] ?? '',
    );
  }

  @override
  String toString() =>
      'PharmaForm(pharmaFormID: $pharmaFormID, pharmaForm: $pharmaForm)';

  @override
  List<Object> get props => [pharmaFormID, pharmaForm];
}
