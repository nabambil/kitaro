import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class KitaroProfile with _$KitaroProfile {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  factory KitaroProfile({
    @JsonKey(name: 'fullName') String? fullName,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'address2') String? address2,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'postcode') String? postcode,
    @JsonKey(name: 'country') String? country,
    @JsonKey(name: 'phone_number') String? phoneNumber,
  }) = _KitaroProfile;

  factory KitaroProfile.fromJson(Map<String, dynamic> json) =>
    _$KitaroProfileFromJson(json);
}
