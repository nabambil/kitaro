import 'dart:async';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../kitaro.dart';
import '../st_centre_detail/sheet.dart';
import 'state.dart';

late GoogleMapController _mapController;
final CarouselController _carouselController = CarouselController();

class RecycleLocationPage extends StatefulWidget {
  const RecycleLocationPage({Key? key}) : super(key: key);

  @override
  State<RecycleLocationPage> createState() => _RecycleLocationPageState();
}

class _RecycleLocationPageState extends State<RecycleLocationPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecycleLocationPageState>(
      create: (_) => RecycleLocationPageState(),
      child: const Scaffold(
          body: _Content(), bottomNavigationBar: _BottomNavigator()),
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
      final state =
          Provider.of<RecycleLocationPageState>(context, listen: false);
      final err1 = await showBusyIndicator<ErrorMessage?>(
        initialStatus: 'Loading...',
        action: state.initialise,
      );
      if (err1 != null) {
        return await showWarningDialog(context, err1);
      }
      state.addListener(() {
        var _locationList =
            state.locations.entries.map((e) => {e.key: e.value}).toList();
        enlargeMarker(
          context: context,
          markerId: MarkerId(state.locations.entries.first.key),
        );
        if (state.onSelectMarker != null) {
          var _index = _locationList.indexWhere((element) {
            return element.keys.first == state.onSelectMarker;
          });
          markerOnTap(
            context: context,
            markerId: MarkerId(state.onSelectMarker!),
            location: state.locations[state.onSelectMarker]!,
            index: _index,
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecycleLocationPageState>(builder: (_, state, __) {
      return Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: state.latitude == null ? Container() : _Maps(),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Consumer<RecycleLocationPageState>(
                  builder: (_, state, __) {
                    return CarouselSlider.builder(
                      carouselController: _carouselController,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        height: 140,
                        viewportFraction: 0.6,
                        aspectRatio: 16 / 9,
                        onPageChanged: (index, reason) async {
                          setState(() {
                            enlargeMarker(
                              context: context,
                              markerId: state.mapMarkers.keys.elementAt(index),
                            );
                          });
                        },
                      ),
                      itemCount: state.mapMarkers.length,
                      itemBuilder: (context, itemIndex, pageViewIndex) {
                        final _key = state.mapMarkers.keys.elementAt(itemIndex);
                        return _CentreTile(
                          index: itemIndex,
                          markerId: _key,
                          location: state.locations[_key.value]!,
                        );
                      },
                    );
                  },
                ),
                // const SizedBox(height: 28.0),
                // const _ProfileDetail(),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class _BottomNavigator extends StatefulWidget {
  const _BottomNavigator({Key? key}) : super(key: key);

  @override
  State<_BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<_BottomNavigator> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<RecycleLocationPageState>(builder: (_, state, __) {
      return BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black26,
        unselectedLabelStyle: const TextStyle(color: Colors.black26),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Recycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.globe),
            label: 'About',
          ),
        ],
      );
    });
  }

  void onTabTapped(int index) {
    setState(() async {
      _currentIndex = index;
      if (index == 1) {
        context.router.push(const HistoryItemListPageRoute());
        _currentIndex = 0;
      }
      if (index == 2) {
        final state =
            Provider.of<RecycleLocationPageState>(context, listen: false);
        var result = await BarcodeScanner.scan();
        _currentIndex = 0;
        if(result.type == ResultType.Cancelled || result.type == ResultType.Error){
          return;
        }
        final _err = await showBusyIndicator<ErrorMessage?>(
            initialStatus: 'Loading...',
            action: () async {
              await state.checkLocation(locationKey: result.rawContent);
            });
        if (_err != null) {
          await showWarningDialog(context, _err);
          return;
        }
        context.router
            .push(AddItemListPageRoute(locationId: state.currentLocationId));
      }
      if (index == 3) {
        context.router.push(const AboutPageRoute());
        _currentIndex = 0;
      }
    });
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
  RecycleLocationPageState? state;

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Consumer<RecycleLocationPageState>(
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
      },
    );
  }
}

class _ProfileDetail extends StatelessWidget {
  const _ProfileDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
            ),
            child: Row(
              children: [
                const _Profile(),
                const Spacer(),
                Image(
                  image: Assets.icons.favourite,
                  height: 25,
                ),
                const Icon(
                  Icons.search,
                  size: 25,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 5.0),
        const _AddRecycleItemButton()
      ],
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: const [
          _ProfileAvatar(),
          SizedBox(width: 20),
          _Username(),
        ],
      ),
      onTap: () => context.router.push(const HistoryItemListPageRoute()),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(33)),
          color: Color(0xffE5E9F2)),
      child: Center(
        child: Image(
          image: Assets.icons.temporary,
          height: 7,
          width: 16,
        ),
      ),
    );
  }
}

class _Username extends StatelessWidget {
  const _Username({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Username',
      style: TextStyle(
        color: Color(0xff47525E),
        fontSize: 14,
      ),
    );
  }
}

class _AddRecycleItemButton extends StatelessWidget {
  const _AddRecycleItemButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RecycleLocationPageState>(builder: (_, state, __) {
      return InkWell(
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(33)),
              color: Color(0xff77D353)),
          child: const Center(
            child: Icon(
              Icons.qr_code,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () => context.router
            .push(AddItemListPageRoute(locationId: state.currentLocationId)),
      );
    });
  }
}

class _CentreTile extends StatelessWidget {
  const _CentreTile({
    Key? key,
    required this.index,
    required this.markerId,
    required this.location,
  }) : super(key: key);

  final int index;
  final MarkerId markerId;
  final LocationModel location;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(15.0),
        // width: 400,
        // height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xFF16b04a),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),

              blurRadius: 7,
              offset: const Offset(4, 6), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _CentreName(
              name: location.name!,
            ),
            const _OperationHour(),
            Expanded(
              child: Container(),
            ),
            _CentreType(
              type: location.type!,
            ),
            // SizedBox(height: 8),
            // _Icons()
          ],
        ),
      ),
      onTap: () => _onTap(context),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    await enlargeMarker(context: context, markerId: markerId);
    _carouselController.animateToPage(index);
    await showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (context) => CentreDetailsSheet(
        locationDetails: location,
      ),
    );
  }
}

class _CentreName extends StatelessWidget {
  const _CentreName({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class _OperationHour extends StatelessWidget {
  const _OperationHour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '10 am - 5 pm',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}

class _CentreType extends StatelessWidget {
  const _CentreType({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
        stream: Api('$kFacilities/$type').streamDataCollection(),
        builder: (context, snapshot) {
          return Text(
            snapshot.data?.snapshot.value.toString() ?? 'Kiosk',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          );
        });
  }
}

class _Icons extends StatelessWidget {
  const _Icons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: Assets.icons.plasticBottle,
          height: 25,
          color: const Color(0xFF16b04a),
        ),
        Image(
          image: Assets.icons.paper,
          height: 25,
          color: const Color(0xFF16b04a),
        ),
        Image(
          image: Assets.icons.can,
          height: 25,
          color: const Color(0xFF16b04a),
        ),
        const SizedBox(width: 15),
        Image(
          image: Assets.icons.favourite,
          height: 25,
          color: const Color(0xFF16b04a),
        ),
      ],
    );
  }
}

Future<void> markerOnTap({
  required BuildContext context,
  required int index,
  required MarkerId markerId,
  required LocationModel location,
}) async {
  await enlargeMarker(context: context, markerId: markerId);
  // await enlargeMarker(context: context, markerId: markerId);

  _carouselController.animateToPage(index);

  await showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    builder: (context) => CentreDetailsSheet(
      locationDetails: location,
    ),
  );
}

Future<void> enlargeMarker(
    {required BuildContext context, required MarkerId markerId}) async {
  final state = Provider.of<RecycleLocationPageState>(context, listen: false);
  state.mapMarkers.forEach((key, value) async {
    if (markerId == value.markerId) {
      state.mapMarkers[value.markerId] = state.mapMarkers[value.markerId]!
          .copyWith(
              iconParam: BitmapDescriptor.fromBytes(state.selectedMarkerIcon!));
    } else {
      state.mapMarkers[value.markerId] = state.mapMarkers[value.markerId]!
          .copyWith(iconParam: BitmapDescriptor.fromBytes(state.markerIcon!));
    }
  });
  _mapController.animateCamera(
    CameraUpdate.newLatLngZoom(state.mapMarkers[markerId]!.position, 16.0),
  );
}
