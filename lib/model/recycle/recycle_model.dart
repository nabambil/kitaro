import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitaro/model/location/location_model.dart';

part 'recycle_model.freezed.dart';
part 'recycle_model.g.dart';

@freezed
class RecycleModel with _$RecycleModel {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory RecycleModel({
    @JsonKey(name: 'datetime') String? datetime,
    @JsonKey(name: 'images') List<String>? images,
    @JsonKey(name: 'location') String? location,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'weight') String? weight,
  }) = _RecycleModel;

  factory RecycleModel.fromJson(Map<String, dynamic> json) =>
      _$RecycleModelFromJson(json);
}
