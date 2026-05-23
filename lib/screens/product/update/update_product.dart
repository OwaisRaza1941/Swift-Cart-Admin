import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/app_bar.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/center_image.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/status_section.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/updated_form.dart';
import 'package:swiftcart_admin/utils/constants/app_styles.dart';

class UpdateProductScreen extends StatelessWidget {
  final ProductModel productModel;
  const UpdateProductScreen({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    String price = productModel.price.toString();

    TextEditingController productNameCtrl = TextEditingController(
      text: productModel.name,
    );
    TextEditingController priceController = TextEditingController(text: price);

    TextEditingController categoryController = TextEditingController(
      text: productModel.category,
    );
    TextEditingController desController = TextEditingController(
      text: productModel.description,
    );

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
                productNameCtrl: productNameCtrl,
                categoryController: categoryController,
                desController: desController,
                priceController: priceController,
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
          width: double.infinity,
          height: 50,
          padding: EdgeInsets.all(20),
          color: Colors.white,
          child: ElevatedButton(
            style: AppStyles.updatedBtnStyle,
            onPressed: controller.isLoading.value
                ? null
                : () async {
                    int price = int.parse(priceController.text);
                    ProductModel product = ProductModel(
                      id: productModel.id,
                      name: productNameCtrl.text,
                      price: price,
                      category: categoryController.text,
                      description: desController.text,
                      image: productModel.image,
                      size: productModel.size,
                      sizes: productModel.sizes,
                    );
                    await controller.updatedProduct(product);
                    Get.back();
                  },
            child: controller.isLoading.value
                ? SizedBox(child: CircularProgressIndicator())
                : Text(
                    "Update Product",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        );
      }),
    );
  }
}
