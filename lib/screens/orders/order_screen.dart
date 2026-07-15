import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/orders/controller/order_controller.dart';
import 'package:swiftcart_admin/screens/orders/updated_order_screen.dart';
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
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search Order...",
                    prefixIcon: Icon(Icons.search),

                    filled: true,
                    fillColor: Colors.white,

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                /// Orders List
                Obx(() {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: controller.orders.length,
                      itemBuilder: (context, index) {
                        final order = controller.orders[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 18),
                          padding: EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Order ID + Status
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,

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
                                      style: TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                      ),
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
      ),
    );
  }
}
