// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KitaroAccount _$KitaroAccountFromJson(Map<String, dynamic> json) {
  return _KitaroAccount.fromJson(json);
}

/// @nodoc
class _$KitaroAccountTearOff {
  const _$KitaroAccountTearOff();

  _KitaroAccount call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role}) {
    return _KitaroAccount(
      username: username,
      token: token,
      role: role,
    );
  }

  KitaroAccount fromJson(Map<String, Object?> json) {
    return KitaroAccount.fromJson(json);
  }
}

/// @nodoc
const $KitaroAccount = _$KitaroAccountTearOff();

/// @nodoc
mixin _$KitaroAccount {
  @JsonKey(name: "username")
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "token")
  String? get token => throw _privateConstructorUsedError;
  @JsonKey(name: "role")
  String? get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KitaroAccountCopyWith<KitaroAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KitaroAccountCopyWith<$Res> {
  factory $KitaroAccountCopyWith(
          KitaroAccount value, $Res Function(KitaroAccount) then) =
      _$KitaroAccountCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role});
}

/// @nodoc
class _$KitaroAccountCopyWithImpl<$Res>
    implements $KitaroAccountCopyWith<$Res> {
  _$KitaroAccountCopyWithImpl(this._value, this._then);

  final KitaroAccount _value;
  // ignore: unused_field
  final $Res Function(KitaroAccount) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? token = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$KitaroAccountCopyWith<$Res>
    implements $KitaroAccountCopyWith<$Res> {
  factory _$KitaroAccountCopyWith(
          _KitaroAccount value, $Res Function(_KitaroAccount) then) =
      __$KitaroAccountCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role});
}

/// @nodoc
class __$KitaroAccountCopyWithImpl<$Res>
    extends _$KitaroAccountCopyWithImpl<$Res>
    implements _$KitaroAccountCopyWith<$Res> {
  __$KitaroAccountCopyWithImpl(
      _KitaroAccount _value, $Res Function(_KitaroAccount) _then)
      : super(_value, (v) => _then(v as _KitaroAccount));

  @override
  _KitaroAccount get _value => super._value as _KitaroAccount;

  @override
  $Res call({
    Object? username = freezed,
    Object? token = freezed,
    Object? role = freezed,
  }) {
    return _then(_KitaroAccount(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(checked: true)
class _$_KitaroAccount implements _KitaroAccount {
  const _$_KitaroAccount(
      {@JsonKey(name: "username") this.username,
      @JsonKey(name: "token") this.token,
      @JsonKey(name: "role") this.role});

  factory _$_KitaroAccount.fromJson(Map<String, dynamic> json) =>
      _$$_KitaroAccountFromJson(json);

  @override
  @JsonKey(name: "username")
  final String? username;
  @override
  @JsonKey(name: "token")
  final String? token;
  @override
  @JsonKey(name: "role")
  final String? role;

  @override
  String toString() {
    return 'KitaroAccount(username: $username, token: $token, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KitaroAccount &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, token, role);

  @JsonKey(ignore: true)
  @override
  _$KitaroAccountCopyWith<_KitaroAccount> get copyWith =>
      __$KitaroAccountCopyWithImpl<_KitaroAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KitaroAccountToJson(this);
  }
}

abstract class _KitaroAccount implements KitaroAccount {
  const factory _KitaroAccount(
      {@JsonKey(name: "username") String? username,
      @JsonKey(name: "token") String? token,
      @JsonKey(name: "role") String? role}) = _$_KitaroAccount;

  factory _KitaroAccount.fromJson(Map<String, dynamic> json) =
      _$_KitaroAccount.fromJson;

  @override
  @JsonKey(name: "username")
  String? get username;
  @override
  @JsonKey(name: "token")
  String? get token;
  @override
  @JsonKey(name: "role")
  String? get role;
  @override
  @JsonKey(ignore: true)
  _$KitaroAccountCopyWith<_KitaroAccount> get copyWith =>
      throw _privateConstructorUsedError;
}
