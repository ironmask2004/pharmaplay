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
  final int drugGroupID;
  final String drugGroupName;
  DrugGroup({
    required this.drugGroupID,
    required this.drugGroupName,
  });

  factory DrugGroup.fromJson(Map<String, dynamic> json) =>
      _$DrugGroupFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$DrugGroupToJson(this);

  DrugGroup copyWith({
    int? drugGroupID,
    String? drugGroupName,
  }) {
    return DrugGroup(
      drugGroupID: drugGroupID ?? this.drugGroupID,
      drugGroupName: drugGroupName ?? this.drugGroupName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'drugGroupID': drugGroupID,
      'drugGroupName': drugGroupName,
    };
  }

  factory DrugGroup.fromMap(Map<String, dynamic> map) {
    return DrugGroup(
      drugGroupID: map['drugGroupID']?.toInt() ?? 0,
      drugGroupName: map['drugGroupName'] ?? '',
    );
  }

  @override
  String toString() =>
      'DrugGroup(drugGroupID: $drugGroupID, drugGroupName: $drugGroupName)';

  @override
  List<Object> get props => [drugGroupID, drugGroupName];
}
