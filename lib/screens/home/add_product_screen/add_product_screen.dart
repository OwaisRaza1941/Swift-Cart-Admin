import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/home/widgets/categories.dart';
import 'package:swiftcart_admin/screens/home/widgets/discount_slider.dart';
import 'package:swiftcart_admin/screens/home/widgets/product_size.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
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
      backgroundColor: Color(0xffF5F7FB),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Add Product",
          style: AppTextStyle.h3.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(maxWidth: 700),
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header
                Text(
                  "Product Information",
                  style: AppTextStyle.h3.copyWith(fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                Text(
                  "Fill all product details carefully",
                  style: AppTextStyle.bodyMedium.copyWith(color: Colors.grey),
                ),

                const SizedBox(height: 30),

                /// Name + Price
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFields(
                        hintText: 'Product Name',
                        controller: nameCtrl,
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: CustomTextFields(
                        hintText: 'Price',
                        controller: priceCtrl,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// Description
                CustomTextFields(hintText: 'Description', controller: desCtrl),

                const SizedBox(height: 20),

                /// Image
                CustomTextFields(hintText: 'Image URL', controller: imageCtrl),

                const SizedBox(height: 30),

                /// Category
                Text(
                  "Category",
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                ProductCategories(),

                const SizedBox(height: 25),

                /// Size
                Text(
                  "Available Sizes",
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                ProductSize(),

                const SizedBox(height: 25),

                /// Discount
                Text(
                  "Discount",
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                DiscountSlider(),

                const SizedBox(height: 35),

                /// Button
                Obx(() {
                  return CustomButton(
                    backgroundColor: controller.isLoading.value
                        ? Colors.grey
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

                            // int? discount = controller.discountValue.value > 0
                            //     ? controller.discountValue.value.toInt()
                            //     : null;

                            ProductModel product = ProductModel(
                              name: nameCtrl.text,
                              price: price,
                              category: controller.selectedcategoryValue.value,
                              description: desCtrl.text,
                              image: imageCtrl.text,
                              discount: controller.discountValue.value,
                              size: controller.selectedSizeValue.value,
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
