import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class ProfileDao {
  final Api _api;

  ProfileDao(String? id) : _api = Api("$kProfile/$id");

  Future<KitaroProfile> get profile async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<KitaroProfile> get profile$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, KitaroProfile> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  KitaroProfile _converter(Map value) {
    return KitaroProfile.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add(KitaroProfile value) => _api.addDocument(value.toJson());

  Future<void> update(KitaroProfile value) =>
      _api.updateDocument(value.toJson());
}
