import 'package:flutter/cupertino.dart';
import 'package:kitaro/kitaro.dart';
import 'package:location/location.dart';

enum InvalidField {
  locationName,
  address1,
  city,
  state,
  postcode,
  addressLink,
}

class AddLocationPageState extends ChangeNotifier
    with TextControllerMixin, AddressStateMixin {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  bool _isWeight = true;

  bool get isWeight => _isWeight;
  set isWeight(bool value){
    _isWeight = value;
    notifyListeners();
  }

  double? _latitude;
  double? _longitude;

  // LOCATION NAME -----------------------------------------------------------------
  // LOCATION NAME //////////////////////////////////
  String? _locationName;
  String? get locationName => _locationName;

  set locationName(String? value) {
    _locationName = value;
    validateLocationName();
  }

  // LOCATION NAME ERROR ////////////////////////////
  String? _locationNameError;

  String? get locationNameError => _locationNameError;

  bool get locationNameHasError {
    return _locationNameError != null;
  }

  void validateLocationName() {
    validateText(() {
      try {
        _locationNameError = null;

        if (_locationName == null || _locationName!.trim().isEmpty) {
          _locationNameError = 'location name required';
        }
      } finally {
        notifyListeners();
      }
    });
  }


  // ITEM TYPE -----------------------------------------------------------------
  final itemTypeList = <String, WasteModel>{};
  // List<WasteModel> _itemTypeModelList = [];

  String? item;
  // ITEM TYPE //////////////////////////////////
  final _selectedItemTypes = <String, WasteModel>{};
  Map<String, WasteModel> get selectedItemTypes => _selectedItemTypes;

  // ITEM TYPE ERROR ////////////////////////////
  String? _itemTypeError;

  String? get itemTypeError => _itemTypeError;

  bool get itemTypeHasError {
    return _itemTypeError != null;
  }

  void validateItemType() {
    try {
      _itemTypeError = null;

      if (_selectedItemTypes.isEmpty) {
        _itemTypeError = 'item type required';
      }
    } finally {
      notifyListeners();
    }
  }

  // FACILITY //////////////////////////////////
  final facilities = <String, String>{};
  String? _facility;
  String? get facility => _facility;

  set facility(String? value) {
    _facility = value;
    validateFacility();
  }

  // FACILITY ERROR ////////////////////////////
  String? _facilityError;

  String? get facilityError => _facilityError;

  bool get facilityHasError {
    return _facilityError != null;
  }

  void validateFacility() {
    try {
      _facilityError = null;

      if (_facility == null || _facility!.trim().isEmpty) {
        _facilityError = 'facility required';
      }
    } finally {
      notifyListeners();
    }
  }

  // ADDRESS DIRECTION -----------------------------------------------------------------
  // ADDRESS DIRECTION //////////////////////////////////
  String? _addressLink;
  String? get addressLink => _addressLink;

  set addressLink(String? value) {
    _addressLink = value;
    validateAddressLink();
  }

  // ADDRESS DIRECTION ERROR ////////////////////////////
  String? _addressLinkError;

  String? get addressLinkError => _addressLinkError;

  bool get addressLinkHasError {
    return _addressLinkError != null;
  }

  void validateAddressLink() {
    validateText(() {
      try {
        _addressLinkError = null;

        if (_addressLink == null || _addressLink!.trim().isEmpty) {
          _addressLinkError = 'address direction required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // ------------------------------- METHODS ------------------------------
  Future<void> initialise() async {
    final _res = await WasteDao().wastes.then((value) {
      value.forEach((key, value) {
        itemTypeList[key] = value;
      });
      notifyListeners();
    });

    final _res2 = await Api(kFacilities).getDataCollection().then((value) {
      var _value = value.snapshot.value as Map;

      _value.forEach((key, data) {
        facilities[key] = data;
      });
    });
    return _res2;
  }

  void addType({required WasteModel item}){
    itemTypeList.forEach((key, value) {
      if(value == item){
        _selectedItemTypes[key] = value;
      }
    });
    validateItemType();
  }

  void removeType({required WasteModel item}){
    selectedItemTypes.removeWhere((key, value) => value == item);
    validateItemType();
  }

  InvalidField? validateAll() {
    // ALWAYS: Validate the fields that can be focused first!
    validateLocationName();
    validateAddress1();
    validateCity();
    validateState();
    validatePostcode();
    validateItemType();
    validateFacility();
    validateAddressLink();

    if (locationNameHasError) {
      return InvalidField.locationName;
    }
    if (address1HasError) {
      return InvalidField.address1;
    }
    if (cityHasError) {
      return InvalidField.city;
    }
    if (stateHasError) {
      return InvalidField.state;
    }
    if (postcodeHasError) {
      return InvalidField.postcode;
    }
    if (addressLinkHasError) {
      return InvalidField.addressLink;
    }

    return null;
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
    notifyListeners();
  }

  Future<ErrorMessage?> submit() async {
    final _address = AddressModel(
      address1: address1,
      address2: address2,
      address3: address3,
      city: city,
      state: state,
      postcode: int.parse(postcode!),
    );

    final List<String> _waste = [];
    _selectedItemTypes.forEach((key, value) {
      _waste.add(key);
    });

    String? _facilityKey;
    facilities.forEach((key, value) {
      if(_facility == value){
        _facilityKey = key;
      }
    });

    final _addressId = await AddressDao().add(_address);
    await LocationDao().add(
      LocationModel(
        address: _addressId,
        direction: _addressLink,
        isWeight: !_isWeight ? 0 : 1,
        lat: _latitude,
        long: _longitude,
        name: _locationName,
        type: _facilityKey,
        wastes: _waste
      )
    );
  }
}
