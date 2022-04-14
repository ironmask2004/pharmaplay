import 'package:freezed_annotation/freezed_annotation.dart';

part 'druggroup.freezed.dart';
part 'druggroup.g.dart';

@freezed
class DrugGroup with _$DrugGroup {
  factory DrugGroup(
      {required final int drugGroupID,
      required final String drugGroupName}) = _DrugGroup;

  factory DrugGroup.fromJson(Map<String, dynamic> json) =>
      _$DrugGroupFromJson(json);

  factory DrugGroup.blank() => DrugGroup(drugGroupID: 0, drugGroupName: '');
}
