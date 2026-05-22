
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/screens/product/update/update_product.dart';
import 'package:swiftcart_admin/utils/constants/app_styles.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';
import 'package:swiftcart_admin/widgets/custom_outlinebutton.dart';

class ProductCardList extends StatelessWidget {
  final ProductModel productModel;
  const ProductCardList({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find<ProductController>();

    return Container(
      padding: EdgeInsets.all(12),
      decoration: AppStyles.productCardList,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Product Image
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: AppStyles.productImageDecoration,
              child: Image.network(
                productModel.image ?? '',
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 12),

          /// Product Name
          Text(
            productModel.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),

          Text(
            productModel.category,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          SizedBox(height: 10),

          /// Price + Stock
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "PKR ${productModel.price} ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff4F46E5),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: AppStyles.productStockStyle,
                child: Text(
                  "In Stock",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),

          /// Buttons
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: AppStyles.productEditBtnStyle,
                  onPressed: () {
                    Get.to(
                      () => UpdateProductScreen(productModel: productModel),
                    );
                  },
                  child: Text("Edit", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(width: 10),

              GestureDetector(
                onTap: () {
                  Get.dialog(
                    Dialog(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text(
                              'Do you want to delete this product?',
                              style: AppTextStyle.bodyMedium.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(height: 20),

                            Row(
                              children: [
                                Expanded(
                                  child: CustomOutlineButton(
                                    borderColor: Colors.grey,
                                    textColor: Colors.black,
                                    text: 'Cancel',
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                ),

                                SizedBox(width: 10),

                                Obx(() {
                                  return Expanded(
                                    child: CustomButton(
                                      text: 'Delete',
                                      onPressed: controller.isLoading.value
                                          ? null
                                          : () async {
                                              await controller.deleteProduct(
                                                productModel.id!,
                                              );

                                              Get.back();
                                            },
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: AppStyles.productDeleteBtnStyle,
                  child: Icon(Icons.delete_outline, color: Colors.red),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
