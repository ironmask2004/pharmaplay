import 'package:freezed_annotation/freezed_annotation.dart';

part 'manufactory.freezed.dart';
part 'manufactory.g.dart';

@freezed
class Manufactory with _$Manufactory {
  factory Manufactory(
      {required final int manufactoryID,
      required final String manufactoryName}) = _Manufactory;

  factory Manufactory.fromJson(Map<String, dynamic> json) =>
      _$ManufactoryFromJson(json);
}
