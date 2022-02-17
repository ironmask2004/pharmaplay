// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drugrecord.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DrugRecord _$DrugRecordFromJson(Map<String, dynamic> json) {
  return _DrugRecord.fromJson(json);
}

/// @nodoc
class _$DrugRecordTearOff {
  const _$DrugRecordTearOff();

  _DrugRecord call(
      {required Drug drug,
      required GenericDrug genericDrug,
      required ChemicalDrug chemicalDrug,
      required Manufactory manufactory,
      required DosageForm dosageForm,
      required DrugClass drugClass,
      required DrugGroup drugGroup,
      required DrugFamily drugFamily}) {
    return _DrugRecord(
      drug: drug,
      genericDrug: genericDrug,
      chemicalDrug: chemicalDrug,
      manufactory: manufactory,
      dosageForm: dosageForm,
      drugClass: drugClass,
      drugGroup: drugGroup,
      drugFamily: drugFamily,
    );
  }

  DrugRecord fromJson(Map<String, Object?> json) {
    return DrugRecord.fromJson(json);
  }
}

/// @nodoc
const $DrugRecord = _$DrugRecordTearOff();

/// @nodoc
mixin _$DrugRecord {
  Drug get drug => throw _privateConstructorUsedError;
  GenericDrug get genericDrug => throw _privateConstructorUsedError;
  ChemicalDrug get chemicalDrug => throw _privateConstructorUsedError;
  Manufactory get manufactory => throw _privateConstructorUsedError;
  DosageForm get dosageForm => throw _privateConstructorUsedError;
  DrugClass get drugClass => throw _privateConstructorUsedError;
  DrugGroup get drugGroup => throw _privateConstructorUsedError;
  DrugFamily get drugFamily => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugRecordCopyWith<DrugRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugRecordCopyWith<$Res> {
  factory $DrugRecordCopyWith(
          DrugRecord value, $Res Function(DrugRecord) then) =
      _$DrugRecordCopyWithImpl<$Res>;
  $Res call(
      {Drug drug,
      GenericDrug genericDrug,
      ChemicalDrug chemicalDrug,
      Manufactory manufactory,
      DosageForm dosageForm,
      DrugClass drugClass,
      DrugGroup drugGroup,
      DrugFamily drugFamily});

  $DrugCopyWith<$Res> get drug;
  $GenericDrugCopyWith<$Res> get genericDrug;
  $ChemicalDrugCopyWith<$Res> get chemicalDrug;
  $ManufactoryCopyWith<$Res> get manufactory;
  $DosageFormCopyWith<$Res> get dosageForm;
  $DrugClassCopyWith<$Res> get drugClass;
  $DrugGroupCopyWith<$Res> get drugGroup;
  $DrugFamilyCopyWith<$Res> get drugFamily;
}

/// @nodoc
class _$DrugRecordCopyWithImpl<$Res> implements $DrugRecordCopyWith<$Res> {
  _$DrugRecordCopyWithImpl(this._value, this._then);

  final DrugRecord _value;
  // ignore: unused_field
  final $Res Function(DrugRecord) _then;

  @override
  $Res call({
    Object? drug = freezed,
    Object? genericDrug = freezed,
    Object? chemicalDrug = freezed,
    Object? manufactory = freezed,
    Object? dosageForm = freezed,
    Object? drugClass = freezed,
    Object? drugGroup = freezed,
    Object? drugFamily = freezed,
  }) {
    return _then(_value.copyWith(
      drug: drug == freezed
          ? _value.drug
          : drug // ignore: cast_nullable_to_non_nullable
              as Drug,
      genericDrug: genericDrug == freezed
          ? _value.genericDrug
          : genericDrug // ignore: cast_nullable_to_non_nullable
              as GenericDrug,
      chemicalDrug: chemicalDrug == freezed
          ? _value.chemicalDrug
          : chemicalDrug // ignore: cast_nullable_to_non_nullable
              as ChemicalDrug,
      manufactory: manufactory == freezed
          ? _value.manufactory
          : manufactory // ignore: cast_nullable_to_non_nullable
              as Manufactory,
      dosageForm: dosageForm == freezed
          ? _value.dosageForm
          : dosageForm // ignore: cast_nullable_to_non_nullable
              as DosageForm,
      drugClass: drugClass == freezed
          ? _value.drugClass
          : drugClass // ignore: cast_nullable_to_non_nullable
              as DrugClass,
      drugGroup: drugGroup == freezed
          ? _value.drugGroup
          : drugGroup // ignore: cast_nullable_to_non_nullable
              as DrugGroup,
      drugFamily: drugFamily == freezed
          ? _value.drugFamily
          : drugFamily // ignore: cast_nullable_to_non_nullable
              as DrugFamily,
    ));
  }

  @override
  $DrugCopyWith<$Res> get drug {
    return $DrugCopyWith<$Res>(_value.drug, (value) {
      return _then(_value.copyWith(drug: value));
    });
  }

  @override
  $GenericDrugCopyWith<$Res> get genericDrug {
    return $GenericDrugCopyWith<$Res>(_value.genericDrug, (value) {
      return _then(_value.copyWith(genericDrug: value));
    });
  }

  @override
  $ChemicalDrugCopyWith<$Res> get chemicalDrug {
    return $ChemicalDrugCopyWith<$Res>(_value.chemicalDrug, (value) {
      return _then(_value.copyWith(chemicalDrug: value));
    });
  }

  @override
  $ManufactoryCopyWith<$Res> get manufactory {
    return $ManufactoryCopyWith<$Res>(_value.manufactory, (value) {
      return _then(_value.copyWith(manufactory: value));
    });
  }

  @override
  $DosageFormCopyWith<$Res> get dosageForm {
    return $DosageFormCopyWith<$Res>(_value.dosageForm, (value) {
      return _then(_value.copyWith(dosageForm: value));
    });
  }

  @override
  $DrugClassCopyWith<$Res> get drugClass {
    return $DrugClassCopyWith<$Res>(_value.drugClass, (value) {
      return _then(_value.copyWith(drugClass: value));
    });
  }

  @override
  $DrugGroupCopyWith<$Res> get drugGroup {
    return $DrugGroupCopyWith<$Res>(_value.drugGroup, (value) {
      return _then(_value.copyWith(drugGroup: value));
    });
  }

  @override
  $DrugFamilyCopyWith<$Res> get drugFamily {
    return $DrugFamilyCopyWith<$Res>(_value.drugFamily, (value) {
      return _then(_value.copyWith(drugFamily: value));
    });
  }
}

/// @nodoc
abstract class _$DrugRecordCopyWith<$Res> implements $DrugRecordCopyWith<$Res> {
  factory _$DrugRecordCopyWith(
          _DrugRecord value, $Res Function(_DrugRecord) then) =
      __$DrugRecordCopyWithImpl<$Res>;
  @override
  $Res call(
      {Drug drug,
      GenericDrug genericDrug,
      ChemicalDrug chemicalDrug,
      Manufactory manufactory,
      DosageForm dosageForm,
      DrugClass drugClass,
      DrugGroup drugGroup,
      DrugFamily drugFamily});

  @override
  $DrugCopyWith<$Res> get drug;
  @override
  $GenericDrugCopyWith<$Res> get genericDrug;
  @override
  $ChemicalDrugCopyWith<$Res> get chemicalDrug;
  @override
  $ManufactoryCopyWith<$Res> get manufactory;
  @override
  $DosageFormCopyWith<$Res> get dosageForm;
  @override
  $DrugClassCopyWith<$Res> get drugClass;
  @override
  $DrugGroupCopyWith<$Res> get drugGroup;
  @override
  $DrugFamilyCopyWith<$Res> get drugFamily;
}

/// @nodoc
class __$DrugRecordCopyWithImpl<$Res> extends _$DrugRecordCopyWithImpl<$Res>
    implements _$DrugRecordCopyWith<$Res> {
  __$DrugRecordCopyWithImpl(
      _DrugRecord _value, $Res Function(_DrugRecord) _then)
      : super(_value, (v) => _then(v as _DrugRecord));

  @override
  _DrugRecord get _value => super._value as _DrugRecord;

  @override
  $Res call({
    Object? drug = freezed,
    Object? genericDrug = freezed,
    Object? chemicalDrug = freezed,
    Object? manufactory = freezed,
    Object? dosageForm = freezed,
    Object? drugClass = freezed,
    Object? drugGroup = freezed,
    Object? drugFamily = freezed,
  }) {
    return _then(_DrugRecord(
      drug: drug == freezed
          ? _value.drug
          : drug // ignore: cast_nullable_to_non_nullable
              as Drug,
      genericDrug: genericDrug == freezed
          ? _value.genericDrug
          : genericDrug // ignore: cast_nullable_to_non_nullable
              as GenericDrug,
      chemicalDrug: chemicalDrug == freezed
          ? _value.chemicalDrug
          : chemicalDrug // ignore: cast_nullable_to_non_nullable
              as ChemicalDrug,
      manufactory: manufactory == freezed
          ? _value.manufactory
          : manufactory // ignore: cast_nullable_to_non_nullable
              as Manufactory,
      dosageForm: dosageForm == freezed
          ? _value.dosageForm
          : dosageForm // ignore: cast_nullable_to_non_nullable
              as DosageForm,
      drugClass: drugClass == freezed
          ? _value.drugClass
          : drugClass // ignore: cast_nullable_to_non_nullable
              as DrugClass,
      drugGroup: drugGroup == freezed
          ? _value.drugGroup
          : drugGroup // ignore: cast_nullable_to_non_nullable
              as DrugGroup,
      drugFamily: drugFamily == freezed
          ? _value.drugFamily
          : drugFamily // ignore: cast_nullable_to_non_nullable
              as DrugFamily,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DrugRecord implements _DrugRecord {
  _$_DrugRecord(
      {required this.drug,
      required this.genericDrug,
      required this.chemicalDrug,
      required this.manufactory,
      required this.dosageForm,
      required this.drugClass,
      required this.drugGroup,
      required this.drugFamily});

  factory _$_DrugRecord.fromJson(Map<String, dynamic> json) =>
      _$$_DrugRecordFromJson(json);

  @override
  final Drug drug;
  @override
  final GenericDrug genericDrug;
  @override
  final ChemicalDrug chemicalDrug;
  @override
  final Manufactory manufactory;
  @override
  final DosageForm dosageForm;
  @override
  final DrugClass drugClass;
  @override
  final DrugGroup drugGroup;
  @override
  final DrugFamily drugFamily;

  @override
  String toString() {
    return 'DrugRecord(drug: $drug, genericDrug: $genericDrug, chemicalDrug: $chemicalDrug, manufactory: $manufactory, dosageForm: $dosageForm, drugClass: $drugClass, drugGroup: $drugGroup, drugFamily: $drugFamily)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DrugRecord &&
            const DeepCollectionEquality().equals(other.drug, drug) &&
            const DeepCollectionEquality()
                .equals(other.genericDrug, genericDrug) &&
            const DeepCollectionEquality()
                .equals(other.chemicalDrug, chemicalDrug) &&
            const DeepCollectionEquality()
                .equals(other.manufactory, manufactory) &&
            const DeepCollectionEquality()
                .equals(other.dosageForm, dosageForm) &&
            const DeepCollectionEquality().equals(other.drugClass, drugClass) &&
            const DeepCollectionEquality().equals(other.drugGroup, drugGroup) &&
            const DeepCollectionEquality()
                .equals(other.drugFamily, drugFamily));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(drug),
      const DeepCollectionEquality().hash(genericDrug),
      const DeepCollectionEquality().hash(chemicalDrug),
      const DeepCollectionEquality().hash(manufactory),
      const DeepCollectionEquality().hash(dosageForm),
      const DeepCollectionEquality().hash(drugClass),
      const DeepCollectionEquality().hash(drugGroup),
      const DeepCollectionEquality().hash(drugFamily));

  @JsonKey(ignore: true)
  @override
  _$DrugRecordCopyWith<_DrugRecord> get copyWith =>
      __$DrugRecordCopyWithImpl<_DrugRecord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrugRecordToJson(this);
  }
}

abstract class _DrugRecord implements DrugRecord {
  factory _DrugRecord(
      {required Drug drug,
      required GenericDrug genericDrug,
      required ChemicalDrug chemicalDrug,
      required Manufactory manufactory,
      required DosageForm dosageForm,
      required DrugClass drugClass,
      required DrugGroup drugGroup,
      required DrugFamily drugFamily}) = _$_DrugRecord;

  factory _DrugRecord.fromJson(Map<String, dynamic> json) =
      _$_DrugRecord.fromJson;

  @override
  Drug get drug;
  @override
  GenericDrug get genericDrug;
  @override
  ChemicalDrug get chemicalDrug;
  @override
  Manufactory get manufactory;
  @override
  DosageForm get dosageForm;
  @override
  DrugClass get drugClass;
  @override
  DrugGroup get drugGroup;
  @override
  DrugFamily get drugFamily;
  @override
  @JsonKey(ignore: true)
  _$DrugRecordCopyWith<_DrugRecord> get copyWith =>
      throw _privateConstructorUsedError;
}
