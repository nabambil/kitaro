import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:kitaro/kitaro.dart';

class AddressDao {
  final Api _api;

  AddressDao({String? id}) : _api = id == null ? Api(kAddresses) : Api("$kAddresses/$id");

  Future<AddressModel> get address async {
    return _api.getDataCollection().then((event) => _converter(_data(event)));
  }

  Stream<AddressModel> get address$ {
    return _api.streamDataCollection().transform(_handler);
  }

  StreamTransformer<DatabaseEvent, AddressModel> get _handler {
    return StreamTransformer.fromHandlers(handleData: (event, sink) {
      sink.add(_converter(_data(event)));
    });
  }

  AddressModel _converter(Map value) {
    return AddressModel.fromJson(Map<String, dynamic>.from(value));
  }

  Map _data(DatabaseEvent event) => event.snapshot.value as Map;

  Future<String?> add(AddressModel value) => _api.addDocument(value.toJson());

  Future<void> update(AddressModel value) =>
      _api.updateDocument(value.toJson());
}
