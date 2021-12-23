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

  Stream<DatabaseEvent> streamDataCollection() {
    return ref.onValue;
  }

  Future<DatabaseEvent> getDocumentById(String id) {
    return ref.child(id).once();
  }

  Future<void> removeDocument(String id) {
    return ref.child(id).remove();
  }

  Future<void> addDocument(Map data) {
    return ref.set(data);
  }

  Future<void> updateDocument(Map<String, String> data, String id) {
    return ref.child(id).update(data);
  }
}
