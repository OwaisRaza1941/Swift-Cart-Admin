import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/order_model.dart';
import 'package:swiftcart_admin/screens/orders/updated_order_screen.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';

class OrderListCard extends StatelessWidget {
  final OrderModel order;
  const OrderListCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order #10${order.orderId?.substring(0, 5)}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
              Text(order.userName, style: TextStyle(fontSize: 16)),
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

          /// Manage Button
          CustomButton(
            backgroundColor: Color(0xff6366F1),
            textColor: Colors.white,
            text: 'Manage Order',
            onPressed: () {
              Get.to(() => UpdateOrderScreen(order: order));
            },
          ),
        ],
      ),
    );
  }
}
