export 'assets.gen.dart';
export 'auth.dart';
export 'error_message.dart';
export 'fonts.gen.dart';

import 'package:flutter/material.dart';

// ----------------------------- PROPERTIES -----------------------------
String get errorTitleUnknown => 'Unknown Error';
String get errorMessageUnknown =>
    'This may be due to bad data connection or device error.';
String get errorTitleWarning => 'Warning!';
String get errorTitleNotFound => 'No Items Found.';
String get errorTitleInvalidForm => 'Mandatory Fields Not Completed';
String get errorMessageInvalidForm =>
    'All mandatory fields need to be completed before proceeding.';
String get isFirstRun => 'isfirstRun';

const kDefaultPadding = EdgeInsets.zero;
final kDefaultErrorTextColor = Colors.red.shade700;
const kDefaultLabelTextDarkColor = Color(0xffdddddd);
const kDefaultBorderDarkColor = Color(0xffdddddd);
const kDefaultFocusedBorderDarkColor = Color(0xffffffff);
const kDefaultTextDarkColor = Color(0xffffffff);
const kDefaultLabelTextLightColor = Color(0xff888888);
const kDefaultBorderLightColor = Color(0xff666666);
const kDefaultFocusedBorderLightColor = Color(0xff000000);
const kDefaultTextLightColor = Color(0xff666666);
const kDefaultSearchPageThreshold = 10;
const kDefaultEmptyFlagColor = Color(0xffffffff);
const kThemeColor = Color(0xFF16b04a);
const kThemeColorDarker = Color(0xFF16883c);
const kWhiteColor = Colors.white;
const kImageExtensions = ['jpg', 'jpeg', 'png'];

const String kProfile = "profile";
const String kRecycle = "recycle";
const String kLocation = "locations";
const String kFacilities = "facilities";
const String kAddresses = "addresses";
const String kUser = "users";
const String kWaste = "wastes";
