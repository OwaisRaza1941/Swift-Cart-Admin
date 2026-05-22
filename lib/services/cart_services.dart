import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:swiftcart_admin/models/cart_model.dart';

class CartServices {
  final _firestore = FirebaseFirestore.instance;

  /// Firebase Add To Product In firestore With User Uniqe Id By Product Id
  Future<void> addToCart(CartModel cartModel) async {
    try {
      // User Uniqe Id
      String uid = FirebaseAuth.instance.currentUser!.uid;
      // 🔥 unique docId (product + size)
      String docId = "${cartModel.productId}_${cartModel.size}";
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(docId)
          .set(cartModel.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  // /// Get Data Cart
  Stream<List<CartModel>> getCart() {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      return _firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .snapshots()
          .map((snapshot) {
            return snapshot.docs.map((doc) {
              return CartModel.fromMap(doc.data());
            }).toList();
          });
    } on FirebaseException {
      rethrow;
    }
  }

  Future<void> updateQunatity(String docId, int quantity) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      if (quantity <= 0) {
        // delete if 0
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('cart')
            .doc(docId)
            .delete();
      } else {
        // update quantity
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('cart')
            .doc(docId)
            .update({'quantity': quantity});
      }
    } on FirebaseException {
      rethrow;
    }
  }

  /// Remove Cart
  Future<void> removeCart(String productId) async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('cart')
          .doc(productId)
          .delete();
    } on FirebaseException {
      rethrow;
    }
  }
}
