import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices {
  /// Firebase Firestore Collection Insatnce Create
  final _user = FirebaseFirestore.instance.collection('users');

  /// Add User Firebase Firestore
  Future<void> addUsers(String uid, String name, String email) async {
    try {
      /// add User In Unique Id
      await _user.doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException {
      rethrow;
    }
  }
}
