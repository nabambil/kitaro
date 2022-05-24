import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const AddressModel._();
  @JsonSerializable(checked: true)
  const factory AddressModel({
    @JsonKey(name: 'address1') String? address1,
    @JsonKey(name: 'address2') String? address2,
    @JsonKey(name: 'address3') String? address3,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'state') String? state,
    @JsonKey(name: 'postcode') int? postcode,
    @JsonKey(name: 'mondayFridayHour') String? mondayFriday,
    @JsonKey(name: 'saturdayHour') String? saturday,
    @JsonKey(name: 'sundayHour') String? sunday,
    @JsonKey(name: 'publicHour') String? public,
    @JsonKey(name: 'opening') String? opening,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  String get todayOpening {
    DateTime date = DateTime.now();
    final int day = date.weekday;

    if (day > 0 && day < 6) {
      return mondayFriday ?? "7:00 AM - 7:00 PM";
    } else if (day == 6) {
      return saturday ?? "8:00 AM - 4:00 PM";
    } else if (day == 7) {
      return sunday ?? "7:00 AM - 7:00 PM";
    }

    return '';
  }

  String get openingAvailability {
    final Map<String, String> nameOpening = {
      "4551708c-cf23-4333-995a-9a279acb48c6": "Employees Only",
      "faeeb5ca-0b13-435b-8e4f-433970a1675a": "Open to Public",
    };

    final key = opening ?? "faeeb5ca-0b13-435b-8e4f-433970a1675a";
    final name = nameOpening[key];

    if (name == null) {
      return "Open to Public";
    } else {
      return name;
    }
  }
}
