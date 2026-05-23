class ProductModel {
  String? id;
  String name;
  String? image;
  String? description;
  double discount;
  List<String> sizes;
  double starRating;
  int price;
  String category;
  String? size;

  ProductModel({
    this.id,
    required this.name,
    this.image,
    this.description,
    required this.price,

    /// Default Values
    this.discount = 0.0,
    this.sizes = const ['S', 'M', 'L'],
    this.starRating = 0.0,

    required this.category,
    this.size,
  });

  /// Convert FireStore Data In Product Model Class
  factory ProductModel.fromMap(
    Map<String, dynamic> map,
    String docId,
  ) {
    return ProductModel(
      id: docId,

      name: map['name'] ?? '',

      price: map['price'] ?? 0,

      /// int ko double mein convert kar raha hai
      discount: (map['discount'] ?? 0).toDouble(),

      sizes: map['sizes'] != null
          ? List<String>.from(map['sizes'])
          : ['S', 'M', 'L'],

      /// int ko double mein convert kar raha hai
      starRating: (map['starRating'] ?? 0).toDouble(),

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