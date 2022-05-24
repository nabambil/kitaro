import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
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

  bool _isLocator = false;

  bool get isLocator => _isLocator;
  set isLocator(bool value) {
    _isLocator = value;
  }

  bool _isAdmin = false;

  bool get isAdmin => _isAdmin;
  set isAdmin(bool value) {
    _isAdmin = value;
  }

  bool _isSuper = false;

  bool get isSuper => _isSuper;
  set isSuper(bool value) {
    _isSuper = value;
  }

  UserCredential? userCredential;

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
        userCredential = await auth.signInWithCredential(credential);

        user = userCredential!.user;
        await _checkFirstTimeUser(userCredential!);
        if (_isFirstTime) {
          return null;
        }

        if (user != null) {
          final KitaroAccount _userProfile =
              await UserDao(id: user.uid).profile;
          if (_userProfile.firstName == null) {
            _isFirstTime = true;
            return null;
          }
        }

        final _token = await FirebaseAuth.instance.currentUser?.getIdToken();
        if (user != null) {
          return _updateToken(_token, user.uid);
        }

        _isFirstTime = true;
        return null;
      } on FirebaseAuthException catch (e) {
        return ErrorMessage(title: e.code, message: e.message!);
      } catch (e) {
        return ErrorMessage(title: e.toString(), message: '');
      }
    }

    return ErrorMessage(title: 'Failed', message: 'Sign in failed');
  }

  Future<ErrorMessage?> signInWithFacebook() async {
    try {
      final fb = FacebookLogin();
      FirebaseAuth auth = FirebaseAuth.instance;
      User? user;

      final res = await fb.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);

      switch (res.status) {
        case FacebookLoginStatus.success:
          // Logged in

          // Send access token to server for validation and auth
          final FacebookAccessToken? accessToken = res.accessToken;
          print('Access token: ${accessToken?.token}');

          // Get profile data
          final profile = await fb.getUserProfile();
          print('Hello, ${profile?.name}! You ID: ${profile?.userId}');

          // Get user profile image url
          final imageUrl = await fb.getProfileImageUrl(width: 100);
          print('Your profile image: $imageUrl');

          // Get email (since we request email permission)
          final email = await fb.getUserEmail();
          // But user can decline permission
          if (email != null) print('And your email is $email');

          break;
        case FacebookLoginStatus.cancel:
          return ErrorMessage(title: 'Failed', message: ' Sign in failed');
        case FacebookLoginStatus.error:
          return ErrorMessage(
              title: 'Error', message: 'Error while log in: ${res.error}');
      }

      final AuthCredential credential = FacebookAuthProvider.credential(
        res.accessToken!.token,
      );

      try {
        userCredential = await auth.signInWithCredential(credential);

        user = userCredential!.user;
        await _checkFirstTimeUser(userCredential!);
        if (_isFirstTime) {
          return null;
        }

        if (user != null) {
          final KitaroAccount _userProfile =
              await UserDao(id: user.uid).profile;
          if (_userProfile.firstName == null) {
            _isFirstTime = true;
            return null;
          }
        }

        final _token = await FirebaseAuth.instance.currentUser?.getIdToken();
        if (user != null) {
          return _updateToken(_token, user.uid);
        }

        _isFirstTime = true;
        return null;
      } on FirebaseAuthException catch (e) {
        return ErrorMessage(title: e.code, message: e.message!);
      } catch (e) {
        return ErrorMessage(title: e.toString(), message: '');
      }
    } on FirebaseAuthException catch (e) {
      return ErrorMessage(title: e.toString(), message: '');
    }
  }

  Future<void>? _checkFirstTimeUser(UserCredential userCredential) {
    if (userCredential.additionalUserInfo!.isNewUser) {
      _isFirstTime = true;
    } else {
      _isFirstTime = false;
    }
    notifyListeners();
  }

  Future<ErrorMessage?> _updateToken(String? token, String? id) {
    return UserDao(id: id).profile.then((value) {
      if (value.role == 'locator') {
        isLocator = true;
        notifyListeners();
      }
      if (value.role == 'admin') {
        isAdmin = true;
        notifyListeners();
      }
      if (value.role == 'super') {
        isSuper = true;
        notifyListeners();
      }
      final _profile = value.copyWith(token: token);
      return _profile;
    }).then((value) {
      final _network = UserDao(id: id);
      _network.update(value);

      return;
    });
  }

  Future<ErrorMessage?> forgotPassword() async {
    try {
      validateUserName();
      if (userNameHasError) {
        return ErrorMessage(
          title: 'Email required',
          message: "Field Username Field",
        );
      }
      var _instance = FirebaseAuth.instance;
      await _instance.sendPasswordResetEmail(email: _userName!);
      return null;
    } catch (e) {
      return ErrorMessage(title: 'Error', message: 'email not found');
    }
  }
}
