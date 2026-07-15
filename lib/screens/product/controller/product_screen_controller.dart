import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/services/product_services.dart';

class ProductController extends GetxController {
  /// Product Services
  final ProductServices _productServices = ProductServices();

  late TextEditingController productNameCtrl;
  late TextEditingController priceCtrl;
  late TextEditingController categoryCtrl;
  late TextEditingController desCtrl;

  void init(ProductModel product) {
    productNameCtrl = TextEditingController(text: product.name);

    priceCtrl = TextEditingController(text: product.price.toString());

    categoryCtrl = TextEditingController(text: product.category);

    desCtrl = TextEditingController(text: product.description);
  }

  @override
  void onClose() {
    productNameCtrl.dispose();
    priceCtrl.dispose();
    categoryCtrl.dispose();
    desCtrl.dispose();
    super.onClose();
  }

  /// isLoading
  RxBool isLoading = false.obs;
  RxBool isUpdatedProduct = false.obs;
  RxBool isAddProduct = false.obs;

  RxDouble discountValue = 0.0.obs;

  RxString selectedcategoryValue = 'Shirt'.obs;

  var categoryList = ['Shirt', 'Tshirt', 'Shoes', 'Polo', 'Jeans'].obs;

  RxString selectedSizeValue = 'S'.obs;

  var sizeList = ['S', 'M', 'L'].obs;

  void updatedSizeValue(String value) {
    selectedSizeValue.value = value;
  }

  void updatedCategoryValue(String value) {
    selectedcategoryValue.value = value;
  }

  void loading() => isLoading.value = true;
  void unLoading() => isLoading.value = false;

  /// Add Product Firebase Firestore
  Future<void> addProduct(ProductModel product) async {
    try {
      isAddProduct.value = true;

      /// add Product In Unique Id
      await _productServices.addProduct(product);
    } on FirebaseException {
      rethrow;
    } finally {
      isAddProduct.value = false;
    }
  }

  /// Get Product Firebase Firestore
  Stream<List<ProductModel>> getProducts() {
    return _productServices.getProducts();
  }

  /// Updated Product Firebase Firestore
  Future<void> updatedProduct(ProductModel product) async {
    try {
      isUpdatedProduct.value = true;

      /// Updated Product In Unique Id
      await _productServices.updatedProduct(product);
    } catch (e) {
      print('Error Updated Product:$e');
    } finally {
      isUpdatedProduct.value = false;
    }
  }

  /// Delete Product Firebase Firestore
  Future<void> deleteProduct(String id) async {
    try {
      /// Delete Product In Unique Id
      await _productServices.deleteProduct(id);
    } on FirebaseException {
      rethrow;
    }
  }
}
