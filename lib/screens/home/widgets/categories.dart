import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find<ProductController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Category', style: AppTextStyle.h3),
        Obx(() {
          return DropdownButton<String>(
            style: AppTextStyle.bodyMedium.copyWith(color: Colors.grey),
            underline: SizedBox(),
            value: controller.selectedcategoryValue.value,
            items: controller.categoryList.map((list) {
              return DropdownMenuItem(value: list, child: Text(list));
            }).toList(),
            onChanged: (value) {
              controller.updatedCategoryValue(value!);
            },
          );
        }),
      ],
    );
  }
}
