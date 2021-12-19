// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
class _$LocationModelTearOff {
  const _$LocationModelTearOff();

  _LocationModel call(
      {@JsonKey(name: 'address') AddressModel? address,
      @JsonKey(name: 'direction') String? direction,
      @JsonKey(name: 'isWeight') int? isWeight,
      @JsonKey(name: 'lat') int? lat,
      @JsonKey(name: 'long') int? long,
      @JsonKey(name: 'name') int? name,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'wastes') List<WasteModel>? wastes}) {
    return _LocationModel(
      address: address,
      direction: direction,
      isWeight: isWeight,
      lat: lat,
      long: long,
      name: name,
      type: type,
      wastes: wastes,
    );
  }

  LocationModel fromJson(Map<String, Object?> json) {
    return LocationModel.fromJson(json);
  }
}

/// @nodoc
const $LocationModel = _$LocationModelTearOff();

/// @nodoc
mixin _$LocationModel {
  @JsonKey(name: 'address')
  AddressModel? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'direction')
  String? get direction => throw _privateConstructorUsedError;
  @JsonKey(name: 'isWeight')
  int? get isWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'lat')
  int? get lat => throw _privateConstructorUsedError;
  @JsonKey(name: 'long')
  int? get long => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  int? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  int? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'wastes')
  List<WasteModel>? get wastes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'address') AddressModel? address,
      @JsonKey(name: 'direction') String? direction,
      @JsonKey(name: 'isWeight') int? isWeight,
      @JsonKey(name: 'lat') int? lat,
      @JsonKey(name: 'long') int? long,
      @JsonKey(name: 'name') int? name,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'wastes') List<WasteModel>? wastes});

  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

  final LocationModel _value;
  // ignore: unused_field
  final $Res Function(LocationModel) _then;

  @override
  $Res call({
    Object? address = freezed,
    Object? direction = freezed,
    Object? isWeight = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? wastes = freezed,
  }) {
    return _then(_value.copyWith(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      isWeight: isWeight == freezed
          ? _value.isWeight
          : isWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as int?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      wastes: wastes == freezed
          ? _value.wastes
          : wastes // ignore: cast_nullable_to_non_nullable
              as List<WasteModel>?,
    ));
  }

  @override
  $AddressModelCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressModelCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc
abstract class _$LocationModelCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$LocationModelCopyWith(
          _LocationModel value, $Res Function(_LocationModel) then) =
      __$LocationModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'address') AddressModel? address,
      @JsonKey(name: 'direction') String? direction,
      @JsonKey(name: 'isWeight') int? isWeight,
      @JsonKey(name: 'lat') int? lat,
      @JsonKey(name: 'long') int? long,
      @JsonKey(name: 'name') int? name,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'wastes') List<WasteModel>? wastes});

  @override
  $AddressModelCopyWith<$Res>? get address;
}

/// @nodoc
class __$LocationModelCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res>
    implements _$LocationModelCopyWith<$Res> {
  __$LocationModelCopyWithImpl(
      _LocationModel _value, $Res Function(_LocationModel) _then)
      : super(_value, (v) => _then(v as _LocationModel));

  @override
  _LocationModel get _value => super._value as _LocationModel;

  @override
  $Res call({
    Object? address = freezed,
    Object? direction = freezed,
    Object? isWeight = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? wastes = freezed,
  }) {
    return _then(_LocationModel(
      address: address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressModel?,
      direction: direction == freezed
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      isWeight: isWeight == freezed
          ? _value.isWeight
          : isWeight // ignore: cast_nullable_to_non_nullable
              as int?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as int?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as int?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as int?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as int?,
      wastes: wastes == freezed
          ? _value.wastes
          : wastes // ignore: cast_nullable_to_non_nullable
              as List<WasteModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_LocationModel implements _LocationModel {
  const _$_LocationModel(
      {@JsonKey(name: 'address') this.address,
      @JsonKey(name: 'direction') this.direction,
      @JsonKey(name: 'isWeight') this.isWeight,
      @JsonKey(name: 'lat') this.lat,
      @JsonKey(name: 'long') this.long,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'wastes') this.wastes});

  factory _$_LocationModel.fromJson(Map<String, dynamic> json) =>
      _$$_LocationModelFromJson(json);

  @override
  @JsonKey(name: 'address')
  final AddressModel? address;
  @override
  @JsonKey(name: 'direction')
  final String? direction;
  @override
  @JsonKey(name: 'isWeight')
  final int? isWeight;
  @override
  @JsonKey(name: 'lat')
  final int? lat;
  @override
  @JsonKey(name: 'long')
  final int? long;
  @override
  @JsonKey(name: 'name')
  final int? name;
  @override
  @JsonKey(name: 'type')
  final int? type;
  @override
  @JsonKey(name: 'wastes')
  final List<WasteModel>? wastes;

  @override
  String toString() {
    return 'LocationModel(address: $address, direction: $direction, isWeight: $isWeight, lat: $lat, long: $long, name: $name, type: $type, wastes: $wastes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationModel &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.isWeight, isWeight) ||
                other.isWeight == isWeight) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.wastes, wastes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, direction, isWeight,
      lat, long, name, type, const DeepCollectionEquality().hash(wastes));

  @JsonKey(ignore: true)
  @override
  _$LocationModelCopyWith<_LocationModel> get copyWith =>
      __$LocationModelCopyWithImpl<_LocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationModelToJson(this);
  }
}

abstract class _LocationModel implements LocationModel {
  const factory _LocationModel(
      {@JsonKey(name: 'address') AddressModel? address,
      @JsonKey(name: 'direction') String? direction,
      @JsonKey(name: 'isWeight') int? isWeight,
      @JsonKey(name: 'lat') int? lat,
      @JsonKey(name: 'long') int? long,
      @JsonKey(name: 'name') int? name,
      @JsonKey(name: 'type') int? type,
      @JsonKey(name: 'wastes') List<WasteModel>? wastes}) = _$_LocationModel;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$_LocationModel.fromJson;

  @override
  @JsonKey(name: 'address')
  AddressModel? get address;
  @override
  @JsonKey(name: 'direction')
  String? get direction;
  @override
  @JsonKey(name: 'isWeight')
  int? get isWeight;
  @override
  @JsonKey(name: 'lat')
  int? get lat;
  @override
  @JsonKey(name: 'long')
  int? get long;
  @override
  @JsonKey(name: 'name')
  int? get name;
  @override
  @JsonKey(name: 'type')
  int? get type;
  @override
  @JsonKey(name: 'wastes')
  List<WasteModel>? get wastes;
  @override
  @JsonKey(ignore: true)
  _$LocationModelCopyWith<_LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
