import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cross_file/cross_file.dart';
import 'package:intl/intl.dart';

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

  String currentLocationId = '';
  LocationModel? location;
  String _username = '';
  String _dateSubmitted = '';

  // ITEM TYPE -----------------------------------------------------------------
  List<String> itemTypeList = [];
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
  List<RecycleModel> _itemsAdded = [];

  List<RecycleModel> get itemsAdded => _itemsAdded;

  set itemsAdded(List<RecycleModel> value) {
    _itemsAdded = value;
    notifyListeners();
  }

  Future<void> initialise() async {
    return LocationDao(id: currentLocationId).location.then((value) {
      location = value;
      itemTypeList.clear();
      for (var element in value.wastes!) {
        WasteDao(id: element).waste.then((value) {
          itemTypeList.add(value.name!);
          notifyListeners();
        });
        notifyListeners();
      }});
  }

  Future<void> initialiseEditItem(RecycleModel item) async {
    try {
      List<String> _test = [];
      item.images?.forEach((element) {
        _test.add(element);
      });
      _itemType = item.type;
      _itemWeight = item.weight.toString();
      _itemImages = _itemImages;
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

    _dateSubmitted = DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

    var _id = FirebaseAuth.instance.currentUser?.uid;

    await UserDao(id: _id).profile.then((value) {
      _username = value.username!;
    });

    List<String> _images = [];
    for (var element in _itemImages) {
      _images.add(element.path);
    }

    _itemsAdded.add(RecycleModel(
        type: _itemType!,
        weight: _itemWeight!,
        datetime: _dateSubmitted,
        images: _images,
        location: currentLocationId,
        username: _username,
    ));

    _itemType = null;
    _itemWeight = null;
    _itemImages = [];
    notifyListeners();
  }

  Future<void> updateItem(int index) async {
    List<String> _images = [];
    for (var element in _itemImages) {
      _images.add(element.path);
    }
    _itemsAdded[index] = RecycleModel(
      type: _itemType!,
      weight: _itemWeight!,
      datetime: _dateSubmitted,
      images: _images,
      location: currentLocationId,
      username: _username,
    );
    notifyListeners();
  }

  Future<ErrorMessage?> recycle() async{
    try{
      for (var element in _itemsAdded) {
        RecycleDao().add(element);
      }
    } on FirebaseAuthException catch (e) {
      return ErrorMessage(title: e.code, message: e.message!);
    } catch (e) {
      return ErrorMessage(title: e.toString(), message: '');
    } finally{
      _itemsAdded.clear();
      notifyListeners();
    }
  }
}
