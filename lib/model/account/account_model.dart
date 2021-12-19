import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
class KitaroAccount with _$KitaroAccount {
  // ---------------------------- CONSTRUCTORS ----------------------------
  @JsonSerializable(checked: true)
  const factory KitaroAccount({
    @JsonKey(name: "username") String? username,
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "role") String? role,
  }) = _KitaroAccount;

  factory KitaroAccount.fromJson(Map<String, dynamic> json) =>
      _$KitaroAccountFromJson(json);
}
