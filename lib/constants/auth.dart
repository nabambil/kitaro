import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:kitaro/constants/constants.dart';

import '../kitaro.dart';

class Authentication {
  static Future<FirebaseApp> initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    // TODO: Add auto login logic

    return firebaseApp;
  }

  static bool handleAuthState() {
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<bool> handleLocatorState() async{
    var user = FirebaseAuth.instance.currentUser;
    bool _isLocator = false;
    await UserDao(id: user?.uid).profile.then((value) {
      if(value.role == 'locator'){
        _isLocator = true;
      }
    });
    return _isLocator;
  }

  static Future<ErrorMessage?> register(
      {required String email, required String password}) async {
    User? user;
    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      return ErrorMessage(title: e.code, message: e.message!);
    } catch (e) {
      return ErrorMessage(title: e.toString(), message: '');
    }

    return null;
  }

  // static Future<ErrorMessage?> signInWithGoogle() async {
  //   User? user;
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  //   final GoogleSignInAccount? googleSignInAccount =
  //       await GoogleSignIn().signIn();
  //
  //   if (googleSignInAccount != null) {
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //
  //     try {
  //       final UserCredential userCredential =
  //           await auth.signInWithCredential(credential);
  //
  //       user = userCredential.user;
  //     } on FirebaseAuthException catch (e) {
  //       return ErrorMessage(title: e.code, message: e.message!);
  //     } catch (e) {
  //       return ErrorMessage(title: e.toString(), message: '');
  //     }
  //   }
  //
  //   return null;
  // }

  static Future<ErrorMessage?> signOutWithGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return ErrorMessage(title: e.toString(), message: '');
    }
  }

  static Future<ErrorMessage?> signInWithFacebook() async {
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

  // static Future<ErrorMessage?> signInWithFacebook() async {
  //   final fb = FacebookLogin();
  //   // Log in
  //   final res = await fb.logIn(permissions: [
  //     FacebookPermission.publicProfile,
  //     FacebookPermission.email,
  //   ]);
  //   // Check result status
  //   switch (res.status) {
  //     case FacebookLoginStatus.success:
  //       // The user is suceessfully logged in
  //       // Send access token to server for validation and auth
  //       final FacebookAccessToken accessToken = res.accessToken!;
  //       final AuthCredential authCredential =
  //           FacebookAuthProvider.credential(accessToken.token);
  //       final result =
  //           await FirebaseAuth.instance.signInWithCredential(authCredential);
  //       // Get profile data from facebook for use in the app
  //       final profile = await fb.getUserProfile();
  //       print('Hello, ${profile?.name}! You ID: ${profile?.userId}');
  //       // Get user profile image url
  //       final imageUrl = await fb.getProfileImageUrl(width: 100);
  //       print('Your profile image: $imageUrl');
  //       // fetch user email
  //       final email = await fb.getUserEmail();
  //       // But user can decline permission
  //       if (email != null) print('And your email is $email');
  //       break;
  //     case FacebookLoginStatus.cancel:
  //       // In case the user cancels the login process
  //       break;
  //     case FacebookLoginStatus.error:
  //       // Login procedure failed
  //       print('Error while log in: ${res.error}');
  //       break;
  //   }
  // }
}
