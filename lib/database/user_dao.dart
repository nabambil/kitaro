import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class UserDao {
  final Api _api;

  UserDao({String? id}) : _api = id == null ? Api(kUser) : Api("$kUser/$id");

  Future<KitaroAccount> get profile async {
    return _api.getDataCollection().then((event) {
      return _converter(_data(event));
    });
  }

  Stream<KitaroAccount> get profile$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, KitaroAccount> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  KitaroAccount _converter(Map value) {
    return KitaroAccount.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add({required KitaroAccount value, required String id}) =>
      _api.add(id, value.toJson());

  Future<void> update(KitaroAccount value) =>
      _api.updateDocument(value.toJson());
}
