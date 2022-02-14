import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';
import 'package:pharmaplay_server/src/pharma/model/druggroup.dart';

part 'drugclass.g.dart';

/*

CREATE TABLE IF NOT EXISTS pharmaplay."drugClass"
(
    "drugClassID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "drugGroupID" integer NOT NULL,
    "ar__drugClassName" character(255) COLLATE pg_catalog."default" NOT NULL,
    "en__drugClassName" character(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pharmaclass_pkey PRIMARY KEY ("drugClassID")
)
*/
@JsonSerializable(explicitToJson: true)
class DrugClass extends Equatable {
  final int drugClassID;
  final int drugGroupID;
  final String drugClassName;
  DrugClass({
    required this.drugClassID,
    required this.drugGroupID,
    required this.drugClassName,
  });

  factory DrugClass.fromJson(Map<String, dynamic> json) =>
      _$DrugClassFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DrugClassToJson(this);

  DrugClass copyWith({
    int? drugClassID,
    int? drugGroupID,
    String? drugClassName,
  }) {
    return DrugClass(
      drugClassID: drugClassID ?? this.drugClassID,
      drugGroupID: drugGroupID ?? this.drugGroupID,
      drugClassName: drugClassName ?? this.drugClassName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drugClassID': drugClassID,
      'drugGroupID': drugGroupID,
      'drugClassName': drugClassName,
    };
  }

  factory DrugClass.fromMap(Map<String, dynamic> map) {
    return DrugClass(
      drugClassID: map['drugClassID']?.toInt() ?? 0,
      drugGroupID: map['drugGroupID']?.toInt() ?? 0,
      drugClassName: map['drugClassName'] ?? '',
    );
  }

  @override
  String toString() =>
      'DrugClass(drugClassID: $drugClassID, drugGroupID: $drugGroupID, drugClassName: $drugClassName)';

  @override
  List<Object> get props => [drugClassID, drugGroupID, drugClassName];
}
