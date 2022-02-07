import 'package:pharmaplay_server/pharmaplay_server.dart';

part 'genericname.g.dart';

@JsonSerializable(explicitToJson: true)
class GenericName extends Equatable {
  final int genericNameID;
  final String genericName;
  GenericName({
    required this.genericNameID,
    required this.genericName,
  });

  factory GenericName.fromJson(Map<String, dynamic> json) =>
      _$GenericNameFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$GenericNameToJson(this);

  GenericName copyWith({
    int? genericNameID,
    String? genericName,
  }) {
    return GenericName(
      genericNameID: genericNameID ?? this.genericNameID,
      genericName: genericName ?? this.genericName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'genericNameID': genericNameID,
      'genericName': genericName,
    };
  }

  factory GenericName.fromMap(Map<String, dynamic> map) {
    return GenericName(
      genericNameID: map['genericNameID']?.toInt() ?? 0,
      genericName: map['genericName'] ?? '',
    );
  }

  @override
  String toString() =>
      'GenericName(genericNameID: $genericNameID, genericName: $genericName)';

  @override
  List<Object> get props => [genericNameID, genericName];
}
