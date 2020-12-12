import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:state_managment/models/user.dart';

class UserRepository {
  final _firestore = FirebaseFirestore.instance;

  static const USERS_COLLECTION = 'users';

  Future<bool> create(User user) async {
    await _firestore.collection(USERS_COLLECTION).add(
          user.toMap(),
        );
    return true;
  }

  Stream<List<User>> usersStream() {
    return _firestore.collection(USERS_COLLECTION).snapshots().map(
          (event) => event.docs
              .map(
                (e) => User.fromMap(e.data(), e.id),
              )
              .toList(),
        );
  }

  void delete(User userSelected) async {
    await _firestore
        .collection(USERS_COLLECTION)
        .doc(userSelected.documentId)
        .delete();
  }

  Stream<User> getById(String documentId) {
    return _firestore
        .collection(USERS_COLLECTION)
        .doc(documentId)
        .snapshots()
        .map((event) => User.fromMap(event.data(), event.id));
  }

  Future<List<User>> searchByName(String name) async {
    final result = _firestore.collection(USERS_COLLECTION).where(
          'name',
          isEqualTo: name,
        );
  }
}
