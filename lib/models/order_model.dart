import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String? orderId;
  final String userId;
  final String userName;
  final String userPhone;
  final String deliveryAddress;
  final double deliveryLat;
  final double deliveryLng;
  final String paymentMethod;
  // final List<CartModel> items;
  final double subtotal;
  final double deliveryFee;
  final double total;
  final String
  status; // pending, confirmed, packing, on_the_way, delivered, cancelled
  final String? riderId;
  final double? riderLat;
  final double? riderLng;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OrderModel({
    this.orderId,
    required this.userId,
    required this.userName,
    required this.userPhone,
    required this.deliveryAddress,
    required this.deliveryLat,
    required this.deliveryLng,
    required this.paymentMethod,
    // required this.items,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    this.status = 'pending',
    this.riderId,
    this.riderLat,
    this.riderLng,
    this.createdAt,
    this.updatedAt,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map, String id) {
    return OrderModel(
      orderId: id,
      userId: map['userId'],
      userName: map['userName'],
      userPhone: map['userPhone'],
      deliveryAddress: map['deliveryAddress'],
      deliveryLat: (map['deliveryLat'] as num).toDouble(),
      deliveryLng: (map['deliveryLng'] as num).toDouble(),
      paymentMethod: map['paymentMethod'],
      // items: (map['items'] as List? ?? [])
      //     .where((e) => e != null)
      //     .map((e) => CartModel.fromMap(e as Map<String, dynamic>))
      //     .toList(),
      subtotal: (map['subtotal'] as num).toDouble(),
      deliveryFee: (map['deliveryFee'] as num).toDouble(),
      total: (map['total'] as num).toDouble(),
      status: map['status'] ?? 'pending',
      riderId: map['riderId'],
      riderLat: map['riderLat'] != null
          ? (map['riderLat'] as num).toDouble()
          : null,
      riderLng: map['riderLng'] != null
          ? (map['riderLng'] as num).toDouble()
          : null,
      createdAt: map['createdAt'] != null
          ? (map['createdAt'] as Timestamp).toDate()
          : null,
      updatedAt: map['updatedAt'] != null
          ? (map['updatedAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'userName': userName,
      'userPhone': userPhone,
      'deliveryAddress': deliveryAddress,
      'deliveryLat': deliveryLat,
      'deliveryLng': deliveryLng,
      'paymentMethod': paymentMethod,
      // 'items': items.map((e) => e.toMap()).toList(),
      'subtotal': subtotal,
      'deliveryFee': deliveryFee,
      'total': total,
      'status': status,
      'riderId': riderId,
      'riderLat': riderLat,
      'riderLng': riderLng,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
}
