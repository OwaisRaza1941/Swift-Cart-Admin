class CartModel {
  String productId;
  String name;
  int price;
  String image;
  String size;
  int quantity;

  /// Cart Constructor
  CartModel({
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    this.quantity = 1,
  });

  /// Firebase Firestore Data Convert In dart Model
  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      productId: map['productId'],
      name: map['name'],
      price: map['price'],
      image: map['image'],
      size: map['size'],
      quantity: map['quantity'],
    );
  }

  /// Dart Model Convert In to Firestore Data
  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'price': price,
      'image': image,
      'size': size,
      'quantity': quantity,
    };
  }
}
