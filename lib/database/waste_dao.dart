import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class WasteDao {
  final Api _api;
  final String? id;

  WasteDao({this.id}) : _api = id == null ? Api(kWaste) : Api("$kWaste/$id");

  Future<WasteModel> get waste async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<WasteModel> get waste$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, WasteModel> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  WasteModel _converter(Map value) {
    final _map = <String, WasteModel>{};

    // value.forEach((key, data) {
    //   _map[key] = WasteModel.fromJson(Map<String, dynamic>.from(data));
    // });

    return WasteModel.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add(WasteModel value) => _api.addDocument(value.toJson());

  Future<void> update(WasteModel value) => _api.updateDocument(value.toJson());
}
