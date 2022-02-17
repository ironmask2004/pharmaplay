// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drugfamily.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DrugFamily _$DrugFamilyFromJson(Map<String, dynamic> json) {
  return _DrugFamily.fromJson(json);
}

/// @nodoc
class _$DrugFamilyTearOff {
  const _$DrugFamilyTearOff();

  _DrugFamily call(
      {required int drugFamilyID,
      required int drugClassID,
      required String drugFamilyName}) {
    return _DrugFamily(
      drugFamilyID: drugFamilyID,
      drugClassID: drugClassID,
      drugFamilyName: drugFamilyName,
    );
  }

  DrugFamily fromJson(Map<String, Object?> json) {
    return DrugFamily.fromJson(json);
  }
}

/// @nodoc
const $DrugFamily = _$DrugFamilyTearOff();

/// @nodoc
mixin _$DrugFamily {
  int get drugFamilyID => throw _privateConstructorUsedError;
  int get drugClassID => throw _privateConstructorUsedError;
  String get drugFamilyName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugFamilyCopyWith<DrugFamily> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugFamilyCopyWith<$Res> {
  factory $DrugFamilyCopyWith(
          DrugFamily value, $Res Function(DrugFamily) then) =
      _$DrugFamilyCopyWithImpl<$Res>;
  $Res call({int drugFamilyID, int drugClassID, String drugFamilyName});
}

/// @nodoc
class _$DrugFamilyCopyWithImpl<$Res> implements $DrugFamilyCopyWith<$Res> {
  _$DrugFamilyCopyWithImpl(this._value, this._then);

  final DrugFamily _value;
  // ignore: unused_field
  final $Res Function(DrugFamily) _then;

  @override
  $Res call({
    Object? drugFamilyID = freezed,
    Object? drugClassID = freezed,
    Object? drugFamilyName = freezed,
  }) {
    return _then(_value.copyWith(
      drugFamilyID: drugFamilyID == freezed
          ? _value.drugFamilyID
          : drugFamilyID // ignore: cast_nullable_to_non_nullable
              as int,
      drugClassID: drugClassID == freezed
          ? _value.drugClassID
          : drugClassID // ignore: cast_nullable_to_non_nullable
              as int,
      drugFamilyName: drugFamilyName == freezed
          ? _value.drugFamilyName
          : drugFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DrugFamilyCopyWith<$Res> implements $DrugFamilyCopyWith<$Res> {
  factory _$DrugFamilyCopyWith(
          _DrugFamily value, $Res Function(_DrugFamily) then) =
      __$DrugFamilyCopyWithImpl<$Res>;
  @override
  $Res call({int drugFamilyID, int drugClassID, String drugFamilyName});
}

/// @nodoc
class __$DrugFamilyCopyWithImpl<$Res> extends _$DrugFamilyCopyWithImpl<$Res>
    implements _$DrugFamilyCopyWith<$Res> {
  __$DrugFamilyCopyWithImpl(
      _DrugFamily _value, $Res Function(_DrugFamily) _then)
      : super(_value, (v) => _then(v as _DrugFamily));

  @override
  _DrugFamily get _value => super._value as _DrugFamily;

  @override
  $Res call({
    Object? drugFamilyID = freezed,
    Object? drugClassID = freezed,
    Object? drugFamilyName = freezed,
  }) {
    return _then(_DrugFamily(
      drugFamilyID: drugFamilyID == freezed
          ? _value.drugFamilyID
          : drugFamilyID // ignore: cast_nullable_to_non_nullable
              as int,
      drugClassID: drugClassID == freezed
          ? _value.drugClassID
          : drugClassID // ignore: cast_nullable_to_non_nullable
              as int,
      drugFamilyName: drugFamilyName == freezed
          ? _value.drugFamilyName
          : drugFamilyName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DrugFamily implements _DrugFamily {
  _$_DrugFamily(
      {required this.drugFamilyID,
      required this.drugClassID,
      required this.drugFamilyName});

  factory _$_DrugFamily.fromJson(Map<String, dynamic> json) =>
      _$$_DrugFamilyFromJson(json);

  @override
  final int drugFamilyID;
  @override
  final int drugClassID;
  @override
  final String drugFamilyName;

  @override
  String toString() {
    return 'DrugFamily(drugFamilyID: $drugFamilyID, drugClassID: $drugClassID, drugFamilyName: $drugFamilyName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrugFamily &&
            const DeepCollectionEquality()
                .equals(other.drugFamilyID, drugFamilyID) &&
            const DeepCollectionEquality()
                .equals(other.drugClassID, drugClassID) &&
            const DeepCollectionEquality()
                .equals(other.drugFamilyName, drugFamilyName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(drugFamilyID),
      const DeepCollectionEquality().hash(drugClassID),
      const DeepCollectionEquality().hash(drugFamilyName));

  @JsonKey(ignore: true)
  @override
  _$DrugFamilyCopyWith<_DrugFamily> get copyWith =>
      __$DrugFamilyCopyWithImpl<_DrugFamily>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrugFamilyToJson(this);
  }
}

abstract class _DrugFamily implements DrugFamily {
  factory _DrugFamily(
      {required int drugFamilyID,
      required int drugClassID,
      required String drugFamilyName}) = _$_DrugFamily;

  factory _DrugFamily.fromJson(Map<String, dynamic> json) =
      _$_DrugFamily.fromJson;

  @override
  int get drugFamilyID;
  @override
  int get drugClassID;
  @override
  String get drugFamilyName;
  @override
  @JsonKey(ignore: true)
  _$DrugFamilyCopyWith<_DrugFamily> get copyWith =>
      throw _privateConstructorUsedError;
}
