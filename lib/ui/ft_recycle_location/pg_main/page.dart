import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../../kitaro.dart';
import '../st_centre_detail/sheet.dart';
import 'state.dart';

late GoogleMapController _mapController;
Map<MarkerId, Marker> mapMarkers = {};
final CarouselController _carouselController = CarouselController();

class RecycleLocationPage extends StatefulWidget {
  const RecycleLocationPage({Key? key}) : super(key: key);

  @override
  State<RecycleLocationPage> createState() => _RecycleLocationPageState();
}

class _RecycleLocationPageState extends State<RecycleLocationPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RecycleLocationPageState>(
      create: (_) => RecycleLocationPageState(),
      child: Scaffold(
        body: const _Content(),
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black26,
          unselectedLabelStyle: const TextStyle(color: Colors.black26),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(
                'Profile',
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              title: Text(
                'Profile',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 2) {
        context.router.push(const HistoryItemListPageRoute());
        _currentIndex = 0;
      }
      if (index == 3) {
        context.router.push(const AddItemListPageRoute());
        _currentIndex = 0;
      }
    });
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
      // final result = await state.initialise();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: _Maps(),
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
                      viewportFraction: 0.4,
                      aspectRatio: 0,
                      onPageChanged: (index, reason) async {
                        setState(() async {
                          await enlargeMarker(
                            context: context,
                            markerId: state.positions.keys.elementAt(index),
                          );
                          await enlargeMarker(
                            context: context,
                            markerId: state.positions.keys.elementAt(index),
                          );
                        });
                      },
                    ),
                    itemCount: state.positions.length,
                    itemBuilder: (context, itemIndex, pageViewIndex) {
                      return _CentreTile(
                          markerId: state.positions.keys.elementAt(itemIndex));
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
          markers: Set.of(mapMarkers.values),
          initialCameraPosition: CameraPosition(
            target: LatLng(state.latitude!, state.longitude!),
            zoom: 12,
          ),
          myLocationEnabled: true,
          onMapCreated: (controller) async {
            final state =
                Provider.of<RecycleLocationPageState>(context, listen: false);
            await state.initialise();
            _mapController = controller;
            mapMarkers = mapBitmapsToMarkers();
          },
          // onMapCreated: controllerCompleter.complete,
        );
      },
    );
  }

  Map<MarkerId, Marker> mapBitmapsToMarkers() {
    final state = Provider.of<RecycleLocationPageState>(context, listen: false);
    int _markerId = 0;
    BitmapDescriptor _markerIcon = state.markerIcon == null
        ? BitmapDescriptor.defaultMarker
        : BitmapDescriptor.fromBytes(state.markerIcon!);
    Map<MarkerId, Marker> markersList = {};
    markersList.clear();

    markersList[MarkerId('1')] = Marker(
        markerId: MarkerId('1'),
        position: state.positions[MarkerId('1')]!,
        onTap: () async => await markerOnTap(
              context: context,
              markerId: MarkerId('1'),
            ),
        icon: _markerIcon);
    markersList[MarkerId('2')] = Marker(
        markerId: MarkerId('2'),
        position: state.positions[MarkerId('2')]!,
        onTap: () async => await markerOnTap(
              context: context,
              markerId: MarkerId('2'),
            ),
        icon: _markerIcon);
    markersList[MarkerId('3')] = Marker(
        markerId: MarkerId('3'),
        position: state.positions[MarkerId('3')]!,
        onTap: () async => await markerOnTap(
              context: context,
              markerId: MarkerId('3'),
            ),
        icon: _markerIcon);
    markersList[MarkerId('4')] = Marker(
        markerId: MarkerId('4'),
        position: state.positions[MarkerId('4')]!,
        onTap: () async => await markerOnTap(
              context: context,
              markerId: MarkerId('4'),
            ),
        icon: _markerIcon);
    // for (var i = 0; i < 4; i++) {
    //   _markerId = _markerId + 1;
    //   markersList[MarkerId(_markerId.toString())] = Marker(
    //     markerId: MarkerId(_markerId.toString()),
    //     position: state.positions[MarkerId(_markerId.toString())]!,
    //     onTap: () async => await test(
    //       markerId: MarkerId(_markerId.toString()),
    //     ),
    //     icon: _markerIcon,
    //   );
    // }
    return markersList;
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
      onTap: () => context.router.push(const AddItemListPageRoute()),
    );
  }
}

class _CentreTile extends StatelessWidget {
  const _CentreTile({Key? key, required this.markerId}) : super(key: key);

  final MarkerId markerId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),

                  blurRadius: 7,
                  offset: const Offset(4, 6), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _CentreName(),
                _OperationHour(),
                SizedBox(height: 15),
                _CentreType(),
                SizedBox(height: 10),
                _Icons()
              ],
            ),
          ),
        ],
      ),
      onTap: () => _onTap(context),
    );
  }

  Future<void> _onTap(BuildContext context) async {
    await enlargeMarker(context: context, markerId: markerId);
    await enlargeMarker(context: context, markerId: markerId);
    _carouselController.animateToPage(int.parse(markerId.value) - 1);
    await showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      builder: (context) => const CentreDetailsSheet(),
    );
  }
}

class _CentreName extends StatelessWidget {
  const _CentreName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Centre Name ',
      style: TextStyle(
        color: Color(0xff47525E),
        fontSize: 14,
      ),
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
        color: Color(0xff47525E),
        fontSize: 14,
      ),
    );
  }
}

class _CentreType extends StatelessWidget {
  const _CentreType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Kiosk',
      style: TextStyle(
        color: Color(0xb347525E),
        fontSize: 14,
      ),
    );
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
        ),
        Image(
          image: Assets.icons.paper,
          height: 25,
        ),
        Image(
          image: Assets.icons.can,
          height: 25,
        ),
        SizedBox(width: 15),
        Image(
          image: Assets.icons.favourite,
          height: 25,
        ),
      ],
    );
  }
}

Future<void> markerOnTap(
    {required BuildContext context, required MarkerId markerId}) async {
  final state = Provider.of<RecycleLocationPageState>(context, listen: false);
  await state.initialise();

  await enlargeMarker(context: context, markerId: markerId);
  await enlargeMarker(context: context, markerId: markerId);

  _carouselController.animateToPage(int.parse(markerId.value) - 1);

  await showModalBottomSheet(
    isScrollControlled: true,
    enableDrag: true,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
    ),
    builder: (context) => const CentreDetailsSheet(),
  );
}

Future<void> enlargeMarker(
    {required BuildContext context, required MarkerId markerId}) async {
  final state = Provider.of<RecycleLocationPageState>(context, listen: false);
  await state.initialise();

  mapMarkers.forEach((key, value) async {
    if (markerId == value.markerId) {
      mapMarkers[value.markerId] = mapMarkers[value.markerId]!.copyWith(
          iconParam: BitmapDescriptor.fromBytes(await state.getBytesFromAsset(
              path: Assets.gifs.greenPng.path, width: 120, height: 200)));
    } else {
      mapMarkers[value.markerId] = mapMarkers[value.markerId]!
          .copyWith(iconParam: BitmapDescriptor.fromBytes(state.markerIcon!));
    }
  });
  _mapController.animateCamera(
    CameraUpdate.newLatLngZoom(state.positions[markerId]!, 16.0),
  );
}
