import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class WasteDao {
  final Api _api;
  final String? id;

  WasteDao(this.id) : _api = Api("$kWaste/$id");

  Future<Map<String, WasteModel>> get profile async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<Map<String, WasteModel>> get profile$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, Map<String, WasteModel>> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  Map<String, WasteModel> _converter(Map value) {
    final _map = <String, WasteModel>{};

    value.forEach((key, data) {
      _map[key] = WasteModel.fromJson(Map<String, dynamic>.from(data));
    });

    return _map;
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add(WasteModel value) => _api.addDocument(value.toJson());

  Future<void> update(WasteModel value) => _api.updateDocument(value.toJson());
}
