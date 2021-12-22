import 'package:flutter/cupertino.dart';
import 'package:cross_file/cross_file.dart';

import '../../../kitaro.dart';

enum InvalidField {
  itemType,
  itemWeight,
  itemImage,
}

class AddItemListPageState extends ChangeNotifier {
  // ---------------------------- CONSTRUCTORS ----------------------------
  AddItemListPageState._();

  factory AddItemListPageState() {
    _instance ??= AddItemListPageState._();
    return _instance!;
  }
  // ------------------------------- FIELDS -------------------------------
  static AddItemListPageState? _instance = AddItemListPageState._();

  // ITEM TYPE -----------------------------------------------------------------
  List<String> itemTypeList = [
    "Paper",
    "Bottle",
    "Can",
  ];
  // ITEM TYPE //////////////////////////////////
  String? _itemType;
  String? get itemType => _itemType;

  set itemType(String? value) {
    _itemType = value;
    validateItemType();
  }

  // ITEM TYPE ERROR ////////////////////////////
  String? _itemTypeError;

  String? get itemTypeError => _itemTypeError;

  bool get itemTypeHasError {
    return _itemTypeError != null;
  }

  void validateItemType() {
    try {
      _itemTypeError = null;

      if (_itemType == null) {
        _itemTypeError = 'item type required';
      }
    } finally {
      notifyListeners();
    }
  }

  // ITEM TYPE -----------------------------------------------------------------

  // ITEM TYPE //////////////////////////////////
  String? _itemWeight;
  String? get itemWeight => _itemWeight;

  set itemWeight(String? value) {
    _itemWeight = value;
    validateItemWeight();
  }

  // ITEM TYPE ERROR ////////////////////////////
  String? _itemWeightError;

  String? get itemWeightError => _itemWeightError;

  bool get itemWeightHasError {
    return _itemWeightError != null;
  }

  void validateItemWeight() {
    _updateTextController = false;
    try {
      _itemWeightError = null;

      if (_itemWeight == null) {
        _itemWeightError = 'item weight required';
      }
    } finally {
      notifyListeners();
    }
  }

  // UPDATE TEXT CONTROLLER /////////////////////
  bool _updateTextController = false;

  bool get updateTextController => _updateTextController;

  // REPORT IMAGE --------------------------------------------------------
  // REPORT IMAGE ///////////////////////////
  List<XFile> _itemImages = [];

  List<XFile> get itemImages => _itemImages;

  set itemImages(List<XFile> value) {
    _itemImages = value;
    notifyListeners();
  }

  // ignore: avoid_setters_without_getters
  set itemImage(XFile? value) {
    _itemImages.add(value!);
    validateItemImage();
  }

  // ITEM TYPE ERROR ////////////////////////////
  String? _itemImageError;

  String? get itemImageError => _itemImageError;

  bool get itemImageHasError {
    return _itemImageError != null;
  }

  void validateItemImage() {
    try {
      _itemImageError = null;

      if (_itemImages.isEmpty) {
        _itemImageError = 'item image required';
      }
    } finally {
      notifyListeners();
    }
  }

  // REPORT IMAGE --------------------------------------------------------
  // REPORT IMAGE ///////////////////////////
  List<ItemDetails> _itemsAdded = [];

  List<ItemDetails> get itemsAdded => _itemsAdded;

  set itemsAdded(List<ItemDetails> value) {
    _itemsAdded = value;
    notifyListeners();
  }

  Future<void> initialiseEditItem(ItemDetails item) async {
    try {
      _itemType = item.itemType;
      _itemWeight = item.itemWeight;
      _itemImages = item.itemImages!;
    } finally {
      _updateTextController = true;
      notifyListeners();
    }
  }

  InvalidField? validateAll() {
    // ALWAYS: Validate the fields that can be focused first!
    validateItemType();
    // validateItemWeight();
    validateItemImage();

    if (itemTypeHasError) {
      return InvalidField.itemType;
    }
    if (itemWeightHasError) {
      return InvalidField.itemWeight;
    }
    if (itemImageHasError) {
      return InvalidField.itemImage;
    }

    return null;
  }

  void removeItemImage(int? index) {
    _itemImages.removeAt(index!);
    notifyListeners();
  }

  Future<void> addItem() async {
    _itemsAdded.add(ItemDetails(
        itemType: _itemType!,
        itemWeight: _itemWeight!,
        itemImages: _itemImages));
    _itemType = null;
    _itemWeight = null;
    _itemImages = [];
    notifyListeners();
  }

  Future<void> updateItem(int index) async {
    _itemsAdded[index] = ItemDetails(
        itemType: _itemType!,
        itemWeight: _itemWeight!,
        itemImages: _itemImages
    );
    notifyListeners();
  }

  void test() {
    var decode = {
      'fullName': 'Syaza',
      'address': 'No37, jalan Cempaka 31',
      'address2': 'Taman Cempaka',
      'city': 'Ampang',
      'state': 'Selangor',
      'postcode': '68000',
      'country': 'Malaysia',
      'phone_number': '0179893071',
    };
    // var encode = KitaroProfile(
    //   fullName: 'Syaza',
    //   address: 'No37, jalan Cempaka 31',
    //   address2: 'Taman Cempaka',
    //   city: 'Ampang',
    //   state: 'Selangor',
    //   country: 'Malaysia',
    //   postcode: '68000',
    //   phoneNumber: '0179893071',
    // );
    // print(KitaroProfile.fromJson(decode).fullName);
    // print(encode.toJson());
  }
}
