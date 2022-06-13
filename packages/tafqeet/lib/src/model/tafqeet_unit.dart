import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:tafqeet/src/model/unit_code.dart';
// TODO   القيام بيعملية لجمع للوحدات بشكل الي

class TafqeetUnit extends Equatable {
  final TafqeetUnitCode unitCode;
  final String country;
  final String unit;
  final String unitPlural;
  final TafqeetUnitGender unitGender;
  final int unitMaxValue;
  final TafqeetUnitCode partialUnitCode;
  TafqeetUnit(
      {this.unitCode = TafqeetUnitCode.undefined,
      this.country = '',
      required this.unit,
      required this.unitPlural,
      required this.unitGender,
      this.unitMaxValue = 0,
      this.partialUnitCode = TafqeetUnitCode.undefinedPart});

  /*String get unitMultiple {
    return unit.substring(unit.length - 1) == 'ة'
        ? '${unit.substring(0, unit.length - 1)}تان'
        : '$unitان';
  }*/
  //set setUnitMultiple(unitMultiple unitMultiple) => this.unitMultiple = unitMultiple;='';

  TafqeetUnit copyWith({
    TafqeetUnitCode? unitCode,
    String? country,
    String? unit,
    String? unitPlural,
    TafqeetUnitGender? unitGender,
    int? unitMaxValue,
    TafqeetUnitCode? partialUnitCode,
  }) {
    return TafqeetUnit(
      unitCode: unitCode ?? this.unitCode,
      country: country ?? this.country,
      unit: unit ?? this.unit,
      unitPlural: unitPlural ?? this.unitPlural,
      unitGender: unitGender ?? this.unitGender,
      unitMaxValue: unitMaxValue ?? this.unitMaxValue,
      partialUnitCode: partialUnitCode ?? this.partialUnitCode,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'unitCode': unitCode.toMap()});
    result.addAll({'country': country});
    result.addAll({'unit': unit});
    result.addAll({'unitPlural': unitPlural});
    result.addAll({'unitGender': unitGender.toMap()});
    result.addAll({'unitMaxValue': unitMaxValue});
    result.addAll({'partialUnitCode': partialUnitCode.toMap()});

    return result;
  }

  factory TafqeetUnit.fromMap(Map<String, dynamic> map) {
    return TafqeetUnit(
      unitCode: TafqeetUnitCode.fromMap(map['unitCode']),
      country: map['country'] ?? '',
      unit: map['unit'] ?? '',
      unitPlural: map['unitPlural'] ?? '',
      unitGender: TafqeetUnitGender.fromMap(map['unitGender']),
      unitMaxValue: map['unitMaxValue']?.toInt() ?? 0,
      partialUnitCode: TafqeetUnitCode.fromMap(map['partialUnitCode']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TafqeetUnit.fromJson(String source) =>
      TafqeetUnit.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TafqeetUnit(unitCode: $unitCode, country: $country, unit: $unit, unitPlural: $unitPlural, unitGender: $unitGender, unitMaxValue: $unitMaxValue, partialUnitCode: $partialUnitCode)';
  }

  @override
  List<Object> get props {
    return [
      unitCode,
      country,
      unit,
      unitPlural,
      unitGender,
      unitMaxValue,
      partialUnitCode,
    ];
  }
}
