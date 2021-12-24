import 'package:cross_file/cross_file.dart';

class ItemDetails {
  ItemDetails({
    required this.itemType,
    required this.itemWeight,
    this.itemImages,
    this.dateSubmitted,
  });
  final String itemType;
  final String itemWeight;
  final String? dateSubmitted;
  final List<XFile>? itemImages;
}

class ProfileDetailsTest {
  ProfileDetailsTest({
    required this.firstName,
    required this.lastName,
    this.email,
    this.address1,
    this.address2,
    this.address3,
    this.city,
    this.state,
    this.postcode,
    this.password,
    this.passwordRecheck,
  });
  final String firstName;
  final String lastName;
  final String? email;
  final String? address1;
  final String? address2;
  final String? address3;
  final String? city;
  final String? state;
  final String? postcode;
  final String? password;
  final String? passwordRecheck;
}