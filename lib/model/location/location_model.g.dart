// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LocationModel _$$_LocationModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_LocationModel',
      json,
      ($checkedConvert) {
        final val = _$_LocationModel(
          address: $checkedConvert(
              'address',
              (v) => v == null
                  ? null
                  : AddressModel.fromJson(v as Map<String, dynamic>)),
          direction: $checkedConvert('direction', (v) => v as String?),
          isWeight: $checkedConvert('isWeight', (v) => v as int?),
          lat: $checkedConvert('lat', (v) => v as int?),
          long: $checkedConvert('long', (v) => v as int?),
          name: $checkedConvert('name', (v) => v as int?),
          type: $checkedConvert('type', (v) => v as int?),
          wastes: $checkedConvert(
              'wastes',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => WasteModel.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$$_LocationModelToJson(_$_LocationModel instance) =>
    <String, dynamic>{
      'address': instance.address,
      'direction': instance.direction,
      'isWeight': instance.isWeight,
      'lat': instance.lat,
      'long': instance.long,
      'name': instance.name,
      'type': instance.type,
      'wastes': instance.wastes,
    };
