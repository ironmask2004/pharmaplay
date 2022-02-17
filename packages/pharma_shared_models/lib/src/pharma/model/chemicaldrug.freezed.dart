// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chemicaldrug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChemicalDrug _$ChemicalDrugFromJson(Map<String, dynamic> json) {
  return _ChemicalDrug.fromJson(json);
}

/// @nodoc
class _$ChemicalDrugTearOff {
  const _$ChemicalDrugTearOff();

  _ChemicalDrug call(
      {required int chemicalDrugID, required String chemicalDrugName}) {
    return _ChemicalDrug(
      chemicalDrugID: chemicalDrugID,
      chemicalDrugName: chemicalDrugName,
    );
  }

  ChemicalDrug fromJson(Map<String, Object?> json) {
    return ChemicalDrug.fromJson(json);
  }
}

/// @nodoc
const $ChemicalDrug = _$ChemicalDrugTearOff();

/// @nodoc
mixin _$ChemicalDrug {
  int get chemicalDrugID => throw _privateConstructorUsedError;
  String get chemicalDrugName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChemicalDrugCopyWith<ChemicalDrug> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChemicalDrugCopyWith<$Res> {
  factory $ChemicalDrugCopyWith(
          ChemicalDrug value, $Res Function(ChemicalDrug) then) =
      _$ChemicalDrugCopyWithImpl<$Res>;
  $Res call({int chemicalDrugID, String chemicalDrugName});
}

/// @nodoc
class _$ChemicalDrugCopyWithImpl<$Res> implements $ChemicalDrugCopyWith<$Res> {
  _$ChemicalDrugCopyWithImpl(this._value, this._then);

  final ChemicalDrug _value;
  // ignore: unused_field
  final $Res Function(ChemicalDrug) _then;

  @override
  $Res call({
    Object? chemicalDrugID = freezed,
    Object? chemicalDrugName = freezed,
  }) {
    return _then(_value.copyWith(
      chemicalDrugID: chemicalDrugID == freezed
          ? _value.chemicalDrugID
          : chemicalDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      chemicalDrugName: chemicalDrugName == freezed
          ? _value.chemicalDrugName
          : chemicalDrugName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ChemicalDrugCopyWith<$Res>
    implements $ChemicalDrugCopyWith<$Res> {
  factory _$ChemicalDrugCopyWith(
          _ChemicalDrug value, $Res Function(_ChemicalDrug) then) =
      __$ChemicalDrugCopyWithImpl<$Res>;
  @override
  $Res call({int chemicalDrugID, String chemicalDrugName});
}

/// @nodoc
class __$ChemicalDrugCopyWithImpl<$Res> extends _$ChemicalDrugCopyWithImpl<$Res>
    implements _$ChemicalDrugCopyWith<$Res> {
  __$ChemicalDrugCopyWithImpl(
      _ChemicalDrug _value, $Res Function(_ChemicalDrug) _then)
      : super(_value, (v) => _then(v as _ChemicalDrug));

  @override
  _ChemicalDrug get _value => super._value as _ChemicalDrug;

  @override
  $Res call({
    Object? chemicalDrugID = freezed,
    Object? chemicalDrugName = freezed,
  }) {
    return _then(_ChemicalDrug(
      chemicalDrugID: chemicalDrugID == freezed
          ? _value.chemicalDrugID
          : chemicalDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      chemicalDrugName: chemicalDrugName == freezed
          ? _value.chemicalDrugName
          : chemicalDrugName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChemicalDrug implements _ChemicalDrug {
  _$_ChemicalDrug(
      {required this.chemicalDrugID, required this.chemicalDrugName});

  factory _$_ChemicalDrug.fromJson(Map<String, dynamic> json) =>
      _$$_ChemicalDrugFromJson(json);

  @override
  final int chemicalDrugID;
  @override
  final String chemicalDrugName;

  @override
  String toString() {
    return 'ChemicalDrug(chemicalDrugID: $chemicalDrugID, chemicalDrugName: $chemicalDrugName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChemicalDrug &&
            const DeepCollectionEquality()
                .equals(other.chemicalDrugID, chemicalDrugID) &&
            const DeepCollectionEquality()
                .equals(other.chemicalDrugName, chemicalDrugName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chemicalDrugID),
      const DeepCollectionEquality().hash(chemicalDrugName));

  @JsonKey(ignore: true)
  @override
  _$ChemicalDrugCopyWith<_ChemicalDrug> get copyWith =>
      __$ChemicalDrugCopyWithImpl<_ChemicalDrug>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChemicalDrugToJson(this);
  }
}

abstract class _ChemicalDrug implements ChemicalDrug {
  factory _ChemicalDrug(
      {required int chemicalDrugID,
      required String chemicalDrugName}) = _$_ChemicalDrug;

  factory _ChemicalDrug.fromJson(Map<String, dynamic> json) =
      _$_ChemicalDrug.fromJson;

  @override
  int get chemicalDrugID;
  @override
  String get chemicalDrugName;
  @override
  @JsonKey(ignore: true)
  _$ChemicalDrugCopyWith<_ChemicalDrug> get copyWith =>
      throw _privateConstructorUsedError;
}
