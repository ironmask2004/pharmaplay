import 'package:freezed_annotation/freezed_annotation.dart';

part 'drugfamily.freezed.dart';
part 'drugfamily.g.dart';

@freezed
class DrugFamily with _$DrugFamily {
  factory DrugFamily(
      {required final int drugFamilyID,
      required final int drugClassID,
      required final String drugFamilyName}) = _DrugFamily;

  factory DrugFamily.fromJson(Map<String, dynamic> json) =>
      _$DrugFamilyFromJson(json);
}
