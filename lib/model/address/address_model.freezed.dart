// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'address_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return _AddressModel.fromJson(json);
}

/// @nodoc
class _$AddressModelTearOff {
  const _$AddressModelTearOff();

  _AddressModel call(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode}) {
    return _AddressModel(
      address1: address1,
      address2: address2,
      address3: address3,
      city: city,
      state: state,
      postcode: postcode,
    );
  }

  AddressModel fromJson(Map<String, Object?> json) {
    return AddressModel.fromJson(json);
  }
}

/// @nodoc
const $AddressModel = _$AddressModelTearOff();

/// @nodoc
mixin _$AddressModel {
  @JsonKey(name: 'address1')
  String? get address1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address2')
  String? get address2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address3')
  String? get address3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String? get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String? get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'postcode')
  int? get postcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressModelCopyWith<AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressModelCopyWith<$Res> {
  factory $AddressModelCopyWith(
          AddressModel value, $Res Function(AddressModel) then) =
      _$AddressModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode});
}

/// @nodoc
class _$AddressModelCopyWithImpl<$Res> implements $AddressModelCopyWith<$Res> {
  _$AddressModelCopyWithImpl(this._value, this._then);

  final AddressModel _value;
  // ignore: unused_field
  final $Res Function(AddressModel) _then;

  @override
  $Res call({
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? address3 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postcode = freezed,
  }) {
    return _then(_value.copyWith(
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address3: address3 == freezed
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: postcode == freezed
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$AddressModelCopyWith<$Res>
    implements $AddressModelCopyWith<$Res> {
  factory _$AddressModelCopyWith(
          _AddressModel value, $Res Function(_AddressModel) then) =
      __$AddressModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode});
}

/// @nodoc
class __$AddressModelCopyWithImpl<$Res> extends _$AddressModelCopyWithImpl<$Res>
    implements _$AddressModelCopyWith<$Res> {
  __$AddressModelCopyWithImpl(
      _AddressModel _value, $Res Function(_AddressModel) _then)
      : super(_value, (v) => _then(v as _AddressModel));

  @override
  _AddressModel get _value => super._value as _AddressModel;

  @override
  $Res call({
    Object? address1 = freezed,
    Object? address2 = freezed,
    Object? address3 = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? postcode = freezed,
  }) {
    return _then(_AddressModel(
      address1: address1 == freezed
          ? _value.address1
          : address1 // ignore: cast_nullable_to_non_nullable
              as String?,
      address2: address2 == freezed
          ? _value.address2
          : address2 // ignore: cast_nullable_to_non_nullable
              as String?,
      address3: address3 == freezed
          ? _value.address3
          : address3 // ignore: cast_nullable_to_non_nullable
              as String?,
      city: city == freezed
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      postcode: postcode == freezed
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_AddressModel implements _AddressModel {
  const _$_AddressModel(
      {@JsonKey(name: 'address1') this.address1,
      @JsonKey(name: 'address2') this.address2,
      @JsonKey(name: 'address3') this.address3,
      @JsonKey(name: 'city') this.city,
      @JsonKey(name: 'state') this.state,
      @JsonKey(name: 'postcode') this.postcode});

  factory _$_AddressModel.fromJson(Map<String, dynamic> json) =>
      _$$_AddressModelFromJson(json);

  @override
  @JsonKey(name: 'address1')
  final String? address1;
  @override
  @JsonKey(name: 'address2')
  final String? address2;
  @override
  @JsonKey(name: 'address3')
  final String? address3;
  @override
  @JsonKey(name: 'city')
  final String? city;
  @override
  @JsonKey(name: 'state')
  final String? state;
  @override
  @JsonKey(name: 'postcode')
  final int? postcode;

  @override
  String toString() {
    return 'AddressModel(address1: $address1, address2: $address2, address3: $address3, city: $city, state: $state, postcode: $postcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressModel &&
            (identical(other.address1, address1) ||
                other.address1 == address1) &&
            (identical(other.address2, address2) ||
                other.address2 == address2) &&
            (identical(other.address3, address3) ||
                other.address3 == address3) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, address1, address2, address3, city, state, postcode);

  @JsonKey(ignore: true)
  @override
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      __$AddressModelCopyWithImpl<_AddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressModelToJson(this);
  }
}

abstract class _AddressModel implements AddressModel {
  const factory _AddressModel(
      {@JsonKey(name: 'address1') String? address1,
      @JsonKey(name: 'address2') String? address2,
      @JsonKey(name: 'address3') String? address3,
      @JsonKey(name: 'city') String? city,
      @JsonKey(name: 'state') String? state,
      @JsonKey(name: 'postcode') int? postcode}) = _$_AddressModel;

  factory _AddressModel.fromJson(Map<String, dynamic> json) =
      _$_AddressModel.fromJson;

  @override
  @JsonKey(name: 'address1')
  String? get address1;
  @override
  @JsonKey(name: 'address2')
  String? get address2;
  @override
  @JsonKey(name: 'address3')
  String? get address3;
  @override
  @JsonKey(name: 'city')
  String? get city;
  @override
  @JsonKey(name: 'state')
  String? get state;
  @override
  @JsonKey(name: 'postcode')
  int? get postcode;
  @override
  @JsonKey(ignore: true)
  _$AddressModelCopyWith<_AddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}
