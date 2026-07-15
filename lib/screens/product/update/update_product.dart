import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/app_bar.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/center_image.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/status_section.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/updated_form.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';

class UpdateProductScreen extends StatelessWidget {
  final ProductModel productModel;
  const UpdateProductScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String price = productModel.price.toString();

    ProductController controller = Get.find<ProductController>();

    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// =========================
              /// TOP BAR
              /// =========================
              UpdatedScreenAppBar(),
              SizedBox(height: 30),

              /// =========================
              /// PRODUCT IMAGE
              /// =========================
              CenterImage(image: productModel.image ?? ''),
              SizedBox(height: 35),

              /// =========================
              /// FORM CARD
              /// =========================
              UpdatedForm(
                productNameCtrl: controller.productNameCtrl,
                categoryController: controller.categoryCtrl,
                desController: controller.desCtrl,
                priceController: controller.priceCtrl,
              ),
              SizedBox(height: 30),

              /// =========================
              /// STATUS SECTION
              /// =========================
              StatusSection(),
              SizedBox(height: size.height * 0.12),
            ],
          ),
        ),
      ),

      bottomNavigationBar: Obx(() {
        return Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: CustomButton(
            backgroundColor: Color(0xff4F46E5),
            textColor: Colors.white,
            text: 'Updated',
            isLoading: controller.isUpdatedProduct.value,
            onPressed: () async {
              int price = int.parse(controller.priceCtrl.text);
              ProductModel product = ProductModel(
                id: productModel.id,
                name: controller.productNameCtrl.text,
                price: price,
                category: controller.categoryCtrl.text,
                description: controller.desCtrl.text,
                image: productModel.image,
                size: productModel.size,
                sizes: productModel.sizes,
              );
              await controller.updatedProduct(product);
              Get.back();
            },
          ),
        );
      }),
    );
  }
}
