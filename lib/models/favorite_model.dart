
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteModel {
  String productId;
  DateTime createdAt;

  FavoriteModel({required this.productId, required this.createdAt});

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      productId: map['productId'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'productId': productId, 'createdAt': createdAt};
  }
}
