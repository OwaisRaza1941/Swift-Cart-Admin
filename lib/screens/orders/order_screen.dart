import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/orders/controller/order_controller.dart';
import 'package:swiftcart_admin/screens/orders/widget/order_list_card.dart';
import 'package:swiftcart_admin/screens/orders/widget/search_field.dart';
import 'package:swiftcart_admin/widgets/custom_appbar.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});

  /// Order Controller Instance
  final OrderController controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2FF),
      body: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 900),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                /// App Bar
                CustomAppBar(title: 'Orders'),
                SizedBox(height: 20),

                /// Search Field
                SearchField(),
                SizedBox(height: 20),

                /// Orders List
                Obx(() {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.orders.length,
                      itemBuilder: (context, index) {
                        final order = controller.orders[index];
                        return OrderListCard(order: order);
                      },
                    ),
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
