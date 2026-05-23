import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swiftcart_admin/models/product_model.dart';

class ProductServices {
  /// Firebase Firestore Collection Insatnce Create
  final _productCollection = FirebaseFirestore.instance.collection('product');

  /// Add Product Firebase Firestore
  Future<void> addProduct(ProductModel product) async {
    try {
      /// add Product In Unique Id
      await _productCollection.doc().set(product.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  /// Get Product Firebase Firestore
  Stream<List<ProductModel>> getProducts() {
    return _productCollection.snapshots().map((snapshots) {
      return snapshots.docs.map((data) {
        return ProductModel.fromMap(data.data(), data.id);
      }).toList();
    });
  }

  /// Updated Product Firebase Firestore
  Future<void> updatedProduct(ProductModel product) async {
    try {
      /// Updated Product In Unique Id
      await _productCollection.doc(product.id).update(product.toMap());
    } on FirebaseException {
      rethrow;
    }
  }

  /// Delete Product Firebase Firestore
  Future<void> deleteProduct(String id) async {
    try {
      /// Delete Product In Unique Id
      await _productCollection.doc(id).delete();
    } on FirebaseException {
      rethrow;
    }
  }
}
