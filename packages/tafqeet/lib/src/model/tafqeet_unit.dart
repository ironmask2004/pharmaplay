import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tafqeet/src/model/unit_code.dart';

class TafqeetUnit extends Equatable {
  final UnitCode unitCode;
  final String country;
  final String unit;
  final String unitMultiple;
  final String unitPlural;
  final Gender unitGender;
  final int unitPartDigits;
  final String unitPart;
  final String unitPartMultiple;
  final String unitPartPlural;
  final Gender unitPartGender;
  TafqeetUnit({
    required this.unitCode,
    required this.country,
    required this.unit,
    required this.unitMultiple,
    required this.unitPlural,
    required this.unitGender,
    required this.unitPartDigits,
    required this.unitPart,
    required this.unitPartMultiple,
    required this.unitPartPlural,
    required this.unitPartGender,
  });

  TafqeetUnit copyWith({
    UnitCode? unitCode,
    String? country,
    String? unit,
    String? unitMultiple,
    String? unitPlural,
    Gender? unitGender,
    int? unitPartDigits,
    String? unitPart,
    String? unitPartMultiple,
    String? unitPartPlural,
    Gender? unitPartGender,
  }) {
    return TafqeetUnit(
      unitCode: unitCode ?? this.unitCode,
      country: country ?? this.country,
      unit: unit ?? this.unit,
      unitMultiple: unitMultiple ?? this.unitMultiple,
      unitPlural: unitPlural ?? this.unitPlural,
      unitGender: unitGender ?? this.unitGender,
      unitPartDigits: unitPartDigits ?? this.unitPartDigits,
      unitPart: unitPart ?? this.unitPart,
      unitPartMultiple: unitPartMultiple ?? this.unitPartMultiple,
      unitPartPlural: unitPartPlural ?? this.unitPartPlural,
      unitPartGender: unitPartGender ?? this.unitPartGender,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'unitCode': unitCode.toMap()});
    result.addAll({'country': country});
    result.addAll({'unit': unit});
    result.addAll({'unitMultiple': unitMultiple});
    result.addAll({'unitPlural': unitPlural});
    result.addAll({'unitGender': unitGender.toMap()});
    result.addAll({'unitPartDigits': unitPartDigits});
    result.addAll({'unitPart': unitPart});
    result.addAll({'unitPartMultiple': unitPartMultiple});
    result.addAll({'unitPartPlural': unitPartPlural});
    result.addAll({'unitPartGender': unitPartGender.toMap()});

    return result;
  }

  factory TafqeetUnit.fromMap(Map<String, dynamic> map) {
    return TafqeetUnit(
      unitCode: UnitCode.fromMap(map['unitCode']),
      country: map['country'] ?? '',
      unit: map['unit'] ?? '',
      unitMultiple: map['unitMultiple'] ?? '',
      unitPlural: map['unitPlural'] ?? '',
      unitGender: Gender.fromMap(map['unitGender']),
      unitPartDigits: map['unitPartDigits']?.toInt() ?? 0,
      unitPart: map['unitPart'] ?? '',
      unitPartMultiple: map['unitPartMultiple'] ?? '',
      unitPartPlural: map['unitPartPlural'] ?? '',
      unitPartGender: Gender.fromMap(map['unitPartGender']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TafqeetUnit.fromJson(String source) =>
      TafqeetUnit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TafqeetUnit(unitCode: $unitCode, country: $country, unit: $unit, unitMultiple: $unitMultiple, unitPlural: $unitPlural, unitGender: $unitGender, unitPartDigits: $unitPartDigits, unitPart: $unitPart, unitPartMultiple: $unitPartMultiple, unitPartPlural: $unitPartPlural, unitPartGender: $unitPartGender)';
  }

  @override
  List<Object> get props {
    return [
      unitCode,
      country,
      unit,
      unitMultiple,
      unitPlural,
      unitGender,
      unitPartDigits,
      unitPart,
      unitPartMultiple,
      unitPartPlural,
      unitPartGender,
    ];
  }
}
