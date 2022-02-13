import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'dosageform.g.dart';

@JsonSerializable(explicitToJson: true)
class DosageForm extends Equatable {
  final int dosageFormID;
  final String en__dosageForm;
  final String ar__dosageForm;
  DosageForm({
    required this.dosageFormID,
    required this.en__dosageForm,
    required this.ar__dosageForm,
  });

  factory DosageForm.fromJson(Map<String, dynamic> json) =>
      _$DosageFormFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DosageFormToJson(this);

  DosageForm copyWith({
    int? dosageFormID,
    String? en__dosageForm,
    String? ar__dosageForm,
  }) {
    return DosageForm(
      dosageFormID: dosageFormID ?? this.dosageFormID,
      en__dosageForm: en__dosageForm ?? this.en__dosageForm,
      ar__dosageForm: ar__dosageForm ?? this.ar__dosageForm,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dosageFormID': dosageFormID,
      'en__dosageForm': en__dosageForm,
      'ar__dosageForm': ar__dosageForm,
    };
  }

  factory DosageForm.fromMap(Map<String, dynamic> map) {
    return DosageForm(
      dosageFormID: map['dosageFormID']?.toInt() ?? 0,
      en__dosageForm: map['en__dosageForm'] ?? '',
      ar__dosageForm: map['ar__dosageForm'] ?? '',
    );
  }

  @override
  String toString() =>
      'DosageForm(dosageFormID: $dosageFormID, en__dosageForm: $en__dosageForm, ar__dosageForm: $ar__dosageForm)';

  @override
  List<Object> get props => [dosageFormID, en__dosageForm, ar__dosageForm];
}
