import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/add_product_screen/add_product_screen.dart';

FloatingActionButton floatingActionButton() {
  return FloatingActionButton.extended(
    backgroundColor: Color(0xff4F46E5),
    onPressed: () {
      Get.to(
        () => AddProductScreen(),
        transition: Transition.zoom,
        duration: Duration(milliseconds: 700),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    },
    icon: Icon(Icons.add, color: Colors.white),
    label: Text("Add Product", style: TextStyle(color: Colors.white)),
  );
}
