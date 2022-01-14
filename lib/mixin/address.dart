import 'package:flutter/material.dart';

import '../kitaro.dart';

mixin AddressStateMixin on TextControllerMixin {
  // ADDRESS 1 -----------------------------------------------------------------
  // ADDRESS 1 //////////////////////////////////
  String? _address1;
  String? get address1 => _address1;

  set address1(String? value) {
    _address1 = value;
    validateAddress1();
  }

  // ADDRESS 1 ERROR ////////////////////////////
  String? _address1Error;

  String? get address1Error => _address1Error;

  bool get address1HasError {
    return _address1Error != null;
  }

  void validateAddress1() {
    validateText(() {
      try {
        _address1Error = null;

        if (_address1 == null || _address1!.trim().isEmpty) {
          _address1Error = 'address required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // ADDRESS 2 -----------------------------------------------------------------
  // ADDRESS 2 //////////////////////////////////
  String? _address2;
  String? get address2 => _address2;

  set address2(String? value) {
    _address2 = value;
    notifyListeners();
  }

  // ADDRESS 3 -----------------------------------------------------------------
  // ADDRESS 3 //////////////////////////////////
  String? _address3;
  String? get address3 => _address3;

  set address3(String? value) {
    _address3 = value;
    notifyListeners();
  }

  // CITY ------------------------------------------------------------------
  // CITY ///////////////////////////////////
  String? _city;

  String? get city => _city;

  set city(String? value) {
    _city = value;
    validateCity();
  }

  // CITY ERROR /////////////////////////////
  String? _cityError;

  String? get cityError => _cityError;

  bool get cityHasError {
    return _cityError != null;
  }

  @protected
  void validateCity() {
    validateText(() {
      try {
        _cityError = null;

        if (_city == null || _city!.trim().isEmpty) {
          _cityError = 'city required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // STATE ------------------------------------------------------------------
  // STATE ///////////////////////////////////
  String? _state;

  String? get state => _state;

  set state(String? value) {
    _state = value;
    validateState();
  }

  // STATE ERROR /////////////////////////////
  String? _stateError;

  String? get stateError => _stateError;

  bool get stateHasError {
    return _stateError != null;
  }

  @protected
  void validateState() {
    validateText(() {
      try {
        _stateError = null;

        if (_state == null || _state!.trim().isEmpty) {
          _stateError = 'state required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // POSTCODE ------------------------------------------------------------------
  // POSTCODE ///////////////////////////////////
  String? _postcode;

  String? get postcode => _postcode;

  set postcode(String? value) {
    _postcode = value;
    validatePostcode();
  }

  // POSTCODE ERROR /////////////////////////////
  String? _postcodeError;

  String? get postcodeError => _postcodeError;

  bool get postcodeHasError {
    return _postcodeError != null;
  }

  @protected
  void validatePostcode() {
    validateText(() {
      try {
        _postcodeError = null;

        if (_postcode == null || _postcode!.trim().isEmpty) {
          _postcodeError = 'postcode required';
        }
      } finally {
        notifyListeners();
      }
    });
  }
}