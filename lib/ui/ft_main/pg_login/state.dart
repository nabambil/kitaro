
import 'package:flutter/cupertino.dart';

enum InvalidField {
  username,
  password,
}

class LoginPageState extends ChangeNotifier{

  // USER NAME -----------------------------------------------------------------
  // USER NAME //////////////////////////////////
  String? _userName;
  String? get userName => _userName;

  set userName(String? value) {
    _userName = value;
    validateUserName();
  }

  // USER NAME ERROR ////////////////////////////
  String? _userNameError;

  String? get userNameError => _userNameError;

  bool get userNameHasError {
    return _userNameError != null;
  }

  void validateUserName() {
    try {
      _userNameError = null;

      if (_userName == null) {
        _userNameError = 'username required';
      }
    } finally {
      notifyListeners();
    }
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
    try {
      _passwordError = null;

      if (_password == null || _password!.trim().isEmpty) {
        _passwordError = 'password required';
      }
    } finally {
      notifyListeners();
    }
  }

  // ------------------------------- METHODS ------------------------------
  InvalidField? validateAll() {
    // ALWAYS: Validate the fields that can be focused first!
    validateUserName();
    validatePassword();

    if (userNameHasError) {
      return InvalidField.username;
    }
    if (passwordHasError) {
      return InvalidField.password;
    }

    return null;
  }

}