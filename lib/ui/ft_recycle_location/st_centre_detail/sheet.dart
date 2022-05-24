import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../kitaro.dart';

class CentreDetailsSheet extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const CentreDetailsSheet({
    required this.locationDetails,
    Key? key,
  }) : super(key: key);

  // ------------------------------- FIELDS -------------------------------
  final LocationModel locationDetails;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
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
          _OperationHoursInfo(
            locationDetail: locationDetail,
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: _NavigateButton(
              locationDetails: locationDetail,
            ),
          ),
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
        _Text(text: locationDetail.name, color: kThemeColor),
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
          return const Text(
            'Recycle Centre Info ',
            style: TextStyle(
              fontSize: 15,
              color: kThemeColor,
              fontWeight: FontWeight.w600,
            ),
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
          if (_value != null) {
            _types.add(_value);
          }
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
        _address1 = value.address1 == null || value.address1!.trim().isEmpty
            ? null
            : value.address1;
        _address2 = value.address2 == null || value.address2!.trim().isEmpty
            ? null
            : value.address2;
        _address3 = value.address3 == null || value.address3!.trim().isEmpty
            ? null
            : value.address3;
        _city = value.city == null || value.city!.trim().isEmpty
            ? null
            : value.city;
        _postcode = value.postcode == null ? null : value.postcode.toString();
        _state = value.state == null || value.state!.trim().isEmpty
            ? null
            : value.state;
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
        Visibility(visible: _address1 != null, child: _Text(text: _address1)),
        Visibility(
          visible: _address2 != null,
          child: _Text(text: _address2),
        ),
        Visibility(visible: _address3 != null, child: _Text(text: _address3)),
        Row(
          children: [
            Visibility(
              visible: _city != null,
              child: _Text(text: _city),
            ),
            Visibility(
              visible: _postcode != null,
              child: _Text(text: _postcode.toString(), smallGap: true),
            ),
            Visibility(
              visible: _state != null,
              child: _Text(text: _state, smallGap: true),
            ),
          ],
        )
      ],
    );
  }
}

class _OperationHoursInfo extends StatefulWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _OperationHoursInfo({
    required this.locationDetail,
    Key? key,
  }) : super(key: key);

  final LocationModel locationDetail;

  @override
  State<_OperationHoursInfo> createState() =>
      // ignore: no_logic_in_create_state
      _OperationHoursInfoState(locationDetail.address);
}

class _OperationHoursInfoState extends State<_OperationHoursInfo> {
  AddressModel? addressDetail;

  _OperationHoursInfoState(String? address) {
    AddressDao(id: address)
        .address
        .then((value) => setState(() => addressDetail = value));
  }

  @override
  Widget build(BuildContext context) {
    if (addressDetail == null) {
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _OperationHoursTitle(),
        const SizedBox(height: 15),
        // recycle center
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                addressDetail!.openingAvailability,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            _Text(
              text:
                  'Monday - Friday : ${addressDetail!.mondayFriday ?? "7 am - 7 pm"}',
            ),
            _Text(
              text:
                  'Saturday :  ${addressDetail!.mondayFriday ?? "8 am - 4 pm"}',
            ),
            _Text(
              text: 'Sunday :  ${addressDetail!.mondayFriday ?? "7 am - 7 pm"}',
            ),
            _Text(
              text:
                  'Public Holiday :  ${addressDetail!.mondayFriday ?? "8 am - 4 pm"}',
            ),
          ],
        ),
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
    return const Text(
      'Operation Hours',
      style: TextStyle(
        fontSize: 15,
        color: kThemeColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Text extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _Text({
    required this.text,
    this.color = const Color(0xff4D627B),
    this.smallGap = false,
    Key? key,
  }) : super(key: key);

  // ---------------------------------- FIELDS ---------------------------------
  final String? text;
  final Color? color;
  final bool smallGap;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: smallGap ? 4.0 : 16.0),
      child: Text(
        text ?? '',
        style: TextStyle(color: color, fontSize: 14, height: 1.5),
      ),
    );
  }
}

class _NavigateButton extends StatelessWidget {
  // ---------------------------- CONSTRUCTORS ----------------------------
  const _NavigateButton({
    required this.locationDetails,
    Key? key,
  }) : super(key: key);

  // ------------------------------- FIELDS -------------------------------
  final LocationModel locationDetails;

  // ------------------------------- METHODS ------------------------------
  @override
  Widget build(BuildContext context) {
    return SubmitButton(
      caption: 'Navigate',
      onPressed: () async {
        if (!await launch(locationDetails.direction!)) {
          throw 'Could not launch ${locationDetails.direction}';
        }
      },
    );
  }
}
