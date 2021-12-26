import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kitaro/kitaro.dart';

enum InvalidField {
  username,
  password,
}

class LoginPageState extends ChangeNotifier {
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  bool _isFirstTime = false;

  bool get isFirstTime => _isFirstTime;
  set isFirstTime(bool value) {
    _isFirstTime = value;
  }

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
      } else if (!EmailValidator.validate(_userName!)) {
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
      } else if (_password!.length < 8) {
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

      final _acc = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _userName!, password: _password!);

      final _token = await FirebaseAuth.instance.currentUser?.getIdToken();

      return _updateToken(_token, _acc.user?.uid);
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

  Future<ErrorMessage?> signInWithGoogle() async {
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;

    final GoogleSignInAccount? googleSignInAccount =
        await GoogleSignIn().signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
        await _checkFirstTimeUser(userCredential);

        final _token = await FirebaseAuth.instance.currentUser?.getIdToken();

        return _updateToken(_token, user?.uid);
      } on FirebaseAuthException catch (e) {
        return ErrorMessage(title: e.code, message: e.message!);
      } catch (e) {
        return ErrorMessage(title: e.toString(), message: '');
      }
    }

    return null;
  }

  Future<ErrorMessage?> signInWithFacebook() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    // try {
    //   final LoginResult result = await FacebookAuth.instance.login();
    //   switch (result.status) {
    //     case LoginStatus.success:
    //       final AuthCredential facebookCredential =
    //       FacebookAuthProvider.credential(result.accessToken!.token);
    //       final userCredential =
    //       await _auth.signInWithCredential(facebookCredential);
    //       return null;
    //     case LoginStatus.cancelled:
    //       return ErrorMessage(title: 'Cancelled', message: 'Login Cancelled');
    //     case LoginStatus.failed:
    //       return ErrorMessage(title: 'Failed', message: result.message!);
    //     default:
    //       return null;
    //   }
    // } on FirebaseAuthException catch (e) {
    //   throw e;
    // }
  }

  Future<void>? _checkFirstTimeUser(UserCredential userCredential) {
    if (userCredential.additionalUserInfo!.isNewUser) {
      print('firstTimer');
    } else {
      print('not-firstTimer');
    }
  }

  Future<ErrorMessage?> _updateToken(String? token, String? id) {
    return UserDao().profile.then((value) {
      final _profile = value.copyWith(token: token);
      return _profile;
    }).then((value) {
      final _network = UserDao(id: id);
      _network.update(value);

      return;
    });
  }
}
