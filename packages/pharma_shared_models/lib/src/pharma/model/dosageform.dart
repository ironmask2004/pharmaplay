import 'package:freezed_annotation/freezed_annotation.dart';

part 'dosageform.freezed.dart';
part 'dosageform.g.dart';

@freezed
class DosageForm with _$DosageForm {
  factory DosageForm({
    required int dosageFormID,
    required String dosageForm,
  }) = _Dosageform;

  factory DosageForm.blank() => DosageForm(dosageFormID: 0, dosageForm: '');

  factory DosageForm.fromJson(Map<String, dynamic> json) =>
      _$DosageFormFromJson(json);
}
