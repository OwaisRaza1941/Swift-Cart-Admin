import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/screens/product/update/update_product.dart';
import 'package:swiftcart_admin/utils/constants/app_styles.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';
import 'package:swiftcart_admin/widgets/custom_outlinebutton.dart';

class ProductCardList extends StatelessWidget {
  final ProductModel productModel;
  const ProductCardList({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        double w = constraints.maxWidth;

        // professional scaling system
        double scale = (w / 260).clamp(0.8, 1.2);

        double nameSize = 15 * scale;
        double categorySize = 12 * scale;
        double priceSize = 16 * scale;
        double iconSize = 18 * scale;
        double buttonHeight = 36 * scale;

        return Container(
          padding: EdgeInsets.all(12 * scale),
          decoration: AppStyles.productCardList,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// IMAGE
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: AppStyles.productImageDecoration,
                  child: Image.network(
                    productModel.image ?? '',
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingprogress) {
                      if (loadingprogress == null) return child;
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      );
                    },

                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey.shade300,
                        child: Icon(Icons.broken_image),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 10 * scale),

              /// NAME
              Text(
                productModel.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: nameSize,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SizedBox(height: 4),

              /// CATEGORY
              Text(
                productModel.category,
                style: TextStyle(fontSize: categorySize, color: Colors.grey),
              ),

              SizedBox(height: 8 * scale),

              /// PRICE + STOCK
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "PKR ${productModel.price}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: priceSize,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4F46E5),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8 * scale,
                      vertical: 4 * scale,
                    ),
                    decoration: AppStyles.productStockStyle,
                    child: Text(
                      "In Stock",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 11 * scale,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10 * scale),

              /// ACTIONS (PRO STYLE)
              Row(
                children: [
                  /// EDIT BUTTON (PRIMARY)
                  Expanded(
                    child: SizedBox(
                      height: buttonHeight,
                      child: ElevatedButton(
                        style: AppStyles.productEditBtnStyle,
                        onPressed: () {
                          Get.to(
                            () =>
                                UpdateProductScreen(productModel: productModel),
                          );
                        },
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13 * scale,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  /// DELETE BUTTON (ICON STYLE)
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        Dialog(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Delete this product?',
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
                                        onPressed: () => Get.back(),
                                      ),
                                    ),

                                    SizedBox(width: 10),

                                    Expanded(
                                      child: Obx(() {
                                        return CustomButton(
                                          text: 'Delete',
                                          backgroundColor: Colors.red,
                                          textColor: Colors.white,
                                          onPressed: controller.isLoading.value
                                              ? null
                                              : () async {
                                                  await controller
                                                      .deleteProduct(
                                                        productModel.id!,
                                                      );
                                                  Get.back();
                                                },
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: buttonHeight,
                      width: buttonHeight,
                      decoration: AppStyles.productDeleteBtnStyle,
                      child: Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: iconSize,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
