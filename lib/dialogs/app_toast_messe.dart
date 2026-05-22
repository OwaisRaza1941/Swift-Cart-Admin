import 'package:flutter/material.dart';
import 'package:get/get.dart';

void toastMessege(bool isFav) {
  Get.snackbar(
    isFav ? 'Removed' : 'Added',
    isFav ? 'Product removed from favorites' : 'Product added to favorites',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.black,
    colorText: Colors.white,
    margin: EdgeInsets.all(16),
    borderRadius: 8,
    duration: Duration(seconds: 1),
    snackStyle: SnackStyle.FLOATING,
    barBlur: 50,
  );
}
