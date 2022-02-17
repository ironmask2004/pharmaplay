// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'manufactory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Manufactory _$ManufactoryFromJson(Map<String, dynamic> json) {
  return _Manufactory.fromJson(json);
}

/// @nodoc
class _$ManufactoryTearOff {
  const _$ManufactoryTearOff();

  _Manufactory call(
      {required int manufactoryID, required String manufactoryName}) {
    return _Manufactory(
      manufactoryID: manufactoryID,
      manufactoryName: manufactoryName,
    );
  }

  Manufactory fromJson(Map<String, Object?> json) {
    return Manufactory.fromJson(json);
  }
}

/// @nodoc
const $Manufactory = _$ManufactoryTearOff();

/// @nodoc
mixin _$Manufactory {
  int get manufactoryID => throw _privateConstructorUsedError;
  String get manufactoryName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ManufactoryCopyWith<Manufactory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ManufactoryCopyWith<$Res> {
  factory $ManufactoryCopyWith(
          Manufactory value, $Res Function(Manufactory) then) =
      _$ManufactoryCopyWithImpl<$Res>;
  $Res call({int manufactoryID, String manufactoryName});
}

/// @nodoc
class _$ManufactoryCopyWithImpl<$Res> implements $ManufactoryCopyWith<$Res> {
  _$ManufactoryCopyWithImpl(this._value, this._then);

  final Manufactory _value;
  // ignore: unused_field
  final $Res Function(Manufactory) _then;

  @override
  $Res call({
    Object? manufactoryID = freezed,
    Object? manufactoryName = freezed,
  }) {
    return _then(_value.copyWith(
      manufactoryID: manufactoryID == freezed
          ? _value.manufactoryID
          : manufactoryID // ignore: cast_nullable_to_non_nullable
              as int,
      manufactoryName: manufactoryName == freezed
          ? _value.manufactoryName
          : manufactoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ManufactoryCopyWith<$Res>
    implements $ManufactoryCopyWith<$Res> {
  factory _$ManufactoryCopyWith(
          _Manufactory value, $Res Function(_Manufactory) then) =
      __$ManufactoryCopyWithImpl<$Res>;
  @override
  $Res call({int manufactoryID, String manufactoryName});
}

/// @nodoc
class __$ManufactoryCopyWithImpl<$Res> extends _$ManufactoryCopyWithImpl<$Res>
    implements _$ManufactoryCopyWith<$Res> {
  __$ManufactoryCopyWithImpl(
      _Manufactory _value, $Res Function(_Manufactory) _then)
      : super(_value, (v) => _then(v as _Manufactory));

  @override
  _Manufactory get _value => super._value as _Manufactory;

  @override
  $Res call({
    Object? manufactoryID = freezed,
    Object? manufactoryName = freezed,
  }) {
    return _then(_Manufactory(
      manufactoryID: manufactoryID == freezed
          ? _value.manufactoryID
          : manufactoryID // ignore: cast_nullable_to_non_nullable
              as int,
      manufactoryName: manufactoryName == freezed
          ? _value.manufactoryName
          : manufactoryName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Manufactory implements _Manufactory {
  _$_Manufactory({required this.manufactoryID, required this.manufactoryName});

  factory _$_Manufactory.fromJson(Map<String, dynamic> json) =>
      _$$_ManufactoryFromJson(json);

  @override
  final int manufactoryID;
  @override
  final String manufactoryName;

  @override
  String toString() {
    return 'Manufactory(manufactoryID: $manufactoryID, manufactoryName: $manufactoryName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Manufactory &&
            const DeepCollectionEquality()
                .equals(other.manufactoryID, manufactoryID) &&
            const DeepCollectionEquality()
                .equals(other.manufactoryName, manufactoryName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(manufactoryID),
      const DeepCollectionEquality().hash(manufactoryName));

  @JsonKey(ignore: true)
  @override
  _$ManufactoryCopyWith<_Manufactory> get copyWith =>
      __$ManufactoryCopyWithImpl<_Manufactory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ManufactoryToJson(this);
  }
}

abstract class _Manufactory implements Manufactory {
  factory _Manufactory(
      {required int manufactoryID,
      required String manufactoryName}) = _$_Manufactory;

  factory _Manufactory.fromJson(Map<String, dynamic> json) =
      _$_Manufactory.fromJson;

  @override
  int get manufactoryID;
  @override
  String get manufactoryName;
  @override
  @JsonKey(ignore: true)
  _$ManufactoryCopyWith<_Manufactory> get copyWith =>
      throw _privateConstructorUsedError;
}
