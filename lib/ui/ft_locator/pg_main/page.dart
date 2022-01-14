import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kitaro/kitaro.dart';
import 'package:provider/provider.dart';

import 'state.dart';

late GoogleMapController _mapController;

class LocatorMapPage extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const LocatorMapPage({
    Key? key,
  }) : super(key: key);

  // ------------------------------- FIELDS -------------------------------


  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocatorMapPageState>(
      create: (_) => LocatorMapPageState(),
      child: Scaffold(
        body: const _Content(),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: const Icon(Icons.add),
          backgroundColor: Colors.green,
          onPressed: () {
            context.router.push(const AddLocationPageRoute());
          },
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({Key? key}) : super(key: key);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  // --------------------------------- METHODS ---------------------------------
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) async {
      final state = Provider.of<LocatorMapPageState>(context, listen: false);
      await state.getCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocatorMapPageState>(
      builder: (_, state, __) {
        return SafeArea(
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: state.latitude == null ? Container() : _Maps(),
              ),
              Positioned(
                top: 0,
                child: PopupMenuButton(
                  icon: const Icon(Icons.menu, color: Colors.black, size: 40,),
                  offset: const Offset(0, 45),
                  shape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  onSelected: (int u) => onSelected(u, context),
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 1,
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            color: Color(0xff8594A8),
                            fontSize: 15,
                          ),
                        ),
                      )
                    ];
                  },
                ),
              )
            ],
          ),
        );
      }
    );
  }
  Future<void> onSelected(int index, BuildContext context) async {
    if (index == 1) {
      final err = await Authentication.signOutWithGoogle();
      if (err != null) {
        await showWarningDialog(context, err);
        return;
      }
      await context.router.replaceAll([const LoginPageRoute()]);
    }
  }
}

class _Maps extends StatefulWidget {
  // ------------------------------- FIELDS -------------------------------
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<_Maps> {
  // ------------------------------- FIELDS -------------------------------
  Completer<GoogleMapController> controllerCompleter = Completer();

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<LocatorMapPageState>(
      builder: (_, state, __) {
        return GoogleMap(
          markers: Set.of(state.mapMarkers.values),
          initialCameraPosition: CameraPosition(
            target: LatLng(state.latitude!, state.longitude!),
            zoom: 12,
          ),
          myLocationEnabled: true,
          onMapCreated: (controller) async {
            _mapController = controller;
          },
          // onMapCreated: controllerCompleter.complete,
        );
      }
    );
  }
}