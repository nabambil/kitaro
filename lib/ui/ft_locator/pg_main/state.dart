import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocatorMapPageState extends ChangeNotifier {
  double? _latitude;

  double? get latitude => _latitude;
  set latitude(double? value) {
    _latitude = value;
    notifyListeners();
  }

  double? _longitude;

  double? get longitude => _longitude;
  set longitude(double? value) {
    _longitude = value;
    notifyListeners();
  }

  Map<MarkerId, Marker> _mapMarkers = {};
  Map<MarkerId, Marker> get mapMarkers => _mapMarkers;
  set mapMarkers(Map<MarkerId, Marker> value) {
    _mapMarkers = value;
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    _latitude = _locationData.latitude;
    _longitude = _locationData.longitude;
    _mapMarkers[const MarkerId('1')] = Marker(
      markerId: const MarkerId('1'),
      position: LatLng(_latitude!, _longitude!),
    );
    notifyListeners();
  }
}
