import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class WasteDao {
  final Api _api;
  final String? id;

  WasteDao(this.id) : _api = Api("$kWaste/$id");

  Future<WasteModel> get profile async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<WasteModel> get profile$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, WasteModel> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  WasteModel _converter(Map value) {
    return WasteModel.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add(WasteModel value) => _api.addDocument(value.toJson());

  Future<void> update(WasteModel value) => _api.updateDocument(value.toJson());
}
