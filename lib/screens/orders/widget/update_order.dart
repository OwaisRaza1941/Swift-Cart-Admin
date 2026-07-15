import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/models/order_model.dart';
import 'package:swiftcart_admin/screens/orders/controller/order_controller.dart';

class UpdateOrder extends StatelessWidget {
  final OrderModel order;

  UpdateOrder({super.key, required this.order}) {
    controller.selectedStatus.value = order.status;
  }

  final OrderController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///==================================
        /// UPDATE ORDER
        ///==================================
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
                "Update Order",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 25),

              /// Status
              Obx(() {
                return DropdownButtonFormField<String>(
                  value: controller.selectedStatus.value,
                  decoration: InputDecoration(
                    labelText: "Order Status",
                    prefixIcon: const Icon(Icons.local_shipping),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(value: "pending", child: Text("Pending")),
                    DropdownMenuItem(
                      value: "confirmed",
                      child: Text("Confirmed"),
                    ),
                    DropdownMenuItem(value: "packing", child: Text("Packing")),
                    DropdownMenuItem(
                      value: "on_the_way",
                      child: Text("On The Way"),
                    ),
                    DropdownMenuItem(
                      value: "delivered",
                      child: Text("Delivered"),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      controller.changeStatus(value);
                    }
                  },
                );
              }),
              SizedBox(height: 25),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.orange.shade200),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange),
                    SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        "Update rider latitude and longitude from the admin panel for testing live tracking.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25),
      ],
    );
  }
}
