// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KitaroProfile _$$_KitaroProfileFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_KitaroProfile',
      json,
      ($checkedConvert) {
        final val = _$_KitaroProfile(
          firstName: $checkedConvert('firstName', (v) => v as String?),
          lastName: $checkedConvert('lastName', (v) => v as String?),
          phoneNumber: $checkedConvert('phone', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          idNo: $checkedConvert('idNo', (v) => v as int?),
          address: $checkedConvert('address', (v) => v as String?),
          type: $checkedConvert('recycles',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
      fieldKeyMap: const {'phoneNumber': 'phone', 'type': 'recycles'},
    );

Map<String, dynamic> _$$_KitaroProfileToJson(_$_KitaroProfile instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phoneNumber,
      'email': instance.email,
      'idNo': instance.idNo,
      'address': instance.address,
      'recycles': instance.type,
    };
