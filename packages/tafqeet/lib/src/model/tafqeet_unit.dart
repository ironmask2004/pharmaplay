import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tafqeet/src/model/unit_code.dart';

class TafqeetUnit extends Equatable {
  final TafqeetUnitCode unitCode;
  final String country;
  final String unit;
// TODO   القيام بيعملية لجمع للوحدات بشكل الي
  final String unitPlural;
  final TafqeetGender unitGender;
  final int unitPartDigits;
  final String unitPart;
  final String unitPartPlural;
  final TafqeetGender unitPartGender;
  TafqeetUnit({
    required this.unitCode,
    required this.country,
    required this.unit,
    required this.unitPlural,
    required this.unitGender,
    required this.unitPartDigits,
    required this.unitPart,
    required this.unitPartPlural,
    required this.unitPartGender,
  });

  String get unitMultiple {
    return unit.substring(unit.length - 1) == 'ة'
        ? '${unit.substring(0, unit.length - 1)}تان'
        : '$unitان';
  }

  String get unitPartMultiple {
    return unitPart.substring(unitPart.length - 1) == 'ة'
        ? '${unitPart.substring(0, unitPart.length - 1)}تان'
        : '$unitPartان';
  }

  //set setUnitMultiple(unitMultiple unitMultiple) => this.unitMultiple = unitMultiple;='';

  TafqeetUnit copyWith({
    TafqeetUnitCode? unitCode,
    String? country,
    String? unit,
    String? unitMultiple,
    String? unitPlural,
    TafqeetGender? unitGender,
    int? unitPartDigits,
    String? unitPart,
    String? unitPartMultiple,
    String? unitPartPlural,
    TafqeetGender? unitPartGender,
  }) {
    return TafqeetUnit(
      unitCode: unitCode ?? this.unitCode,
      country: country ?? this.country,
      unit: unit ?? this.unit,
      unitPlural: unitPlural ?? this.unitPlural,
      unitGender: unitGender ?? this.unitGender,
      unitPartDigits: unitPartDigits ?? this.unitPartDigits,
      unitPart: unitPart ?? this.unitPart,
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
      unitCode: TafqeetUnitCode.fromMap(map['unitCode']),
      country: map['country'] ?? '',
      unit: map['unit'] ?? '',
      unitPlural: map['unitPlural'] ?? '',
      unitGender: TafqeetGender.fromMap(map['unitGender']),
      unitPartDigits: map['unitPartDigits']?.toInt() ?? 0,
      unitPart: map['unitPart'] ?? '',
      unitPartPlural: map['unitPartPlural'] ?? '',
      unitPartGender: TafqeetGender.fromMap(map['unitPartGender']),
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
