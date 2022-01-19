import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kitaro/kitaro.dart';

class RecycleLocationPageState extends ChangeNotifier {
  double? latitude;
  double? longitude;
  Map<String, LocationModel> locations = {};
  Uint8List? markerIcon;
  Uint8List? selectedMarkerIcon;

  Map<MarkerId, Marker> _mapMarkers = {};
  Map<MarkerId, Marker> get mapMarkers => _mapMarkers;
  set mapMarkers(Map<MarkerId, Marker> value) {
    _mapMarkers = value;
    notifyListeners();
  }

  String currentLocationId = '';

  String? onSelectMarker;

  Future<ErrorMessage?> initialise() async {
    markerIcon =
        await getBytesFromAsset(path: Assets.gifs.marker.path, width: 120);
    selectedMarkerIcon = await getBytesFromAsset(
      path: Assets.gifs.greenPng.path,
      width: 120,
      height: 200,
    );
    return await getLocation();
  }

  Future<Uint8List> getBytesFromAsset(
      {required String path, required int width, int? height}) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
      targetHeight: height ?? width,
    );
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  // Future<void> test({required String markerId, required LatLng position}) async {
  //   initialise();
  //   mapMarkers[MarkerId(markerId)] = Marker(
  //       markerId: MarkerId(markerId),
  //       position: position,
  //       onTap: () async => await test(markerId: markerId, position: position),
  //       icon: BitmapDescriptor.fromBytes(await getBytesFromAsset(size: 150))
  //   );
  //   notifyListeners();
  // }

  Future<ErrorMessage?> getLocation() async {
    try {
      LocationDao().location$.listen((event) {
        _mapMarkers.clear();
        locations = event;
        latitude = locations.entries.elementAt(0).value.lat;
        longitude = locations.entries.elementAt(0).value.long;
        notifyListeners();
        event.forEach((key, data) {
          _mapMarkers[MarkerId(key)] = Marker(
              markerId: MarkerId(key),
              position: LatLng(data.lat!, data.long!),
              onTap: () {
                onSelectMarker = key;
                notifyListeners();
              },
              icon: BitmapDescriptor.fromBytes(markerIcon!));
        });
      });
    } on FirebaseAuthException catch (e) {
      return ErrorMessage(title: e.code, message: e.message!);
    } catch (e) {
      return ErrorMessage(title: e.toString(), message: '');
    } finally {
      notifyListeners();
    }
    return null;
  }

  Future<ErrorMessage?> checkLocation({required String locationKey}) async {
    if (!locations.containsKey(locationKey)) {
      return ErrorMessage(
        title: 'Error',
        message: 'QR code not available',
      );
    }

    currentLocationId = locationKey;
    return null;
  }
}
