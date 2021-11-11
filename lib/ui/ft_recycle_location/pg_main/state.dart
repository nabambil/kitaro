import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kitaro/constants/assets.gen.dart';
import 'package:kitaro/kitaro.dart';

class RecycleLocationPageState extends ChangeNotifier {
  double? latitude = 3.1718;
  double? longitude = 101.7577;
  // Map<MarkerId, Marker> mapMarkers = {};
  int _markerId = 0;
  Uint8List? markerIcon;
  Map<MarkerId, LatLng> positions = {
    MarkerId('1'): LatLng(3.1718, 101.7577),
    MarkerId('2'): LatLng(3.1771, 101.7511),
    MarkerId('3'): LatLng(3.1491, 101.7625),
    MarkerId('4'): LatLng(3.1466, 101.6958),
  };

  Future<void> initialise() async {
    markerIcon =
        await getBytesFromAsset(path: Assets.gifs.marker.path, width: 120);
    // mapMarkers.clear();
    //
    // mapMarkers[MarkerId('1')] = Marker(
    //   markerId: MarkerId('1'),
    //   position: LatLng(3.1718, 101.7577),
    //     onTap: () async => await test(markerId: '1', position: LatLng(3.1718, 101.7577)),
    //     icon: BitmapDescriptor.fromBytes(markerIcon!)
    // );
    // mapMarkers[MarkerId('2')] = Marker(
    //   markerId: MarkerId('2'),
    //   position: LatLng(3.1771, 101.7511),
    //     icon: BitmapDescriptor.fromBytes(markerIcon!),
    //   onTap: () async => await test(markerId: '2', position: LatLng(3.1771, 101.7511)),
    // );
    // mapMarkers[MarkerId('3')] = Marker(
    //   markerId: MarkerId('3'),
    //   position: LatLng(3.1491, 101.7625),
    //     icon: BitmapDescriptor.fromBytes(markerIcon!)
    // );
    // mapMarkers[MarkerId('4')] = Marker(
    //   markerId: MarkerId('4'),
    //   position: LatLng(3.1466, 101.6958),
    //     icon: BitmapDescriptor.fromBytes(markerIcon!)
    // );
    // for (var i = 0; i < 4; i++) {
    //   _markerId = _markerId + 1;
    //   mapMarkers[MarkerId(_markerId.toString())] = Marker(
    //     markerId: MarkerId(_markerId.toString()),
    //     position: LatLng(latitude!, longitude!),
    //     // icon: customGeoFenceEnterMarkerIcon!,
    //   );
    // }
    notifyListeners();
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
}

