import 'package:flutter/material.dart';
import 'package:swiftcart_admin/components/build_row.dart';
import 'package:swiftcart_admin/models/order_model.dart';

class OrderInformation extends StatelessWidget {
  final OrderModel order;

  const OrderInformation({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///===========================
        /// ORDER INFORMATION
        ///===========================
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Information",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),

              buildRow(
                Icons.confirmation_number,
                "Order ID",
                "#${order.orderId}",
              ),
              Divider(height: 30),

              buildRow(Icons.person, "Customer", order.userName),
              Divider(height: 30),

              buildRow(Icons.phone, "Phone", order.userPhone),
              Divider(height: 30),

              buildRow(
                Icons.location_on,
                "Delivery Address",
                order.deliveryAddress,
              ),
              Divider(height: 30),

              buildRow(Icons.payments, "Payment", order.paymentMethod),
              Divider(height: 30),

              buildRow(Icons.shopping_bag, "Items", "4 Products"),
              Divider(height: 30),

              buildRow(Icons.currency_rupee, "Total", "PKR ${order.total}"),
            ],
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
