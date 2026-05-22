
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/utils/constants/app_color.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';

class DiscountSlider extends StatelessWidget {
  const DiscountSlider({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find<ProductController>();
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Discount: ${controller.discountValue.value.toInt()}%",
            style: AppTextStyle.h3,
          ),
          Slider(
            activeColor: AppColors.buttonBackground,
            value: controller.discountValue.value,
            min: 0,
            max: 70,
            divisions: 14,
            label: controller.discountValue.value.toInt().toString(),
            onChanged: (value) {
              controller.discountValue.value = value;
            },
          ),
        ],
      );
    });
  }
}
