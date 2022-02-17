// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genericdrug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericDrug _$GenericDrugFromJson(Map<String, dynamic> json) {
  return _GenericDrug.fromJson(json);
}

/// @nodoc
class _$GenericDrugTearOff {
  const _$GenericDrugTearOff();

  _GenericDrug call(
      {required int genericDrugID, required String genericDrugName}) {
    return _GenericDrug(
      genericDrugID: genericDrugID,
      genericDrugName: genericDrugName,
    );
  }

  GenericDrug fromJson(Map<String, Object?> json) {
    return GenericDrug.fromJson(json);
  }
}

/// @nodoc
const $GenericDrug = _$GenericDrugTearOff();

/// @nodoc
mixin _$GenericDrug {
  int get genericDrugID => throw _privateConstructorUsedError;
  String get genericDrugName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericDrugCopyWith<GenericDrug> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericDrugCopyWith<$Res> {
  factory $GenericDrugCopyWith(
          GenericDrug value, $Res Function(GenericDrug) then) =
      _$GenericDrugCopyWithImpl<$Res>;
  $Res call({int genericDrugID, String genericDrugName});
}

/// @nodoc
class _$GenericDrugCopyWithImpl<$Res> implements $GenericDrugCopyWith<$Res> {
  _$GenericDrugCopyWithImpl(this._value, this._then);

  final GenericDrug _value;
  // ignore: unused_field
  final $Res Function(GenericDrug) _then;

  @override
  $Res call({
    Object? genericDrugID = freezed,
    Object? genericDrugName = freezed,
  }) {
    return _then(_value.copyWith(
      genericDrugID: genericDrugID == freezed
          ? _value.genericDrugID
          : genericDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      genericDrugName: genericDrugName == freezed
          ? _value.genericDrugName
          : genericDrugName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GenericDrugCopyWith<$Res>
    implements $GenericDrugCopyWith<$Res> {
  factory _$GenericDrugCopyWith(
          _GenericDrug value, $Res Function(_GenericDrug) then) =
      __$GenericDrugCopyWithImpl<$Res>;
  @override
  $Res call({int genericDrugID, String genericDrugName});
}

/// @nodoc
class __$GenericDrugCopyWithImpl<$Res> extends _$GenericDrugCopyWithImpl<$Res>
    implements _$GenericDrugCopyWith<$Res> {
  __$GenericDrugCopyWithImpl(
      _GenericDrug _value, $Res Function(_GenericDrug) _then)
      : super(_value, (v) => _then(v as _GenericDrug));

  @override
  _GenericDrug get _value => super._value as _GenericDrug;

  @override
  $Res call({
    Object? genericDrugID = freezed,
    Object? genericDrugName = freezed,
  }) {
    return _then(_GenericDrug(
      genericDrugID: genericDrugID == freezed
          ? _value.genericDrugID
          : genericDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      genericDrugName: genericDrugName == freezed
          ? _value.genericDrugName
          : genericDrugName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenericDrug implements _GenericDrug {
  _$_GenericDrug({required this.genericDrugID, required this.genericDrugName});

  factory _$_GenericDrug.fromJson(Map<String, dynamic> json) =>
      _$$_GenericDrugFromJson(json);

  @override
  final int genericDrugID;
  @override
  final String genericDrugName;

  @override
  String toString() {
    return 'GenericDrug(genericDrugID: $genericDrugID, genericDrugName: $genericDrugName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GenericDrug &&
            const DeepCollectionEquality()
                .equals(other.genericDrugID, genericDrugID) &&
            const DeepCollectionEquality()
                .equals(other.genericDrugName, genericDrugName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(genericDrugID),
      const DeepCollectionEquality().hash(genericDrugName));

  @JsonKey(ignore: true)
  @override
  _$GenericDrugCopyWith<_GenericDrug> get copyWith =>
      __$GenericDrugCopyWithImpl<_GenericDrug>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenericDrugToJson(this);
  }
}

abstract class _GenericDrug implements GenericDrug {
  factory _GenericDrug(
      {required int genericDrugID,
      required String genericDrugName}) = _$_GenericDrug;

  factory _GenericDrug.fromJson(Map<String, dynamic> json) =
      _$_GenericDrug.fromJson;

  @override
  int get genericDrugID;
  @override
  String get genericDrugName;
  @override
  @JsonKey(ignore: true)
  _$GenericDrugCopyWith<_GenericDrug> get copyWith =>
      throw _privateConstructorUsedError;
}
