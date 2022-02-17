// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'druggroup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DrugGroup _$DrugGroupFromJson(Map<String, dynamic> json) {
  return _DrugGroup.fromJson(json);
}

/// @nodoc
class _$DrugGroupTearOff {
  const _$DrugGroupTearOff();

  _DrugGroup call({required int drugGroupID, required String drugGroupName}) {
    return _DrugGroup(
      drugGroupID: drugGroupID,
      drugGroupName: drugGroupName,
    );
  }

  DrugGroup fromJson(Map<String, Object?> json) {
    return DrugGroup.fromJson(json);
  }
}

/// @nodoc
const $DrugGroup = _$DrugGroupTearOff();

/// @nodoc
mixin _$DrugGroup {
  int get drugGroupID => throw _privateConstructorUsedError;
  String get drugGroupName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugGroupCopyWith<DrugGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugGroupCopyWith<$Res> {
  factory $DrugGroupCopyWith(DrugGroup value, $Res Function(DrugGroup) then) =
      _$DrugGroupCopyWithImpl<$Res>;
  $Res call({int drugGroupID, String drugGroupName});
}

/// @nodoc
class _$DrugGroupCopyWithImpl<$Res> implements $DrugGroupCopyWith<$Res> {
  _$DrugGroupCopyWithImpl(this._value, this._then);

  final DrugGroup _value;
  // ignore: unused_field
  final $Res Function(DrugGroup) _then;

  @override
  $Res call({
    Object? drugGroupID = freezed,
    Object? drugGroupName = freezed,
  }) {
    return _then(_value.copyWith(
      drugGroupID: drugGroupID == freezed
          ? _value.drugGroupID
          : drugGroupID // ignore: cast_nullable_to_non_nullable
              as int,
      drugGroupName: drugGroupName == freezed
          ? _value.drugGroupName
          : drugGroupName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DrugGroupCopyWith<$Res> implements $DrugGroupCopyWith<$Res> {
  factory _$DrugGroupCopyWith(
          _DrugGroup value, $Res Function(_DrugGroup) then) =
      __$DrugGroupCopyWithImpl<$Res>;
  @override
  $Res call({int drugGroupID, String drugGroupName});
}

/// @nodoc
class __$DrugGroupCopyWithImpl<$Res> extends _$DrugGroupCopyWithImpl<$Res>
    implements _$DrugGroupCopyWith<$Res> {
  __$DrugGroupCopyWithImpl(_DrugGroup _value, $Res Function(_DrugGroup) _then)
      : super(_value, (v) => _then(v as _DrugGroup));

  @override
  _DrugGroup get _value => super._value as _DrugGroup;

  @override
  $Res call({
    Object? drugGroupID = freezed,
    Object? drugGroupName = freezed,
  }) {
    return _then(_DrugGroup(
      drugGroupID: drugGroupID == freezed
          ? _value.drugGroupID
          : drugGroupID // ignore: cast_nullable_to_non_nullable
              as int,
      drugGroupName: drugGroupName == freezed
          ? _value.drugGroupName
          : drugGroupName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DrugGroup implements _DrugGroup {
  _$_DrugGroup({required this.drugGroupID, required this.drugGroupName});

  factory _$_DrugGroup.fromJson(Map<String, dynamic> json) =>
      _$$_DrugGroupFromJson(json);

  @override
  final int drugGroupID;
  @override
  final String drugGroupName;

  @override
  String toString() {
    return 'DrugGroup(drugGroupID: $drugGroupID, drugGroupName: $drugGroupName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrugGroup &&
            const DeepCollectionEquality()
                .equals(other.drugGroupID, drugGroupID) &&
            const DeepCollectionEquality()
                .equals(other.drugGroupName, drugGroupName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(drugGroupID),
      const DeepCollectionEquality().hash(drugGroupName));

  @JsonKey(ignore: true)
  @override
  _$DrugGroupCopyWith<_DrugGroup> get copyWith =>
      __$DrugGroupCopyWithImpl<_DrugGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrugGroupToJson(this);
  }
}

abstract class _DrugGroup implements DrugGroup {
  factory _DrugGroup(
      {required int drugGroupID, required String drugGroupName}) = _$_DrugGroup;

  factory _DrugGroup.fromJson(Map<String, dynamic> json) =
      _$_DrugGroup.fromJson;

  @override
  int get drugGroupID;
  @override
  String get drugGroupName;
  @override
  @JsonKey(ignore: true)
  _$DrugGroupCopyWith<_DrugGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
