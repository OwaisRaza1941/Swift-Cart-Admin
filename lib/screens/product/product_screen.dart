import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';
import 'package:swiftcart_admin/screens/product/widgets/app_bar.dart';
import 'package:swiftcart_admin/screens/product/widgets/floating_action_btn.dart';
import 'package:swiftcart_admin/screens/product/widgets/product_card_list.dart';
import 'package:swiftcart_admin/screens/product/widgets/product_search_bar.dart';
import 'package:swiftcart_admin/screens/product/widgets/total_products_out_of_stock.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find<ProductController>();

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffF5F6FA),
      // Floating Add Button
      floatingActionButton: floatingActionButton(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),

          child: Column(
            children: [
              /// =========================
              /// TOP BAR
              /// =========================
              ProductAppBar(),
              SizedBox(height: 25),

              /// =========================
              /// SEARCH BAR
              /// =========================
              ProductSearchBar(),
              SizedBox(height: 25),

              /// =========================
              /// DASHBOARD CARDS
              /// =========================
              TotalProductsOutOfStock(),
              SizedBox(height: 25),

              /// =========================
              /// PRODUCT LIST
              /// =========================
              StreamBuilder(
                stream: controller.getProducts(),
                builder: (context, snapshot) {
                  /// Loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(color: Colors.purple);
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No Product Found",
                        style: AppTextStyle.bodyLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }

                  final data = snapshot.data;

                  return Expanded(
                    child: GridView.builder(
                      itemCount: data!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: size.width > 900
                            ? 4
                            : size.width > 600
                            ? 3
                            : 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.72,
                      ),
                      itemBuilder: (context, index) {
                        final listOffProduct = data[index];
                        return ProductCardList(productModel: listOffProduct);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
