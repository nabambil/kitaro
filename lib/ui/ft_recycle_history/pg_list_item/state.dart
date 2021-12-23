import 'package:flutter/material.dart';
import 'package:kitaro/database/profile_dao.dart';

import '../../../kitaro.dart';

class HistoryItemListPageState extends ChangeNotifier {
  // REPORT IMAGE --------------------------------------------------------
  // REPORT IMAGE ///////////////////////////
  List<ItemDetails> _itemsAdded = [
    ItemDetails(
      itemType: 'PAPER',
      itemWeight: '0.70',
      dateSubmitted: '10 jan 2021',
    ),
    ItemDetails(
      itemType: 'CAN',
      itemWeight: '0.90',
      dateSubmitted: '10 jan 2021',
    ),
  ];

  List<ItemDetails> get itemsAdded => _itemsAdded;

  set itemsAdded(List<ItemDetails> value) {
    _itemsAdded = value;
    notifyListeners();
  }

  Future<KitaroProfile> get profile {
    return ProfileDao("nabil").profile.catchError((err) => print(err));
  }
}
