import 'package:firebase_database/firebase_database.dart';

class Api {
  final FirebaseDatabase _db = FirebaseDatabase.instance;
  final String path;
  late DatabaseReference ref;

  Api(this.path) {
    ref = _db.ref(path);
  }

  Future<DatabaseEvent> getDataCollection() {
    return ref.once();
  }

  Future<DatabaseEvent> getDataCollectionBy(String key, String value) {
    return ref.orderByChild(key).equalTo(value).once();
  }

  Stream<DatabaseEvent> streamDataCollection() {
    return ref.onValue;
  }

  Stream<DatabaseEvent> streamDataCollectionBy(String key, String value) {
    return ref.orderByChild(key).equalTo(value).onValue;
  }

  Future<void> removeDocument(String id) {
    return ref.child(id).remove();
  }

  Future<void> addDocument(Map data) {
    return ref.push().set(data);
  }

  Future<void> updateDocument(Map<String, dynamic> data) {
    return ref.update(data);
  }
}
