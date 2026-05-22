 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/app_bar.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/status_section.dart';
import 'package:swiftcart_admin/screens/product/update/widgets/updated_form.dart';

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
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        color: Colors.white,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xff4F46E5),
            padding: EdgeInsets.symmetric(vertical: 18),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          onPressed: () async {
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
          },
          child: Text(
            "Update Product",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

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
              Center(
                child: Stack(
                  children: [
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          productModel.image ?? '',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Color(0xff4F46E5),
                          borderRadius: BorderRadius.circular(14),
                        ),

                        child: Icon(
                          Icons.camera_alt_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
    );
  }
}
