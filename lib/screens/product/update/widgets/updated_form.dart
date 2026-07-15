import 'package:flutter/material.dart';
import 'package:swiftcart_admin/components/custom_feild.dart';
import 'package:swiftcart_admin/utils/constants/app_styles.dart';

class UpdatedForm extends StatelessWidget {
  final TextEditingController productNameCtrl;
  final TextEditingController priceController;
  final TextEditingController categoryController;
  final TextEditingController desController;
  const UpdatedForm({
    super.key,
    required this.productNameCtrl,
    required this.priceController,
    required this.categoryController,
    required this.desController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: AppStyles.updateProductFormStyle,
      child: Column(
        children: [
          customField(
            title: "Product Name",
            hint: "Nike Air Max",
            icon: Icons.shopping_bag_outlined,
            controller: productNameCtrl,
          ),
          SizedBox(height: 20),

          customField(
            title: "Category",
            hint: "Shoes",
            icon: Icons.category_outlined,
            controller: categoryController,
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: customField(
                  title: "Price",
                  hint: "1200",
                  icon: Icons.currency_rupee,
                  controller: priceController,
                ),
              ),

              SizedBox(width: 15),

              Expanded(
                child: customField(
                  title: "Stock",
                  hint: "25",
                  icon: Icons.inventory_2_outlined,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),

          customField(
            title: "Description",
            hint: "Write product description...",
            icon: Icons.description_outlined,
            maxLines: 5,
            controller: desController,
          ),
        ],
      ),
    );
  }
}
