import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/order_model.dart';
import 'package:swiftcart_admin/screens/orders/controller/order_controller.dart';
import 'package:swiftcart_admin/screens/orders/widget/map_preview.dart';
import 'package:swiftcart_admin/screens/orders/widget/order_info.dart';
import 'package:swiftcart_admin/screens/orders/widget/update_order.dart';
import 'package:swiftcart_admin/widgets/custom_appbar.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';

class UpdateOrderScreen extends StatelessWidget {
  final OrderModel order;

  UpdateOrderScreen({super.key, required this.order});

  final OrderController controller = Get.find();

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
                  OrderInformation(order: order),

                  ///==================================
                  /// UPDATE ORDER
                  ///==================================
                  UpdateOrder(order: order),

                  ///==================================
                  /// MAP PREVIEW
                  ///==================================
                  MapPreview(order: order),

                  ///==================================
                  /// UPDATE BUTTON
                  ///==================================
                  CustomButton(
                    backgroundColor: Color(0xff6366F1),
                    textColor: Colors.white,
                    text: 'Update Order',
                    icon: Icons.save,
                    sizedBoxedWidht: 8,
                    onPressed: () async {
                      await controller.updateOrder(
                        orderId: order.orderId!,

                        status: controller.selectedStatus.value,
                      );
                    },
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
