import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitaro/model/address/address_model.dart';
import 'package:kitaro/model/waste/waste_model.dart';

part 'location_model.freezed.dart';
part 'location_model.g.dart';

@freezed
class LocationModel with _$LocationModel {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory LocationModel({
    @JsonKey(name: 'address') AddressModel? address,
    @JsonKey(name: 'direction') String? direction,
    @JsonKey(name: 'isWeight') int? isWeight,
    @JsonKey(name: 'lat') int? lat,
    @JsonKey(name: 'long') int? long,
    @JsonKey(name: 'name') int? name,
    @JsonKey(name: 'type') int? type,
    @JsonKey(name: 'wastes') List<WasteModel>? wastes,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}
