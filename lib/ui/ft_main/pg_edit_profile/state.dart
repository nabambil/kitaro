import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kitaro/kitaro.dart';

enum InvalidField {
  firstName,
  lastName,
  idNumber,
  phoneNumber,
  email,
  address1,
  city,
  state,
  postcode,
  password,
  recheckPassword,
}

class EditProfilePageState extends ChangeNotifier
    with TextControllerMixin, AddressStateMixin {
  EditProfilePageState({required this.user, required this.userAddress});

  final KitaroAccount user;
  final AddressModel userAddress;

  bool _isBusy = false;

  bool get isBusy => _isBusy;

  // FIRST NAME -----------------------------------------------------------------
  // FIRST NAME //////////////////////////////////
  String? _firstName;
  String? get firstName => _firstName;

  set firstName(String? value) {
    _firstName = value;
    validateFirstName();
  }

  // FIRST NAME ERROR ////////////////////////////
  String? _firstNameError;

  String? get firstNameError => _firstNameError;

  bool get firstNameHasError {
    return _firstNameError != null;
  }

  void validateFirstName() {
    validateText(() {
      try {
        _firstNameError = null;

        if (_firstName == null || _firstName!.trim().isEmpty) {
          _firstNameError = 'first name required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // LAST NAME -----------------------------------------------------------------
  // LAST NAME //////////////////////////////////
  String? _lastName;
  String? get lastName => _lastName;

  set lastName(String? value) {
    _lastName = value;
    validateLastName();
  }

  // LAST NAME ERROR ////////////////////////////
  String? _lastNameError;

  String? get lastNameError => _lastNameError;

  bool get lastNameHasError {
    return _lastNameError != null;
  }

  void validateLastName() {
    validateText(() {
      try {
        _lastNameError = null;

        if (_lastName == null || _lastName!.trim().isEmpty) {
          _lastNameError = 'last name required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // ID NUMBER -----------------------------------------------------------------
  // ID NUMBER //////////////////////////////////
  String? _idNumber;
  String? get idNumber => _idNumber;

  set idNumber(String? value) {
    _idNumber = value;
    validateIdNumber();
  }

  // ID NUMBER ERROR ////////////////////////////
  String? _idNumberError;

  String? get idNumberError => _idNumberError;

  bool get idNumberHasError {
    return _idNumberError != null;
  }

  void validateIdNumber() {
    validateText(() {
      try {
        _idNumberError = null;

        if (_idNumber == null || _idNumber!.trim().isEmpty) {
          _idNumberError = 'id number required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // PHONE NUMBER -----------------------------------------------------------------
  // PHONE NUMBER //////////////////////////////////
  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;

  set phoneNumber(String? value) {
    _phoneNumber = value;
    validatePhoneNumber();
  }

  // PHONE NUMBER ERROR ////////////////////////////
  String? _phoneNumberError;

  String? get phoneNumberError => _phoneNumberError;

  bool get phoneNumberHasError {
    return _phoneNumberError != null;
  }

  void validatePhoneNumber() {
    validateText(() {
      try {
        _phoneNumberError = null;

        if (_phoneNumber == null || _phoneNumber!.trim().isEmpty) {
          _phoneNumberError = 'phone number required';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // EMAIL -----------------------------------------------------------------
  // EMAIL //////////////////////////////////
  String? _email;
  String? get email => _email;

  set email(String? value) {
    _email = value;
    validateEmail();
  }

  // EMAIL ERROR ////////////////////////////
  String? _emailError;

  String? get emailError => _emailError;

  bool get emailHasError {
    return _emailError != null;
  }

  void validateEmail() {
    validateText(() {
      try {
        _emailError = null;

        if (_email == null || _email!.trim().isEmpty) {
          _emailError = 'email required';
        } else if (!EmailValidator.validate(_email!)) {
          _emailError = 'email invalid';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // PASSWORD ------------------------------------------------------------------
  // PASSWORD ///////////////////////////////////
  String? _password;

  String? get password => _password;

  set password(String? value) {
    _password = value;
    validatePassword();
  }

  // PASSWORD ERROR /////////////////////////////
  String? _passwordError;

  String? get passwordError => _passwordError;

  bool get passwordHasError {
    return _passwordError != null;
  }

  @protected
  void validatePassword() {
    validateText(() {
      try {
        _passwordError = null;

        if (_password == null || _password!.trim().isEmpty) {
          _passwordError = 'password required';
        } else if (_password!.length < 8) {
          _passwordError = 'password minimum 8 characters';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // RE-TYPE PASSWORD ------------------------------------------------------------------
  // RE-TYPE PASSWORD ///////////////////////////////////
  String? _passwordRecheck;

  String? get passwordRecheck => _passwordRecheck;

  set passwordRecheck(String? value) {
    _passwordRecheck = value;
    validatePasswordRecheck();
  }

  // PASSWORD ERROR /////////////////////////////
  String? _passwordRecheckError;

  String? get passwordRecheckError => _passwordRecheckError;

  bool get passwordRecheckHasError {
    return _passwordRecheckError != null;
  }

  @protected
  void validatePasswordRecheck() {
    validateText(() {
      try {
        _passwordRecheckError = null;

        if (_passwordRecheck == null || _passwordRecheck!.trim().isEmpty) {
          _passwordRecheckError = 'password required';
        } else if (_passwordRecheck! != _password) {
          _passwordRecheckError = 'password invalid';
        }
      } finally {
        notifyListeners();
      }
    });
  }

  // ------------------------------- METHODS ------------------------------
  Future<void> initialiseEditItem() async {
    try {
      updateText(() {
        _firstName = user.firstName;
        _lastName = user.lastName;
        _idNumber = user.idNo;
        _phoneNumber = user.phone;
        _email = user.username;
        address1 = userAddress.address1;
        address2 = userAddress.address2;
        address3 = userAddress.address3;
        city = userAddress.city;
        state = userAddress.state;
        postcode = userAddress.postcode.toString();
      });
    } finally {
      notifyListeners();
    }
  }

  InvalidField? validateAll() {
    // ALWAYS: Validate the fields that can be focused first!
    validateFirstName();
    validateLastName();
    validateIdNumber();
    validatePhoneNumber();
    validateEmail();
    validateAddress1();
    validateCity();
    validateState();
    validatePostcode();
    // validatePassword();
    // validatePasswordRecheck();

    if (firstNameHasError) {
      return InvalidField.firstName;
    }
    if (lastNameHasError) {
      return InvalidField.lastName;
    }
    if (idNumberHasError) {
      return InvalidField.idNumber;
    }
    if (phoneNumberHasError) {
      return InvalidField.phoneNumber;
    }
    if (emailHasError) {
      return InvalidField.email;
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
    // if (passwordHasError) {
    //   return InvalidField.password;
    // }
    // if (passwordRecheckHasError) {
    //   return InvalidField.recheckPassword;
    // }

    return null;
  }

  Future<ErrorMessage?> register() async {
    try {
      _isBusy = true;
      notifyListeners();

      final _uid = FirebaseAuth.instance.currentUser?.uid;
      await AddressDao(id: user.address).update(AddressModel(
        address1: address1,
        address2: address2,
        address3: address3,
        city: city,
        state: state,
        postcode: int.parse(postcode!),
      ));
      await UserDao(id: _uid).update(KitaroAccount(
        username: _email,
        token: user.token,
        role: user.role,
        firstName: _firstName,
        lastName: _lastName,
        phone: _phoneNumber,
        address: user.address,
        idNo: _idNumber,
      ));
      return null;
    } on FirebaseAuthException catch (e) {
      return ErrorMessage(
        title: e.code,
        message: e.message ?? '',
      );
    } finally {
      _isBusy = false;
      notifyListeners();
    }
  }
}
