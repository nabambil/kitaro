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
          fullName: $checkedConvert('fullName', (v) => v as String?),
          address: $checkedConvert('address', (v) => v as String?),
          address2: $checkedConvert('address2', (v) => v as String?),
          city: $checkedConvert('city', (v) => v as String?),
          state: $checkedConvert('state', (v) => v as String?),
          postcode: $checkedConvert('postcode', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
          phoneNumber: $checkedConvert('phone_number', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'phoneNumber': 'phone_number'},
    );

Map<String, dynamic> _$$_KitaroProfileToJson(_$_KitaroProfile instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'address': instance.address,
      'address2': instance.address2,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
      'country': instance.country,
      'phone_number': instance.phoneNumber,
    };
