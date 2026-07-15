import 'package:flutter/material.dart';
import 'package:swiftcart_admin/components/build_row.dart';

class OrderInformation extends StatelessWidget {
  const OrderInformation({super.key});

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

              buildRow(Icons.confirmation_number, "Order ID", "#ORD-10245"),
              Divider(height: 30),

              buildRow(Icons.person, "Customer", "Owais Raza"),
              Divider(height: 30),

              buildRow(Icons.phone, "Phone", "+92 300 1234567"),
              Divider(height: 30),

              buildRow(
                Icons.location_on,
                "Delivery Address",
                "Gulshan-e-Iqbal Block 13 Karachi",
              ),
              Divider(height: 30),

              buildRow(Icons.payments, "Payment", "Cash On Delivery"),
              Divider(height: 30),

              buildRow(Icons.shopping_bag, "Items", "4 Products"),
              Divider(height: 30),

              buildRow(Icons.currency_rupee, "Total", "PKR 4,500"),
            ],
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
