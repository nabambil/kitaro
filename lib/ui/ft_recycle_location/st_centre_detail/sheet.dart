import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../kitaro.dart';

class CentreDetailsSheet extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const CentreDetailsSheet({
    required this.locationDetails,
    Key? key,
  }) : super(key: key);

  final LocationModel locationDetails;

  // ------------------------------- FIELDS -------------------------------

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      child: _Content(
        locationDetail: locationDetails,
      ),
    );
  }
}

class _Content extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Content({
    required this.locationDetail,
    Key? key,
  }) : super(key: key);

  final LocationModel locationDetail;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CentreInfo(
            locationDetail: locationDetail,
          ),
          const SizedBox(height: 25),
          const _OperationHoursInfo(),
        ],
      ),
    );
  }
}

class _CentreInfo extends StatelessWidget {
  const _CentreInfo({required this.locationDetail, Key? key}) : super(key: key);

  final LocationModel locationDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _CentreInfoTitle(
          locationDetail: locationDetail,
        ),
        const SizedBox(height: 15),
        _Text(text: locationDetail.name),
        _Text(text: locationDetail.name),
        _CentreWasteType(
          types: locationDetail.wastes!,
        ),
        const SizedBox(height: 15),
        _CentreAddress(address: locationDetail.address!),
      ],
    );
  }
}

class _CentreInfoTitle extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _CentreInfoTitle({
    required this.locationDetail,
    Key? key,
  }) : super(key: key);

  final LocationModel locationDetail;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DatabaseEvent>(
        stream:
            Api('$kFacilities/${locationDetail.type}').streamDataCollection(),
        builder: (context, snapshot) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Recycle Centre Info ',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xff4D627B),
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: snapshot.data?.snapshot.value.toString() ?? 'Kiosk',
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color(0xb347525E),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 1.0,
                    width: 30,
                    color: const Color(0xff4D627B),
                  )
                ],
              ),
              const Spacer(),
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
            ],
          );
        });
  }
}

class _CentreWasteType extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _CentreWasteType({
    required this.types,
    Key? key,
  }) : super(key: key);

  final List<String> types;

  @override
  State<_CentreWasteType> createState() => _CentreWasteTypeState(types: types);
}

class _CentreWasteTypeState extends State<_CentreWasteType> {
  // ---------------------------- CONSTRUCTORS ----------------------------
  _CentreWasteTypeState({required List<String> types}) {
    for (var element in types) {
      WasteDao(id: element).waste.then((value) {
        final _value = value.name;
        setState(() {
          _types.add(_value!);
        });
      });
    }
  }

  final List<String> _types = [];

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return _Text(text: 'Cycle Type : ' + _types.join(', '));
  }
}

class _CentreAddress extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _CentreAddress({
    required this.address,
    Key? key,
  }) : super(key: key);

  final String address;

  @override
  State<_CentreAddress> createState() => _CentreAddressState(address: address);
}

class _CentreAddressState extends State<_CentreAddress> {
  // ---------------------------- CONSTRUCTORS ----------------------------
  _CentreAddressState({required String address}) {
    AddressDao(id: address).address.then((value) {
      setState(() {
        _address1 = value.address1;
        _address2 = value.address2;
        _address3 = value.address3;
        _city = value.city;
        _postcode = value.postcode.toString();
        _state = value.state;
      });
    });
  }

  String? _address1;
  String? _address2;
  String? _address3;
  String? _city;
  String? _postcode;
  String? _state;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Text(text: _address1),
        _Text(text: _address2),
        _Text(text: _address3),
        _Text(text: _city),
        _Text(text: _postcode),
        _Text(text: _state),
      ],
    );
  }
}

class _OperationHoursInfo extends StatelessWidget {
  const _OperationHoursInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        _OperationHoursTitle(),
        SizedBox(height: 15),
        _Text(text: 'Monday - Friday : 10 am - 5 pm'),
        _Text(text: 'Monday - Friday : 10 am - 5 pm'),
        _Text(text: 'Sunday / Public Holiday : Closed'),
      ],
    );
  }
}

class _OperationHoursTitle extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _OperationHoursTitle({
    Key? key,
  }) : super(key: key);

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Operation Hours',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff4D627B),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8.0),
        Container(
          height: 1.0,
          width: 30,
          color: const Color(0xff4D627B),
        )
      ],
    );
  }
}

class _Text extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Text({
    required this.text,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String? text;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Text(
        text ?? '',
        style: const TextStyle(
          color: Color(0xff4D627B),
          fontSize: 14,
        ),
      ),
    );
  }
}
