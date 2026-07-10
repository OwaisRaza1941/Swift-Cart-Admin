import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/orders/controller/order_controller.dart';
import 'package:swiftcart_admin/screens/orders/updated_order_screen.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({super.key});
  final OrderController controller = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEF2FF),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          "Orders",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              /// Search Field
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Order...",
                  prefixIcon: const Icon(Icons.search),

                  filled: true,
                  fillColor: Colors.white,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Orders List
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) {
                      final order = controller.orders[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 18),

                        padding: const EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            /// Order ID + Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                              children: [
                                Text(
                                  "Order #10${order.orderId?.substring(0, 5)}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 6,
                                  ),

                                  decoration: BoxDecoration(
                                    color: Colors.orange.shade100,

                                    borderRadius: BorderRadius.circular(30),
                                  ),

                                  child: Text(
                                    order.status,
                                    style: TextStyle(
                                      color: Colors.orange.shade900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 18),

                            Row(
                              children: [
                                Icon(Icons.person),

                                SizedBox(width: 10),

                                Text(
                                  order.userName,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),

                            SizedBox(height: 12),

                            Row(
                              children: [
                                Icon(Icons.location_on),

                                SizedBox(width: 10),

                                Expanded(
                                  child: Text(
                                    order.deliveryAddress,
                                    style: TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 12),

                            Row(
                              children: [
                                Icon(Icons.payments),

                                SizedBox(width: 10),

                                Text(order.paymentMethod),
                              ],
                            ),

                            SizedBox(height: 12),

                            Row(
                              children: [
                                Icon(Icons.shopping_bag),

                                SizedBox(width: 10),

                                Text("4 Products"),
                              ],
                            ),

                            SizedBox(height: 20),

                            SizedBox(
                              width: double.infinity,

                              height: 48,

                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff6366F1),

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),

                                onPressed: () {
                                  /// Next Screen
                                  Get.to(UpdateOrderScreen());
                                },

                                child: Text(
                                  "Manage Order",

                                  style: TextStyle(
                                    color: Colors.white,

                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
