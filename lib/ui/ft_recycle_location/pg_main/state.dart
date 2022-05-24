import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

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
    final LocationPermission geolocator = await Geolocator.requestPermission();
    if (geolocator == LocationPermission.always ||
        geolocator == LocationPermission.whileInUse) {
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return await getLocation(location.latitude, location.longitude);
    } else {
      return ErrorMessage(
          title: "No permission",
          message:
              "Please enable location, to find best nearest location to your current location.");
    }
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

  Future<ErrorMessage?> getLocation(double lat, double long) async {
    try {
      LocationDao().location$.listen((event) {
        _mapMarkers.clear();
        locations = event;
        latitude = locations.entries.elementAt(0).value.lat;
        longitude = locations.entries.elementAt(0).value.long;
        notifyListeners();

        final sortedLocation = event.keys.toList()
          ..sort((a, b) {
            final aData = event[a];
            final bData = event[b];
            if (aData != null && bData != null) {
              final double? alat = aData.lat;
              final double? alng = aData.long;
              final double? blat = bData.lat;
              final double? blng = bData.long;

              final aDistande = calculateDistance(alat, alng, lat, long);
              final bDistance = calculateDistance(blat, blng, lat, long);

              return aDistande.compareTo(bDistance);
            }
            return 1;
          });
        for (String key in sortedLocation) {
          final data = event[key];
          if (data != null) {
            _mapMarkers[MarkerId(key)] = Marker(
              markerId: MarkerId(key),
              position: LatLng(data.lat!, data.long!),
              onTap: () {
                onSelectMarker = key;
                notifyListeners();
              },
              icon: BitmapDescriptor.fromBytes(markerIcon!),
            );
          }
        }
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

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
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
