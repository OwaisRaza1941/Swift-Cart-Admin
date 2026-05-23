class ProductModel {
  String? id;
  String name;
  String? image;
  String? description;
  int discount = 0;
  List<String>? sizes;
  double? starRating;
  int price;
  String category;
  String? size;

  ProductModel({
    this.id,
    required this.name,
    this.image,
    this.description,
    required this.price,
    this.discount,
    this.sizes,
    this.starRating,
    required this.category,
    this.size,
  });

  /// Convert FireStore Data In Product Model Class
  factory ProductModel.fromMap(Map<String, dynamic> map, String docId) {
    return ProductModel(
      id: docId,
      name: map['name'] ?? '',
      price: (map['price'] ?? 0),
      discount: map['discount'] ?? 0,
      sizes: map['sizes'] != null ? List<String>.from(map['sizes']) : [],
      starRating: map['starRating'] != null
          ? (map['starRating']).toDouble()
          : null,
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      category: map['category'] ?? '',
      size: map['size'] ?? '',
    );
  }

  /// To Add Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'discount': discount,
      'sizes': sizes,
      'starRating': starRating,
      'description': description,
      'image': image,
      'category': category,
      'size': size,
    };
  }
}
