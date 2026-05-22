import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swiftcart_admin/models/favorite_model.dart';
import 'package:swiftcart_admin/models/product_model.dart';

class FavoriteServices {
  final _firestore = FirebaseFirestore.instance;

  /// Add favorite
  Future<void> addFavorite(FavoriteModel favoriteModel) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      String productId = favoriteModel.productId;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .doc(productId)
          .set(favoriteModel.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  /// Remove favorite
  Future<void> removeFavorite(String productId) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .doc(productId)
          .delete();
    } on FirebaseException {
      rethrow;
    }
  }

  /// Get favorite IDs
  Future<List<String>> getFavoriteIds(String uid) async {
    var snapshot = await _firestore
        .collection('users')
        .doc(uid)
        .collection('favorites')
        .get();
    return snapshot.docs.map((d) => d.id).toList();
  }

  /// Get full product objects from IDs
  Stream<List<ProductModel>> getFavoriteProducts() {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      return Stream.value([]);
    }

    String uid = user.uid;
    try {
      return _firestore
          .collection('users')
          .doc(uid)
          .collection('favorites')
          .snapshots()
          .asyncMap((snapshot) async {
            List<String> ids = snapshot.docs.map((doc) => doc.id).toList();

            List<ProductModel> products = [];

            for (var id in ids) {
              var productDoc = await _firestore
                  .collection('product')
                  .doc(id)
                  .get();

              if (productDoc.exists) {
                products.add(
                  ProductModel.fromMap(productDoc.data()!, productDoc.id),
                );
              }
            }

            return products;
          });
    } on FirebaseException {
      rethrow;
    }
  }

  String? get currentUid {
    return FirebaseAuth.instance.currentUser?.uid;
  }
}
