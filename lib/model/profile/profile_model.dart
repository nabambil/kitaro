import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kitaro/model/address/address_model.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class KitaroProfile with _$KitaroProfile {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  factory KitaroProfile({
    @JsonKey(name: 'firstName') String? firstName,
    @JsonKey(name: 'lastName') String? lastName,
    @JsonKey(name: 'phone') String? phoneNumber,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'idNo') int? idNo,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'recycles') List<String>? type,
  }) = _KitaroProfile;

  factory KitaroProfile.fromJson(Map<String, dynamic> json) =>
      _$KitaroProfileFromJson(json);
}
