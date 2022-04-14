import 'package:freezed_annotation/freezed_annotation.dart';

part 'genericdrug.freezed.dart';
part 'genericdrug.g.dart';

@freezed
class GenericDrug with _$GenericDrug {
  factory GenericDrug(
      {required final int genericDrugID,
      required final String genericDrugName}) = _GenericDrug;

  factory GenericDrug.blank() =>
      GenericDrug(genericDrugID: 0, genericDrugName: '');
      
  factory GenericDrug.fromJson(Map<String, dynamic> json) =>
      _$GenericDrugFromJson(json);
}
