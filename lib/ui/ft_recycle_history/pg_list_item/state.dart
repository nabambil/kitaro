import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../kitaro.dart';

class HistoryItemListPageState extends ChangeNotifier {
  // REPORT IMAGE --------------------------------------------------------
  // REPORT IMAGE ///////////////////////////
  List<RecycleModel> _itemsAdded = [];

  List<RecycleModel> get itemsAdded => _itemsAdded;

  set itemsAdded(List<RecycleModel> value) {
    _itemsAdded = value;
    notifyListeners();
  }

  // USER --------------------------------------------------------
  // USER ///////////////////////////
  KitaroAccount? _userProfile;

  KitaroAccount? get userProfile => _userProfile;

  // ADDRESS --------------------------------------------------------
  // ADDRESS ///////////////////////////
  AddressModel? _address;

  AddressModel? get address => _address;

  Future<ErrorMessage?> getUserProfile() async {
    try {
      final _uid = FirebaseAuth.instance.currentUser?.uid;
      _userProfile = await UserDao(id: _uid).profile;
      _address = await AddressDao(id: _userProfile?.address).address;
    } on FirebaseAuthException catch (e) {
      return ErrorMessage(title: e.code, message: e.message!);
    } catch (e) {
      return ErrorMessage(title: e.toString(), message: '');
    } finally {
      notifyListeners();
    }
  }

  Future<ErrorMessage?> initialise() async {
    try {
      var _recycles = await RecycleDao()
          .getRecycles(key: 'username', value: _userProfile!.username!);
      _recycles.forEach((key, value) {
        _itemsAdded.add(value);
        notifyListeners();
      });
      _itemsAdded.sort((a, b) {
        return int.parse(b.datetime.toString()).compareTo(int.parse(a.datetime.toString()));
      });
    } on FirebaseAuthException catch (e) {
      return ErrorMessage(title: e.code, message: e.message!);
    } catch (e) {
      return ErrorMessage(title: e.toString(), message: '');
    } finally {
      notifyListeners();
    }
    return null;
  }
}
