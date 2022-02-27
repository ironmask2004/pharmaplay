// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'drug.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Drug _$DrugFromJson(Map<String, dynamic> json) {
  return _Drug.fromJson(json);
}

/// @nodoc
class _$DrugTearOff {
  const _$DrugTearOff();

  _Drug call(
      {required int drugID,
      required String drugNo,
      required String brandName,
      required String caliber,
      required int genericDrugID,
      required int chemicalDrugID,
      required int manufactoryID,
      required int dosageFormID,
      required int drugClassID,
      required int drugFamilyID,
      required String licenseNumber,
      required String licenseDate,
      required int drugPrice,
      required String drugRating}) {
    return _Drug(
      drugID: drugID,
      drugNo: drugNo,
      brandName: brandName,
      caliber: caliber,
      genericDrugID: genericDrugID,
      chemicalDrugID: chemicalDrugID,
      manufactoryID: manufactoryID,
      dosageFormID: dosageFormID,
      drugClassID: drugClassID,
      drugFamilyID: drugFamilyID,
      licenseNumber: licenseNumber,
      licenseDate: licenseDate,
      drugPrice: drugPrice,
      drugRating: drugRating,
    );
  }

  Drug fromJson(Map<String, Object?> json) {
    return Drug.fromJson(json);
  }
}

/// @nodoc
const $Drug = _$DrugTearOff();

/// @nodoc
mixin _$Drug {
  int get drugID => throw _privateConstructorUsedError;
  String get drugNo => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get caliber => throw _privateConstructorUsedError;
  int get genericDrugID => throw _privateConstructorUsedError;
  int get chemicalDrugID => throw _privateConstructorUsedError;
  int get manufactoryID => throw _privateConstructorUsedError;
  int get dosageFormID => throw _privateConstructorUsedError;
  int get drugClassID => throw _privateConstructorUsedError;
  int get drugFamilyID => throw _privateConstructorUsedError;
  String get licenseNumber => throw _privateConstructorUsedError;
  String get licenseDate => throw _privateConstructorUsedError;
  int get drugPrice => throw _privateConstructorUsedError;
  String get drugRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DrugCopyWith<Drug> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugCopyWith<$Res> {
  factory $DrugCopyWith(Drug value, $Res Function(Drug) then) =
      _$DrugCopyWithImpl<$Res>;
  $Res call(
      {int drugID,
      String drugNo,
      String brandName,
      String caliber,
      int genericDrugID,
      int chemicalDrugID,
      int manufactoryID,
      int dosageFormID,
      int drugClassID,
      int drugFamilyID,
      String licenseNumber,
      String licenseDate,
      int drugPrice,
      String drugRating});
}

/// @nodoc
class _$DrugCopyWithImpl<$Res> implements $DrugCopyWith<$Res> {
  _$DrugCopyWithImpl(this._value, this._then);

  final Drug _value;
  // ignore: unused_field
  final $Res Function(Drug) _then;

  @override
  $Res call({
    Object? drugID = freezed,
    Object? drugNo = freezed,
    Object? brandName = freezed,
    Object? caliber = freezed,
    Object? genericDrugID = freezed,
    Object? chemicalDrugID = freezed,
    Object? manufactoryID = freezed,
    Object? dosageFormID = freezed,
    Object? drugClassID = freezed,
    Object? drugFamilyID = freezed,
    Object? licenseNumber = freezed,
    Object? licenseDate = freezed,
    Object? drugPrice = freezed,
    Object? drugRating = freezed,
  }) {
    return _then(_value.copyWith(
      drugID: drugID == freezed
          ? _value.drugID
          : drugID // ignore: cast_nullable_to_non_nullable
              as int,
      drugNo: drugNo == freezed
          ? _value.drugNo
          : drugNo // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: brandName == freezed
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      caliber: caliber == freezed
          ? _value.caliber
          : caliber // ignore: cast_nullable_to_non_nullable
              as String,
      genericDrugID: genericDrugID == freezed
          ? _value.genericDrugID
          : genericDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      chemicalDrugID: chemicalDrugID == freezed
          ? _value.chemicalDrugID
          : chemicalDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      manufactoryID: manufactoryID == freezed
          ? _value.manufactoryID
          : manufactoryID // ignore: cast_nullable_to_non_nullable
              as int,
      dosageFormID: dosageFormID == freezed
          ? _value.dosageFormID
          : dosageFormID // ignore: cast_nullable_to_non_nullable
              as int,
      drugClassID: drugClassID == freezed
          ? _value.drugClassID
          : drugClassID // ignore: cast_nullable_to_non_nullable
              as int,
      drugFamilyID: drugFamilyID == freezed
          ? _value.drugFamilyID
          : drugFamilyID // ignore: cast_nullable_to_non_nullable
              as int,
      licenseNumber: licenseNumber == freezed
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDate: licenseDate == freezed
          ? _value.licenseDate
          : licenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      drugPrice: drugPrice == freezed
          ? _value.drugPrice
          : drugPrice // ignore: cast_nullable_to_non_nullable
              as int,
      drugRating: drugRating == freezed
          ? _value.drugRating
          : drugRating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$DrugCopyWith<$Res> implements $DrugCopyWith<$Res> {
  factory _$DrugCopyWith(_Drug value, $Res Function(_Drug) then) =
      __$DrugCopyWithImpl<$Res>;
  @override
  $Res call(
      {int drugID,
      String drugNo,
      String brandName,
      String caliber,
      int genericDrugID,
      int chemicalDrugID,
      int manufactoryID,
      int dosageFormID,
      int drugClassID,
      int drugFamilyID,
      String licenseNumber,
      String licenseDate,
      int drugPrice,
      String drugRating});
}

/// @nodoc
class __$DrugCopyWithImpl<$Res> extends _$DrugCopyWithImpl<$Res>
    implements _$DrugCopyWith<$Res> {
  __$DrugCopyWithImpl(_Drug _value, $Res Function(_Drug) _then)
      : super(_value, (v) => _then(v as _Drug));

  @override
  _Drug get _value => super._value as _Drug;

  @override
  $Res call({
    Object? drugID = freezed,
    Object? drugNo = freezed,
    Object? brandName = freezed,
    Object? caliber = freezed,
    Object? genericDrugID = freezed,
    Object? chemicalDrugID = freezed,
    Object? manufactoryID = freezed,
    Object? dosageFormID = freezed,
    Object? drugClassID = freezed,
    Object? drugFamilyID = freezed,
    Object? licenseNumber = freezed,
    Object? licenseDate = freezed,
    Object? drugPrice = freezed,
    Object? drugRating = freezed,
  }) {
    return _then(_Drug(
      drugID: drugID == freezed
          ? _value.drugID
          : drugID // ignore: cast_nullable_to_non_nullable
              as int,
      drugNo: drugNo == freezed
          ? _value.drugNo
          : drugNo // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: brandName == freezed
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      caliber: caliber == freezed
          ? _value.caliber
          : caliber // ignore: cast_nullable_to_non_nullable
              as String,
      genericDrugID: genericDrugID == freezed
          ? _value.genericDrugID
          : genericDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      chemicalDrugID: chemicalDrugID == freezed
          ? _value.chemicalDrugID
          : chemicalDrugID // ignore: cast_nullable_to_non_nullable
              as int,
      manufactoryID: manufactoryID == freezed
          ? _value.manufactoryID
          : manufactoryID // ignore: cast_nullable_to_non_nullable
              as int,
      dosageFormID: dosageFormID == freezed
          ? _value.dosageFormID
          : dosageFormID // ignore: cast_nullable_to_non_nullable
              as int,
      drugClassID: drugClassID == freezed
          ? _value.drugClassID
          : drugClassID // ignore: cast_nullable_to_non_nullable
              as int,
      drugFamilyID: drugFamilyID == freezed
          ? _value.drugFamilyID
          : drugFamilyID // ignore: cast_nullable_to_non_nullable
              as int,
      licenseNumber: licenseNumber == freezed
          ? _value.licenseNumber
          : licenseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      licenseDate: licenseDate == freezed
          ? _value.licenseDate
          : licenseDate // ignore: cast_nullable_to_non_nullable
              as String,
      drugPrice: drugPrice == freezed
          ? _value.drugPrice
          : drugPrice // ignore: cast_nullable_to_non_nullable
              as int,
      drugRating: drugRating == freezed
          ? _value.drugRating
          : drugRating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Drug implements _Drug {
  _$_Drug(
      {required this.drugID,
      required this.drugNo,
      required this.brandName,
      required this.caliber,
      required this.genericDrugID,
      required this.chemicalDrugID,
      required this.manufactoryID,
      required this.dosageFormID,
      required this.drugClassID,
      required this.drugFamilyID,
      required this.licenseNumber,
      required this.licenseDate,
      required this.drugPrice,
      required this.drugRating});

  factory _$_Drug.fromJson(Map<String, dynamic> json) => _$$_DrugFromJson(json);

  @override
  final int drugID;
  @override
  final String drugNo;
  @override
  final String brandName;
  @override
  final String caliber;
  @override
  final int genericDrugID;
  @override
  final int chemicalDrugID;
  @override
  final int manufactoryID;
  @override
  final int dosageFormID;
  @override
  final int drugClassID;
  @override
  final int drugFamilyID;
  @override
  final String licenseNumber;
  @override
  final String licenseDate;
  @override
  final int drugPrice;
  @override
  final String drugRating;

  @override
  String toString() {
    return 'Drug(drugID: $drugID, drugNo: $drugNo, brandName: $brandName, caliber: $caliber, genericDrugID: $genericDrugID, chemicalDrugID: $chemicalDrugID, manufactoryID: $manufactoryID, dosageFormID: $dosageFormID, drugClassID: $drugClassID, drugFamilyID: $drugFamilyID, licenseNumber: $licenseNumber, licenseDate: $licenseDate, drugPrice: $drugPrice, drugRating: $drugRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Drug &&
            const DeepCollectionEquality().equals(other.drugID, drugID) &&
            const DeepCollectionEquality().equals(other.drugNo, drugNo) &&
            const DeepCollectionEquality().equals(other.brandName, brandName) &&
            const DeepCollectionEquality().equals(other.caliber, caliber) &&
            const DeepCollectionEquality()
                .equals(other.genericDrugID, genericDrugID) &&
            const DeepCollectionEquality()
                .equals(other.chemicalDrugID, chemicalDrugID) &&
            const DeepCollectionEquality()
                .equals(other.manufactoryID, manufactoryID) &&
            const DeepCollectionEquality()
                .equals(other.dosageFormID, dosageFormID) &&
            const DeepCollectionEquality()
                .equals(other.drugClassID, drugClassID) &&
            const DeepCollectionEquality()
                .equals(other.drugFamilyID, drugFamilyID) &&
            const DeepCollectionEquality()
                .equals(other.licenseNumber, licenseNumber) &&
            const DeepCollectionEquality()
                .equals(other.licenseDate, licenseDate) &&
            const DeepCollectionEquality().equals(other.drugPrice, drugPrice) &&
            const DeepCollectionEquality()
                .equals(other.drugRating, drugRating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(drugID),
      const DeepCollectionEquality().hash(drugNo),
      const DeepCollectionEquality().hash(brandName),
      const DeepCollectionEquality().hash(caliber),
      const DeepCollectionEquality().hash(genericDrugID),
      const DeepCollectionEquality().hash(chemicalDrugID),
      const DeepCollectionEquality().hash(manufactoryID),
      const DeepCollectionEquality().hash(dosageFormID),
      const DeepCollectionEquality().hash(drugClassID),
      const DeepCollectionEquality().hash(drugFamilyID),
      const DeepCollectionEquality().hash(licenseNumber),
      const DeepCollectionEquality().hash(licenseDate),
      const DeepCollectionEquality().hash(drugPrice),
      const DeepCollectionEquality().hash(drugRating));

  @JsonKey(ignore: true)
  @override
  _$DrugCopyWith<_Drug> get copyWith =>
      __$DrugCopyWithImpl<_Drug>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DrugToJson(this);
  }
}

abstract class _Drug implements Drug {
  factory _Drug(
      {required int drugID,
      required String drugNo,
      required String brandName,
      required String caliber,
      required int genericDrugID,
      required int chemicalDrugID,
      required int manufactoryID,
      required int dosageFormID,
      required int drugClassID,
      required int drugFamilyID,
      required String licenseNumber,
      required String licenseDate,
      required int drugPrice,
      required String drugRating}) = _$_Drug;

  factory _Drug.fromJson(Map<String, dynamic> json) = _$_Drug.fromJson;

  @override
  int get drugID;
  @override
  String get drugNo;
  @override
  String get brandName;
  @override
  String get caliber;
  @override
  int get genericDrugID;
  @override
  int get chemicalDrugID;
  @override
  int get manufactoryID;
  @override
  int get dosageFormID;
  @override
  int get drugClassID;
  @override
  int get drugFamilyID;
  @override
  String get licenseNumber;
  @override
  String get licenseDate;
  @override
  int get drugPrice;
  @override
  String get drugRating;
  @override
  @JsonKey(ignore: true)
  _$DrugCopyWith<_Drug> get copyWith => throw _privateConstructorUsedError;
}
