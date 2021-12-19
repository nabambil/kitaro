// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KitaroAccount _$$_KitaroAccountFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_KitaroAccount',
      json,
      ($checkedConvert) {
        final val = _$_KitaroAccount(
          username: $checkedConvert('username', (v) => v as String?),
          token: $checkedConvert('token', (v) => v as String?),
          role: $checkedConvert('role', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_KitaroAccountToJson(_$_KitaroAccount instance) =>
    <String, dynamic>{
      'username': instance.username,
      'token': instance.token,
      'role': instance.role,
    };
