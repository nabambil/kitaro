import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class LocationDao {
  final Api _api;
  final String? id;

  LocationDao(this.id) : _api = Api("$kLocation/$id");

  Future<LocationModel> get profile async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<LocationModel> get profile$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, LocationModel> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  LocationModel _converter(Map value) {
    return LocationModel.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<void> add(LocationModel value) => _api.addDocument(value.toJson());

  Future<void> update(LocationModel value) =>
      _api.updateDocument(value.toJson());
}
