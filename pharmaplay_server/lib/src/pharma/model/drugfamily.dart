import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

import 'drugclass.dart';

part 'drugfamily.g.dart';

/*CREATE TABLE IF NOT EXISTS pharmaplay."drugFamily"
(
    "drugFamilyID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "drugFamilyID" integer NOT NULL,
    "ar__drugFamilyName" character(255) COLLATE pg_catalog."default" NOT NULL,
    "en__drugFamilyName" character(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pharmaFamilys_pkey PRIMARY KEY ("drugFamilyID")
)


*/
@JsonSerializable(explicitToJson: true)
class DrugFamily extends Equatable {
  final int drugFamilyID;
  final DrugClass drugClass;
  final String drugFamilyName;
  DrugFamily({
    required this.drugFamilyID,
    required this.drugClass,
    required this.drugFamilyName,
  });

  factory DrugFamily.fromJson(Map<String, dynamic> json) =>
      _$DrugFamilyFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DrugFamilyToJson(this);

  DrugFamily copyWith({
    int? drugFamilyID,
    DrugClass? drugClass,
    String? drugFamilyName,
  }) {
    return DrugFamily(
      drugFamilyID: drugFamilyID ?? this.drugFamilyID,
      drugClass: drugClass ?? this.drugClass,
      drugFamilyName: drugFamilyName ?? this.drugFamilyName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drugFamilyID': drugFamilyID,
      'drugClass': drugClass.toMap(),
      'drugFamilyName': drugFamilyName,
    };
  }

  factory DrugFamily.fromMap(Map<String, dynamic> map) {
    return DrugFamily(
      drugFamilyID: map['drugFamilyID']?.toInt() ?? 0,
      drugClass: DrugClass.fromMap(map['drugClass']),
      drugFamilyName: map['drugFamilyName'] ?? '',
    );
  }

  @override
  String toString() =>
      'DrugFamily(drugFamilyID: $drugFamilyID, drugClass: $drugClass, drugFamilyName: $drugFamilyName)';

  @override
  List<Object> get props => [drugFamilyID, drugClass, drugFamilyName];
}
