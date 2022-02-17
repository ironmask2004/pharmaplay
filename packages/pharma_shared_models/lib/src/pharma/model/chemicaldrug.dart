import 'package:freezed_annotation/freezed_annotation.dart';

part 'chemicaldrug.freezed.dart';
part 'chemicaldrug.g.dart';

@freezed
class ChemicalDrug with _$ChemicalDrug {
  factory ChemicalDrug(
      {required final int chemicalDrugID,
      required final String chemicalDrugName}) = _ChemicalDrug;

  factory ChemicalDrug.fromJson(Map<String, dynamic> json) =>
      _$ChemicalDrugFromJson(json);
}
