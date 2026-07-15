import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/components/build_field.dart';
import 'package:swiftcart_admin/components/section_title.dart';
import 'package:swiftcart_admin/dialogs/app_snackbar.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/add_product_screen/widgets/header_section.dart';
import 'package:swiftcart_admin/screens/home/widgets/categories.dart';
import 'package:swiftcart_admin/screens/home/widgets/discount_slider.dart';
import 'package:swiftcart_admin/screens/home/widgets/product_size.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/utils/constants/app_styles.dart';
import 'package:swiftcart_admin/widgets/custom_appbar.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';

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
      backgroundColor: Color(0xffEEF2FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: 'Add Product'),
                SizedBox(height: 20),
                Container(
                  constraints: BoxConstraints(maxWidth: 750),
                  padding: EdgeInsets.all(30),
                  decoration: AppStyles.addProductScreenContainerStyle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Header Section
                      HeaderSection(),
                      SizedBox(height: 20),

                      /// Name + Price
                      Row(
                        children: [
                          Expanded(
                            child: buildField(
                              controller: nameCtrl,
                              hint: "Product Name",
                              icon: Icons.inventory_2_outlined,
                            ),
                          ),

                          SizedBox(width: 18),

                          Expanded(
                            child: buildField(
                              controller: priceCtrl,
                              hint: "Price",
                              icon: Icons.attach_money_rounded,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 22),

                      /// Description
                      buildField(
                        controller: desCtrl,
                        hint: "Description",
                        icon: Icons.description_outlined,
                        maxLines: 4,
                      ),

                      SizedBox(height: 22),

                      /// Image URL
                      buildField(
                        controller: imageCtrl,
                        hint: "Image URL",
                        icon: Icons.image_outlined,
                      ),
                      SizedBox(height: 30),

                      /// Category
                      sectionTitle(
                        title: "Category",
                        icon: Icons.category_outlined,
                      ),
                      SizedBox(height: 14),

                      ProductCategories(),
                      SizedBox(height: 28),

                      /// Sizes
                      sectionTitle(
                        title: "Available Sizes",
                        icon: Icons.straighten,
                      ),
                      SizedBox(height: 14),

                      ProductSize(),
                      SizedBox(height: 28),

                      /// Discount
                      sectionTitle(
                        title: "Discount",
                        icon: Icons.local_offer_outlined,
                      ),
                      SizedBox(height: 14),

                      /// Discount Slider
                      DiscountSlider(),
                      SizedBox(height: 40),

                      /// Button
                      Obx(() {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          child: CustomButton(
                            backgroundColor: Color(0xff6366F1),
                            textColor: Colors.white,
                            text: 'Add Product',
                            isLoading: controller.isAddProduct.value,
                            onPressed: () async {
                              if (nameCtrl.text.isEmpty &&
                                      priceCtrl.text.isEmpty ||
                                  controller.selectedSizeValue.isEmpty) {
                                AppSnackbar.error(
                                  'Please all fields required!',
                                );
                                return;
                              }
                              int price = int.tryParse(priceCtrl.text) ?? 0;

                              ProductModel product = ProductModel(
                                name: nameCtrl.text,
                                price: price,
                                category:
                                    controller.selectedcategoryValue.value,
                                description: desCtrl.text,
                                image: imageCtrl.text,
                                discount: controller.discountValue.value,
                                size: controller.selectedSizeValue.value,
                              );

                              await controller.addProduct(product);

                              Get.back();

                              nameCtrl.clear();
                              priceCtrl.clear();
                              desCtrl.clear();
                              imageCtrl.clear();
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
