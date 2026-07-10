import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swiftcart_admin/models/order_model.dart';

class OrderServices {
  final _orders = FirebaseFirestore.instance.collection('orders');

  /// Get all orders (Admin panel ke liye)
  Stream<List<OrderModel>> getAllOrders() {
    return _orders
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs
              .map((doc) => OrderModel.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }

  /// Update order status (Admin/Rider ke liye)
  Future<void> updateStatus(String orderId, String status) async {
    try {
      await _orders.doc(orderId).update({
        'status': status,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException {
      rethrow;
    }
  }

  /// Update rider live location (Rider app ke liye)
  Future<void> updateRiderLocation(
    String orderId,
    double lat,
    double lng,
  ) async {
    try {
      await _orders.doc(orderId).update({
        'riderLat': lat,
        'riderLng': lng,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException {
      rethrow;
    }
  }

  Future<void> updateOrder({
    required String orderId,
    required String status,
    required double riderLat,
    required double riderLng,
  }) async {
    await _orders.doc(orderId).update({
      "status": status,
      "riderLat": riderLat,
      "riderLng": riderLng,
      "updatedAt": FieldValue.serverTimestamp(),
    });
  }
}
