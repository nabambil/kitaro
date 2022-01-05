import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class RecycleDao {
  final Api _api;

  RecycleDao(String? id) : _api = Api("$kRecycle/$id");

  Future<Map<String, RecycleModel>> get recycle async {
    // final _id = FirebaseAuth.instance.currentUser?.uid;

    //  _api.getDataCollectionBy("username", _id!).then((value) => null);
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<Map<String, RecycleModel>> get recycle$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, Map<String, RecycleModel>> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  Map<String, RecycleModel> _converter(Map value) {
    final _map = <String, RecycleModel>{};
    value.forEach((key, value) {
      _map[key] = RecycleModel.fromJson(Map<String, dynamic>.from(value));
    });
    return _map;
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add(RecycleModel value) => _api.addDocument(value.toJson());

  Future<void> update(RecycleModel value) =>
      _api.updateDocument(value.toJson());
}
