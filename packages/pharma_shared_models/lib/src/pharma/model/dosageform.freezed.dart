// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'dosageform.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DosageForm _$DosageFormFromJson(Map<String, dynamic> json) {
  return _Dosageform.fromJson(json);
}

/// @nodoc
class _$DosageFormTearOff {
  const _$DosageFormTearOff();

  _Dosageform call({required int dosageFormID, required String dosageForm}) {
    return _Dosageform(
      dosageFormID: dosageFormID,
      dosageForm: dosageForm,
    );
  }

  DosageForm fromJson(Map<String, Object?> json) {
    return DosageForm.fromJson(json);
  }
}

/// @nodoc
const $DosageForm = _$DosageFormTearOff();

/// @nodoc
mixin _$DosageForm {
  int get dosageFormID => throw _privateConstructorUsedError;
  String get dosageForm => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DosageFormCopyWith<DosageForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DosageFormCopyWith<$Res> {
  factory $DosageFormCopyWith(
          DosageForm value, $Res Function(DosageForm) then) =
      _$DosageFormCopyWithImpl<$Res>;
  $Res call({int dosageFormID, String dosageForm});
}

/// @nodoc
class _$DosageFormCopyWithImpl<$Res> implements $DosageFormCopyWith<$Res> {
  _$DosageFormCopyWithImpl(this._value, this._then);

  final DosageForm _value;
  // ignore: unused_field
  final $Res Function(DosageForm) _then;

  @override
  $Res call({
    Object? dosageFormID = freezed,
    Object? dosageForm = freezed,
  }) {
    return _then(_value.copyWith(
      dosageFormID: dosageFormID == freezed
          ? _value.dosageFormID
          : dosageFormID // ignore: cast_nullable_to_non_nullable
              as int,
      dosageForm: dosageForm == freezed
          ? _value.dosageForm
          : dosageForm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DosageformCopyWith<$Res> implements $DosageFormCopyWith<$Res> {
  factory _$DosageformCopyWith(
          _Dosageform value, $Res Function(_Dosageform) then) =
      __$DosageformCopyWithImpl<$Res>;
  @override
  $Res call({int dosageFormID, String dosageForm});
}

/// @nodoc
class __$DosageformCopyWithImpl<$Res> extends _$DosageFormCopyWithImpl<$Res>
    implements _$DosageformCopyWith<$Res> {
  __$DosageformCopyWithImpl(
      _Dosageform _value, $Res Function(_Dosageform) _then)
      : super(_value, (v) => _then(v as _Dosageform));

  @override
  _Dosageform get _value => super._value as _Dosageform;

  @override
  $Res call({
    Object? dosageFormID = freezed,
    Object? dosageForm = freezed,
  }) {
    return _then(_Dosageform(
      dosageFormID: dosageFormID == freezed
          ? _value.dosageFormID
          : dosageFormID // ignore: cast_nullable_to_non_nullable
              as int,
      dosageForm: dosageForm == freezed
          ? _value.dosageForm
          : dosageForm // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Dosageform implements _Dosageform {
  _$_Dosageform({required this.dosageFormID, required this.dosageForm});

  factory _$_Dosageform.fromJson(Map<String, dynamic> json) =>
      _$$_DosageformFromJson(json);

  @override
  final int dosageFormID;
  @override
  final String dosageForm;

  @override
  String toString() {
    return 'DosageForm(dosageFormID: $dosageFormID, dosageForm: $dosageForm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dosageform &&
            const DeepCollectionEquality()
                .equals(other.dosageFormID, dosageFormID) &&
            const DeepCollectionEquality()
                .equals(other.dosageForm, dosageForm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(dosageFormID),
      const DeepCollectionEquality().hash(dosageForm));

  @JsonKey(ignore: true)
  @override
  _$DosageformCopyWith<_Dosageform> get copyWith =>
      __$DosageformCopyWithImpl<_Dosageform>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DosageformToJson(this);
  }
}

abstract class _Dosageform implements DosageForm {
  factory _Dosageform({required int dosageFormID, required String dosageForm}) =
      _$_Dosageform;

  factory _Dosageform.fromJson(Map<String, dynamic> json) =
      _$_Dosageform.fromJson;

  @override
  int get dosageFormID;
  @override
  String get dosageForm;
  @override
  @JsonKey(ignore: true)
  _$DosageformCopyWith<_Dosageform> get copyWith =>
      throw _privateConstructorUsedError;
}
