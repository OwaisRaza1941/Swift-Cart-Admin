import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/home/widgets/categories.dart';
import 'package:swiftcart_admin/screens/home/widgets/discount_slider.dart';
import 'package:swiftcart_admin/screens/home/widgets/product_size.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/utils/constants/app_color.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';
import 'package:swiftcart_admin/widgets/custom_text_fields.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCtrl = TextEditingController();
    TextEditingController priceCtrl = TextEditingController();
    TextEditingController desCtrl = TextEditingController();
    TextEditingController imageCtrl = TextEditingController();

    ProductController controller = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDarkColor,
        title: Text('Add Product'),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: AppTextStyle.h3.copyWith(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFields(
                        hintText: 'Name',
                        controller: nameCtrl,
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: CustomTextFields(
                        hintText: 'Price',
                        controller: priceCtrl,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomTextFields(hintText: 'Description', controller: desCtrl),
                SizedBox(height: 15),
                CustomTextFields(hintText: 'Image', controller: imageCtrl),
                SizedBox(height: 15),
                ProductCategories(),
                SizedBox(height: 15),
                ProductSize(),
                SizedBox(height: 10),
                DiscountSlider(),
                SizedBox(height: 10),
                Obx(() {
                  return CustomButton(
                    backgroundColor: controller.isLoading.value
                        ? AppColors.buttonDisableColor
                        : Colors.black,
                    textColor: Colors.white,
                    width: double.infinity,
                    text: controller.isLoading.value
                        ? 'Please wait...'
                        : 'Add Product',
                    onPressed: controller.isLoading.value
                        ? null
                        : () async {
                            int price = int.tryParse(priceCtrl.text) ?? 0;
                            int? discount = controller.discountValue.value > 0
                                ? controller.discountValue.value.toInt()
                                : null;
                            ProductModel product = ProductModel(
                              name: nameCtrl.text,
                              price: price,
                              category: controller.selectedValue.value,
                              description: desCtrl.text,
                              image: imageCtrl.text,
                              discount: discount,
                              size: controller.selectedValue.value,
                            );
                            await controller.addProduct(product);

                            nameCtrl.clear();
                            priceCtrl.clear();
                            desCtrl.clear();
                            imageCtrl.clear();
                          },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
