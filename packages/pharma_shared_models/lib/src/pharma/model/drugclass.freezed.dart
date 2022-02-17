// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drugclass.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DrugClass _$DrugClassFromJson(Map<String, dynamic> json) {
  return _DrugClass.fromJson(json);
}

/// @nodoc
class _$DrugClassTearOff {
  const _$DrugClassTearOff();

  _DrugClass call(
      {required int drugClassID,
      required int drugGroupID,
      required String drugClassName}) {
    return _DrugClass(
      drugClassID: drugClassID,
      drugGroupID: drugGroupID,
      drugClassName: drugClassName,
    );
  }

  DrugClass fromJson(Map<String, Object?> json) {
    return DrugClass.fromJson(json);
  }
}

/// @nodoc
const $DrugClass = _$DrugClassTearOff();

/// @nodoc
mixin _$DrugClass {
  int get drugClassID => throw _privateConstructorUsedError;
  int get drugGroupID => throw _privateConstructorUsedError;
  String get drugClassName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugClassCopyWith<DrugClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugClassCopyWith<$Res> {
  factory $DrugClassCopyWith(DrugClass value, $Res Function(DrugClass) then) =
      _$DrugClassCopyWithImpl<$Res>;
  $Res call({int drugClassID, int drugGroupID, String drugClassName});
}

/// @nodoc
class _$DrugClassCopyWithImpl<$Res> implements $DrugClassCopyWith<$Res> {
  _$DrugClassCopyWithImpl(this._value, this._then);

  final DrugClass _value;
  // ignore: unused_field
  final $Res Function(DrugClass) _then;

  @override
  $Res call({
    Object? drugClassID = freezed,
    Object? drugGroupID = freezed,
    Object? drugClassName = freezed,
  }) {
    return _then(_value.copyWith(
      drugClassID: drugClassID == freezed
          ? _value.drugClassID
          : drugClassID // ignore: cast_nullable_to_non_nullable
              as int,
      drugGroupID: drugGroupID == freezed
          ? _value.drugGroupID
          : drugGroupID // ignore: cast_nullable_to_non_nullable
              as int,
      drugClassName: drugClassName == freezed
          ? _value.drugClassName
          : drugClassName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DrugClassCopyWith<$Res> implements $DrugClassCopyWith<$Res> {
  factory _$DrugClassCopyWith(
          _DrugClass value, $Res Function(_DrugClass) then) =
      __$DrugClassCopyWithImpl<$Res>;
  @override
  $Res call({int drugClassID, int drugGroupID, String drugClassName});
}

/// @nodoc
class __$DrugClassCopyWithImpl<$Res> extends _$DrugClassCopyWithImpl<$Res>
    implements _$DrugClassCopyWith<$Res> {
  __$DrugClassCopyWithImpl(_DrugClass _value, $Res Function(_DrugClass) _then)
      : super(_value, (v) => _then(v as _DrugClass));

  @override
  _DrugClass get _value => super._value as _DrugClass;

  @override
  $Res call({
    Object? drugClassID = freezed,
    Object? drugGroupID = freezed,
    Object? drugClassName = freezed,
  }) {
    return _then(_DrugClass(
      drugClassID: drugClassID == freezed
          ? _value.drugClassID
          : drugClassID // ignore: cast_nullable_to_non_nullable
              as int,
      drugGroupID: drugGroupID == freezed
          ? _value.drugGroupID
          : drugGroupID // ignore: cast_nullable_to_non_nullable
              as int,
      drugClassName: drugClassName == freezed
          ? _value.drugClassName
          : drugClassName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DrugClass implements _DrugClass {
  _$_DrugClass(
      {required this.drugClassID,
      required this.drugGroupID,
      required this.drugClassName});

  factory _$_DrugClass.fromJson(Map<String, dynamic> json) =>
      _$$_DrugClassFromJson(json);

  @override
  final int drugClassID;
  @override
  final int drugGroupID;
  @override
  final String drugClassName;

  @override
  String toString() {
    return 'DrugClass(drugClassID: $drugClassID, drugGroupID: $drugGroupID, drugClassName: $drugClassName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrugClass &&
            const DeepCollectionEquality()
                .equals(other.drugClassID, drugClassID) &&
            const DeepCollectionEquality()
                .equals(other.drugGroupID, drugGroupID) &&
            const DeepCollectionEquality()
                .equals(other.drugClassName, drugClassName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(drugClassID),
      const DeepCollectionEquality().hash(drugGroupID),
      const DeepCollectionEquality().hash(drugClassName));

  @JsonKey(ignore: true)
  @override
  _$DrugClassCopyWith<_DrugClass> get copyWith =>
      __$DrugClassCopyWithImpl<_DrugClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrugClassToJson(this);
  }
}

abstract class _DrugClass implements DrugClass {
  factory _DrugClass(
      {required int drugClassID,
      required int drugGroupID,
      required String drugClassName}) = _$_DrugClass;

  factory _DrugClass.fromJson(Map<String, dynamic> json) =
      _$_DrugClass.fromJson;

  @override
  int get drugClassID;
  @override
  int get drugGroupID;
  @override
  String get drugClassName;
  @override
  @JsonKey(ignore: true)
  _$DrugClassCopyWith<_DrugClass> get copyWith =>
      throw _privateConstructorUsedError;
}
