// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recycle_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecycleModel _$RecycleModelFromJson(Map<String, dynamic> json) {
  return _RecycleModel.fromJson(json);
}

/// @nodoc
class _$RecycleModelTearOff {
  const _$RecycleModelTearOff();

  _RecycleModel call(
      {@JsonKey(name: 'datetime') String? datetime,
      @JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'location') LocationModel? location,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'weight') int? weight}) {
    return _RecycleModel(
      datetime: datetime,
      images: images,
      location: location,
      type: type,
      username: username,
      weight: weight,
    );
  }

  RecycleModel fromJson(Map<String, Object?> json) {
    return RecycleModel.fromJson(json);
  }
}

/// @nodoc
const $RecycleModel = _$RecycleModelTearOff();

/// @nodoc
mixin _$RecycleModel {
  @JsonKey(name: 'datetime')
  String? get datetime => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<String>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'location')
  LocationModel? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  int? get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecycleModelCopyWith<RecycleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecycleModelCopyWith<$Res> {
  factory $RecycleModelCopyWith(
          RecycleModel value, $Res Function(RecycleModel) then) =
      _$RecycleModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'datetime') String? datetime,
      @JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'location') LocationModel? location,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'weight') int? weight});

  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$RecycleModelCopyWithImpl<$Res> implements $RecycleModelCopyWith<$Res> {
  _$RecycleModelCopyWithImpl(this._value, this._then);

  final RecycleModel _value;
  // ignore: unused_field
  final $Res Function(RecycleModel) _then;

  @override
  $Res call({
    Object? datetime = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? type = freezed,
    Object? username = freezed,
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $LocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value));
    });
  }
}

/// @nodoc
abstract class _$RecycleModelCopyWith<$Res>
    implements $RecycleModelCopyWith<$Res> {
  factory _$RecycleModelCopyWith(
          _RecycleModel value, $Res Function(_RecycleModel) then) =
      __$RecycleModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'datetime') String? datetime,
      @JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'location') LocationModel? location,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'weight') int? weight});

  @override
  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$RecycleModelCopyWithImpl<$Res> extends _$RecycleModelCopyWithImpl<$Res>
    implements _$RecycleModelCopyWith<$Res> {
  __$RecycleModelCopyWithImpl(
      _RecycleModel _value, $Res Function(_RecycleModel) _then)
      : super(_value, (v) => _then(v as _RecycleModel));

  @override
  _RecycleModel get _value => super._value as _RecycleModel;

  @override
  $Res call({
    Object? datetime = freezed,
    Object? images = freezed,
    Object? location = freezed,
    Object? type = freezed,
    Object? username = freezed,
    Object? weight = freezed,
  }) {
    return _then(_RecycleModel(
      datetime: datetime == freezed
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as String?,
      images: images == freezed
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: weight == freezed
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_RecycleModel implements _RecycleModel {
  const _$_RecycleModel(
      {@JsonKey(name: 'datetime') this.datetime,
      @JsonKey(name: 'images') this.images,
      @JsonKey(name: 'location') this.location,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'weight') this.weight});

  factory _$_RecycleModel.fromJson(Map<String, dynamic> json) =>
      _$$_RecycleModelFromJson(json);

  @override
  @JsonKey(name: 'datetime')
  final String? datetime;
  @override
  @JsonKey(name: 'images')
  final List<String>? images;
  @override
  @JsonKey(name: 'location')
  final LocationModel? location;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'weight')
  final int? weight;

  @override
  String toString() {
    return 'RecycleModel(datetime: $datetime, images: $images, location: $location, type: $type, username: $username, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RecycleModel &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            const DeepCollectionEquality().equals(other.images, images) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      datetime,
      const DeepCollectionEquality().hash(images),
      location,
      type,
      username,
      weight);

  @JsonKey(ignore: true)
  @override
  _$RecycleModelCopyWith<_RecycleModel> get copyWith =>
      __$RecycleModelCopyWithImpl<_RecycleModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecycleModelToJson(this);
  }
}

abstract class _RecycleModel implements RecycleModel {
  const factory _RecycleModel(
      {@JsonKey(name: 'datetime') String? datetime,
      @JsonKey(name: 'images') List<String>? images,
      @JsonKey(name: 'location') LocationModel? location,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'weight') int? weight}) = _$_RecycleModel;

  factory _RecycleModel.fromJson(Map<String, dynamic> json) =
      _$_RecycleModel.fromJson;

  @override
  @JsonKey(name: 'datetime')
  String? get datetime;
  @override
  @JsonKey(name: 'images')
  List<String>? get images;
  @override
  @JsonKey(name: 'location')
  LocationModel? get location;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'weight')
  int? get weight;
  @override
  @JsonKey(ignore: true)
  _$RecycleModelCopyWith<_RecycleModel> get copyWith =>
      throw _privateConstructorUsedError;
}
