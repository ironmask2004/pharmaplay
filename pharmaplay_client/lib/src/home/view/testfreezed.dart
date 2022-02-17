import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'testfreezed.freezed.dart';
part 'testfreezed.g.dart';

@freezed
class TestFreezed with _$TestFreezed {
  factory TestFreezed({String? name, int? age}) = _TestFreezed;

  factory TestFreezed.fromJson(Map<String, dynamic> json) =>
      _$TestFreezedFromJson(json);

  // Map<String, dynamic> toJson() => _$TestFreezedToJson(this);
}
