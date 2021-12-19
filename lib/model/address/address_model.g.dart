// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AddressModel _$$_AddressModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_AddressModel',
      json,
      ($checkedConvert) {
        final val = _$_AddressModel(
          address1: $checkedConvert('address1', (v) => v as String?),
          address2: $checkedConvert('address2', (v) => v as String?),
          address3: $checkedConvert('address3', (v) => v as String?),
          city: $checkedConvert('city', (v) => v as String?),
          state: $checkedConvert('state', (v) => v as String?),
          postcode: $checkedConvert('postcode', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_AddressModelToJson(_$_AddressModel instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'address3': instance.address3,
      'city': instance.city,
      'state': instance.state,
      'postcode': instance.postcode,
    };
