import 'package:flutter/material.dart';
import 'package:swiftcart_admin/screens/orders/widget/map_preview.dart';
import 'package:swiftcart_admin/screens/orders/widget/order_info.dart';
import 'package:swiftcart_admin/screens/orders/widget/update_order.dart';
import 'package:swiftcart_admin/widgets/custom_appbar.dart';

class UpdateOrderScreen extends StatelessWidget {
  const UpdateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2FF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
            child: Container(
              constraints: BoxConstraints(maxWidth: 850),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Custom AppBar
                  CustomAppBar(title: 'Manage Order'),
                  SizedBox(height: 20),

                  ///===========================
                  /// ORDER INFORMATION
                  ///===========================
                  OrderInformation(),

                  ///==================================
                  /// UPDATE ORDER
                  ///==================================
                  UpdateOrder(),

                  ///==================================
                  /// MAP PREVIEW
                  ///==================================
                  MapPreview(),

                  ///==================================
                  /// UPDATE BUTTON
                  ///==================================
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.save, color: Colors.white),
                      label: Text(
                        "Update Order",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6366F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
