import 'dart:convert';

import 'package:pharma_shared_models/pharma_shared_models.dart';

part 'dosageform.g.dart';

@JsonSerializable(explicitToJson: true)
class DosageForm extends Equatable {
  final int dosageFormID;
  final String dosageForm;
  DosageForm({
    required this.dosageFormID,
    required this.dosageForm,
  });

  factory DosageForm.fromJson(Map<String, dynamic> json) =>
      _$DosageFormFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DosageFormToJson(this);

  DosageForm copyWith({
    int? dosageFormID,
    String? dosageForm,
  }) {
    return DosageForm(
      dosageFormID: dosageFormID ?? this.dosageFormID,
      dosageForm: dosageForm ?? this.dosageForm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dosageFormID': dosageFormID,
      'dosageForm': dosageForm,
    };
  }

  factory DosageForm.fromMap(Map<String, dynamic> map) {
    return DosageForm(
      dosageFormID: map['dosageFormID']?.toInt() ?? 0,
      dosageForm: map['dosageForm'] ?? '',
    );
  }

  @override
  String toString() =>
      'DosageForm(dosageFormID: $dosageFormID, dosageForm: $dosageForm)';

  @override
  List<Object> get props => [dosageFormID, dosageForm];
}
