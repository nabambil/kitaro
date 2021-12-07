import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:kitaro/kitaro.dart';

enum InvalidField {
  username,
  password,
}

class LoginPageState extends ChangeNotifier {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

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

      if (_userName == null || _userName!.trim().isEmpty) {
        _userNameError = 'username required';
      }
      else if (!EmailValidator.validate(_userName!)) {
        _userNameError = 'username invalid';
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
      else if (_password!.length < 8) {
        _passwordError = 'password minimum 8 characters';
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

  Future<ErrorMessage?> logIn() async {
    try {
      _isBusy = true;
      notifyListeners();

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _userName!, password: _password!);
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
