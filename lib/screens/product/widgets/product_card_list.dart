import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:swiftcart_admin/models/product_model.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/screens/product/update/update_product.dart';
import 'package:swiftcart_admin/utils/constants/app_styles.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';

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
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
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
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(.1),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.red,
                                    size: 38,
                                  ),
                                ),
                                SizedBox(height: 20),

                                Text(
                                  "Delete Product",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),

                                Text(
                                  "Are you sure you want to delete this product?\nThis action cannot be undone.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    height: 1.5,
                                  ),
                                ),
                                SizedBox(height: 30),

                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          minimumSize: Size.fromHeight(50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                        ),
                                        onPressed: () => Get.back(),
                                        child: Text(
                                          "Cancel",
                                          style: AppTextStyle.buttonMedium,
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 12),

                                    Expanded(
                                      child: Obx(() {
                                        return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red,
                                            minimumSize: Size.fromHeight(50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                          onPressed: controller.isLoading.value
                                              ? null
                                              : () async {
                                                  controller.loading();

                                                  await controller
                                                      .deleteProduct(
                                                        productModel.id!,
                                                      );

                                                  controller.unLoading();

                                                  Get.back();

                                                  Get.snackbar(
                                                    "Success",
                                                    "Product deleted successfully.",
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    backgroundColor:
                                                        Colors.green,
                                                    colorText: Colors.white,
                                                  );
                                                },
                                          child: controller.isLoading.value
                                              ? SizedBox(
                                                  height: 22,
                                                  width: 22,
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color: Colors.white,
                                                      ),
                                                )
                                              : Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
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
