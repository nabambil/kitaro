import 'dart:convert';

import 'package:kitaro/model/profile/profile_model.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileDao {
  final DatabaseReference _profileRef =
      FirebaseDatabase.instance.ref().child('profile');

  Future<KitaroProfile> get profile async {
    return _profileRef
        .orderByChild('username')
        .equalTo("nabil")
        .limitToFirst(1)
        .get()
        .then((value) {
      // ignore: avoid_print
      print(value);

      final String result = value.value as String;
      return KitaroProfile.fromJson(jsonDecode(result));
    }).catchError((err) {
      // ignore: avoid_print
      print(err);
    });
  }
}
