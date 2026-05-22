import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatedScreenAppBar extends StatelessWidget {
  const UpdatedScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Icon(Icons.arrow_back_ios_new),
          ),
        ),

        Text(
          "Update Product",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        Container(
          padding: const EdgeInsets.all(12),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),

          child: const Icon(Icons.edit_outlined),
        ),
      ],
    );
  }
}
