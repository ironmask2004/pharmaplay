import 'dart:convert';

import 'package:equatable/equatable.dart';

class TafqeetUnit extends Equatable {
  final String country;
  final String unit;
  final String unitMultiple;
  final String unitPlural;
  final String unitGender;
  final int currncyFrcDigits;
  final String unitFrc;
  final String unitFrcMultiple;
  final String unitFrcPlural;
  final String unitFrcGender;
  TafqeetUnit({
    required this.unit,
    required this.unitMultiple,
    required this.unitPlural,
    required this.unitGender,
    required this.currncyFrcDigits,
    required this.unitFrc,
    required this.unitFrcMultiple,
    required this.unitFrcPlural,
    required this.unitFrcGender,
    required this.country,
  });

  TafqeetUnit copyWith({
    String? unit,
    String? unitMultiple,
    String? unitPlural,
    String? unitGender,
    int? currncyFrcDigits,
    String? unitFrc,
    String? unitFrcMultiple,
    String? unitFrcPlural,
    String? unitFrcGender,
    String? country,
  }) {
    return TafqeetUnit(
      unit: unit ?? this.unit,
      unitMultiple: unitMultiple ?? this.unitMultiple,
      unitPlural: unitPlural ?? this.unitPlural,
      unitGender: unitGender ?? this.unitGender,
      currncyFrcDigits: currncyFrcDigits ?? this.currncyFrcDigits,
      unitFrc: unitFrc ?? this.unitFrc,
      unitFrcMultiple: unitFrcMultiple ?? this.unitFrcMultiple,
      unitFrcPlural: unitFrcPlural ?? this.unitFrcPlural,
      unitFrcGender: unitFrcGender ?? this.unitFrcGender,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'unit': unit});
    result.addAll({'unitMultiple': unitMultiple});
    result.addAll({'unitPlural': unitPlural});
    result.addAll({'unitGender': unitGender});
    result.addAll({'currncyFrcDigits': currncyFrcDigits});
    result.addAll({'unitFrc': unitFrc});
    result.addAll({'unitFrcMultiple': unitFrcMultiple});
    result.addAll({'unitFrcPlural': unitFrcPlural});
    result.addAll({'unitFrcGender': unitFrcGender});
    result.addAll({'country': country});

    return result;
  }

  factory TafqeetUnit.fromMap(Map<String, dynamic> map) {
    return TafqeetUnit(
      unit: map['unit'] ?? '',
      unitMultiple: map['unitMultiple'] ?? '',
      unitPlural: map['unitPlural'] ?? '',
      unitGender: map['unitGender'] ?? '',
      currncyFrcDigits: map['currncyFrcDigits']?.toInt() ?? 0,
      unitFrc: map['unitFrc'] ?? '',
      unitFrcMultiple: map['unitFrcMultiple'] ?? '',
      unitFrcPlural: map['unitFrcPlural'] ?? '',
      unitFrcGender: map['unitFrcGender'] ?? '',
      country: map['country'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TafqeetUnit.fromJson(String source) =>
      TafqeetUnit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TafqeetUnit(unit: $unit, unitMultiple: $unitMultiple, unitPlural: $unitPlural, unitGender: $unitGender, currncyFrcDigits: $currncyFrcDigits, unitFrc: $unitFrc, unitFrcMultiple: $unitFrcMultiple, unitFrcPlural: $unitFrcPlural, unitFrcGender: $unitFrcGender, country: $country)';
  }

  @override
  List<Object> get props {
    return [
      unit,
      unitMultiple,
      unitPlural,
      unitGender,
      currncyFrcDigits,
      unitFrc,
      unitFrcMultiple,
      unitFrcPlural,
      unitFrcGender,
      country,
    ];
  }
}
