// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'testfreezed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TestFreezed _$TestFreezedFromJson(Map<String, dynamic> json) {
  return _TestFreezed.fromJson(json);
}

/// @nodoc
class _$TestFreezedTearOff {
  const _$TestFreezedTearOff();

  _TestFreezed call({String? name, int? age}) {
    return _TestFreezed(
      name: name,
      age: age,
    );
  }

  TestFreezed fromJson(Map<String, Object?> json) {
    return TestFreezed.fromJson(json);
  }
}

/// @nodoc
const $TestFreezed = _$TestFreezedTearOff();

/// @nodoc
mixin _$TestFreezed {
  String? get name => throw _privateConstructorUsedError;
  int? get age => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TestFreezedCopyWith<TestFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestFreezedCopyWith<$Res> {
  factory $TestFreezedCopyWith(
          TestFreezed value, $Res Function(TestFreezed) then) =
      _$TestFreezedCopyWithImpl<$Res>;
  $Res call({String? name, int? age});
}

/// @nodoc
class _$TestFreezedCopyWithImpl<$Res> implements $TestFreezedCopyWith<$Res> {
  _$TestFreezedCopyWithImpl(this._value, this._then);

  final TestFreezed _value;
  // ignore: unused_field
  final $Res Function(TestFreezed) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$TestFreezedCopyWith<$Res>
    implements $TestFreezedCopyWith<$Res> {
  factory _$TestFreezedCopyWith(
          _TestFreezed value, $Res Function(_TestFreezed) then) =
      __$TestFreezedCopyWithImpl<$Res>;
  @override
  $Res call({String? name, int? age});
}

/// @nodoc
class __$TestFreezedCopyWithImpl<$Res> extends _$TestFreezedCopyWithImpl<$Res>
    implements _$TestFreezedCopyWith<$Res> {
  __$TestFreezedCopyWithImpl(
      _TestFreezed _value, $Res Function(_TestFreezed) _then)
      : super(_value, (v) => _then(v as _TestFreezed));

  @override
  _TestFreezed get _value => super._value as _TestFreezed;

  @override
  $Res call({
    Object? name = freezed,
    Object? age = freezed,
  }) {
    return _then(_TestFreezed(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      age: age == freezed
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TestFreezed with DiagnosticableTreeMixin implements _TestFreezed {
  _$_TestFreezed({this.name, this.age});

  factory _$_TestFreezed.fromJson(Map<String, dynamic> json) =>
      _$$_TestFreezedFromJson(json);

  @override
  final String? name;
  @override
  final int? age;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TestFreezed(name: $name, age: $age)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TestFreezed'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('age', age));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TestFreezed &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.age, age));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(age));

  @JsonKey(ignore: true)
  @override
  _$TestFreezedCopyWith<_TestFreezed> get copyWith =>
      __$TestFreezedCopyWithImpl<_TestFreezed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TestFreezedToJson(this);
  }
}

abstract class _TestFreezed implements TestFreezed {
  factory _TestFreezed({String? name, int? age}) = _$_TestFreezed;

  factory _TestFreezed.fromJson(Map<String, dynamic> json) =
      _$_TestFreezed.fromJson;

  @override
  String? get name;
  @override
  int? get age;
  @override
  @JsonKey(ignore: true)
  _$TestFreezedCopyWith<_TestFreezed> get copyWith =>
      throw _privateConstructorUsedError;
}
