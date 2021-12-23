import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class RecycleDao {
  final Api _api;

  RecycleDao(String? id) : _api = Api("$kRecycle/$id");

  Future<RecycleModel> get profile async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<RecycleModel> get profile$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, RecycleModel> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  RecycleModel _converter(Map value) {
    return RecycleModel.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add(RecycleModel value) => _api.addDocument(value.toJson());

  Future<void> update(RecycleModel value) =>
      _api.updateDocument(value.toJson());
}
