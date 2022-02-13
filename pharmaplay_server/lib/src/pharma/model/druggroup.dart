import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'druggroup.g.dart';

/*
CREATE TABLE IF NOT EXISTS pharmaplay."drugGroup"
(
    "drugGroupID" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    "ar__drugGroupName" character(255) COLLATE pg_catalog."default" NOT NULL,
    "en__drugGroupName" character(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pharmagenricclasss_pkey PRIMARY KEY ("drugGroupID")
)

*/
@JsonSerializable(explicitToJson: true)
class DrugGroup extends Equatable {
  final int druggroupID;
  final String druggroupName;
  DrugGroup({
    required this.druggroupID,
    required this.druggroupName,
  });

  factory DrugGroup.fromJson(Map<String, dynamic> json) =>
      _$DrugGroupFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DrugGroupToJson(this);

  DrugGroup copyWith({
    int? druggroupID,
    String? druggroupName,
  }) {
    return DrugGroup(
      druggroupID: druggroupID ?? this.druggroupID,
      druggroupName: druggroupName ?? this.druggroupName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'druggroupID': druggroupID,
      'druggroupName': druggroupName,
    };
  }

  factory DrugGroup.fromMap(Map<String, dynamic> map) {
    return DrugGroup(
      druggroupID: map['druggroupID']?.toInt() ?? 0,
      druggroupName: map['druggroupName'] ?? '',
    );
  }

  @override
  String toString() =>
      'DrugGroup(druggroupID: $druggroupID, druggroupName: $druggroupName)';

  @override
  List<Object> get props => [druggroupID, druggroupName];
}
