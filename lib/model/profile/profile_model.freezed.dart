// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitaroProfile _$KitaroProfileFromJson(Map<String, dynamic> json) {
  return _KitaroProfile.fromJson(json);
}

/// @nodoc
class _$KitaroProfileTearOff {
  const _$KitaroProfileTearOff();

  _KitaroProfile call(
      {@JsonKey(name: 'firstName') String? firstName,
      @JsonKey(name: 'lastName') String? lastName,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'idNo') int? idNo,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'recycles') List<String>? type}) {
    return _KitaroProfile(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      email: email,
      idNo: idNo,
      address: address,
      type: type,
    );
  }

  KitaroProfile fromJson(Map<String, Object?> json) {
    return KitaroProfile.fromJson(json);
  }
}

/// @nodoc
const $KitaroProfile = _$KitaroProfileTearOff();

/// @nodoc
mixin _$KitaroProfile {
  @JsonKey(name: 'firstName')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lastName')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'idNo')
  int? get idNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'recycles')
  List<String>? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitaroProfileCopyWith<KitaroProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitaroProfileCopyWith<$Res> {
  factory $KitaroProfileCopyWith(
          KitaroProfile value, $Res Function(KitaroProfile) then) =
      _$KitaroProfileCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'firstName') String? firstName,
      @JsonKey(name: 'lastName') String? lastName,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'idNo') int? idNo,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'recycles') List<String>? type});
}

/// @nodoc
class _$KitaroProfileCopyWithImpl<$Res>
    implements $KitaroProfileCopyWith<$Res> {
  _$KitaroProfileCopyWithImpl(this._value, this._then);

  final KitaroProfile _value;
  // ignore: unused_field
  final $Res Function(KitaroProfile) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? idNo = freezed,
    Object? address = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: idNo == freezed
          ? _value.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$KitaroProfileCopyWith<$Res>
    implements $KitaroProfileCopyWith<$Res> {
  factory _$KitaroProfileCopyWith(
          _KitaroProfile value, $Res Function(_KitaroProfile) then) =
      __$KitaroProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'firstName') String? firstName,
      @JsonKey(name: 'lastName') String? lastName,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'idNo') int? idNo,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'recycles') List<String>? type});
}

/// @nodoc
class __$KitaroProfileCopyWithImpl<$Res>
    extends _$KitaroProfileCopyWithImpl<$Res>
    implements _$KitaroProfileCopyWith<$Res> {
  __$KitaroProfileCopyWithImpl(
      _KitaroProfile _value, $Res Function(_KitaroProfile) _then)
      : super(_value, (v) => _then(v as _KitaroProfile));

  @override
  _KitaroProfile get _value => super._value as _KitaroProfile;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? idNo = freezed,
    Object? address = freezed,
    Object? type = freezed,
  }) {
    return _then(_KitaroProfile(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      idNo: idNo == freezed
          ? _value.idNo
          : idNo // ignore: cast_nullable_to_non_nullable
              as int?,
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_KitaroProfile implements _KitaroProfile {
  _$_KitaroProfile(
      {@JsonKey(name: 'firstName') this.firstName,
      @JsonKey(name: 'lastName') this.lastName,
      @JsonKey(name: 'phone') this.phoneNumber,
      @JsonKey(name: 'email') this.email,
      @JsonKey(name: 'idNo') this.idNo,
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'recycles') this.type});

  factory _$_KitaroProfile.fromJson(Map<String, dynamic> json) =>
      _$$_KitaroProfileFromJson(json);

  @override
  @JsonKey(name: 'firstName')
  final String? firstName;
  @override
  @JsonKey(name: 'lastName')
  final String? lastName;
  @override
  @JsonKey(name: 'phone')
  final String? phoneNumber;
  @override
  @JsonKey(name: 'email')
  final String? email;
  @override
  @JsonKey(name: 'idNo')
  final int? idNo;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'recycles')
  final List<String>? type;

  @override
  String toString() {
    return 'KitaroProfile(firstName: $firstName, lastName: $lastName, phoneNumber: $phoneNumber, email: $email, idNo: $idNo, address: $address, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitaroProfile &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.idNo, idNo) || other.idNo == idNo) &&
            (identical(other.address, address) || other.address == address) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstName, lastName, phoneNumber,
      email, idNo, address, const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$KitaroProfileCopyWith<_KitaroProfile> get copyWith =>
      __$KitaroProfileCopyWithImpl<_KitaroProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KitaroProfileToJson(this);
  }
}

abstract class _KitaroProfile implements KitaroProfile {
  factory _KitaroProfile(
      {@JsonKey(name: 'firstName') String? firstName,
      @JsonKey(name: 'lastName') String? lastName,
      @JsonKey(name: 'phone') String? phoneNumber,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'idNo') int? idNo,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'recycles') List<String>? type}) = _$_KitaroProfile;

  factory _KitaroProfile.fromJson(Map<String, dynamic> json) =
      _$_KitaroProfile.fromJson;

  @override
  @JsonKey(name: 'firstName')
  String? get firstName;
  @override
  @JsonKey(name: 'lastName')
  String? get lastName;
  @override
  @JsonKey(name: 'phone')
  String? get phoneNumber;
  @override
  @JsonKey(name: 'email')
  String? get email;
  @override
  @JsonKey(name: 'idNo')
  int? get idNo;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'recycles')
  List<String>? get type;
  @override
  @JsonKey(ignore: true)
  _$KitaroProfileCopyWith<_KitaroProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
