import 'package:freezed_annotation/freezed_annotation.dart';

part 'drugclass.freezed.dart';
part 'drugclass.g.dart';

@freezed
class DrugClass with _$DrugClass {
  factory DrugClass(
      {required final int drugClassID,
      required final int drugGroupID,
      required final String drugClassName}) = _DrugClass;

  factory DrugClass.blank() =>
      DrugClass(drugClassID: 0, drugGroupID: 0, drugClassName: '');
  factory DrugClass.fromJson(Map<String, dynamic> json) =>
      _$DrugClassFromJson(json);
}
