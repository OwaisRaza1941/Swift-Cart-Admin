import 'package:flutter/material.dart';

class UpdateOrderScreen extends StatelessWidget {
  const UpdateOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEEF2FF),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Manage Order",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Container(
            constraints: const BoxConstraints(maxWidth: 850),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                ///===========================
                /// ORDER INFORMATION
                ///===========================
                Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        "Order Information",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      buildRow(
                        Icons.confirmation_number,
                        "Order ID",
                        "#ORD-10245",
                      ),

                      const Divider(height: 30),

                      buildRow(Icons.person, "Customer", "Owais Raza"),

                      const Divider(height: 30),

                      buildRow(Icons.phone, "Phone", "+92 300 1234567"),

                      const Divider(height: 30),

                      buildRow(
                        Icons.location_on,
                        "Delivery Address",
                        "Gulshan-e-Iqbal Block 13 Karachi",
                      ),

                      const Divider(height: 30),

                      buildRow(Icons.payments, "Payment", "Cash On Delivery"),

                      const Divider(height: 30),

                      buildRow(Icons.shopping_bag, "Items", "4 Products"),

                      const Divider(height: 30),

                      buildRow(Icons.currency_rupee, "Total", "PKR 4,500"),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // NEXT PART

                ///==================================
                /// UPDATE ORDER
                ///==================================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Update Order",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// Status
                      DropdownButtonFormField<String>(
                        value: "pending",
                        decoration: InputDecoration(
                          labelText: "Order Status",
                          prefixIcon: const Icon(Icons.local_shipping),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: "pending",
                            child: Text("Pending"),
                          ),

                          DropdownMenuItem(
                            value: "confirmed",
                            child: Text("Confirmed"),
                          ),

                          DropdownMenuItem(
                            value: "packing",
                            child: Text("Packing"),
                          ),

                          DropdownMenuItem(
                            value: "on_the_way",
                            child: Text("On The Way"),
                          ),

                          DropdownMenuItem(
                            value: "delivered",
                            child: Text("Delivered"),
                          ),
                        ],
                        onChanged: (value) {},
                      ),

                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Rider Latitude",
                                prefixIcon: const Icon(Icons.my_location),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: "Rider Longitude",
                                prefixIcon: const Icon(Icons.location_on),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: const Row(
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
                const SizedBox(height: 25),

                ///==================================
                /// MAP PREVIEW
                ///==================================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rider Location",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Container(
                        height: 300,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.map, size: 70, color: Colors.indigo),

                            SizedBox(height: 15),

                            Text(
                              "Flutter Map Preview",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 8),

                            Text(
                              "Map will be added later",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.location_searching),
                          label: const Text("Pick Rider Location"),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                ///==================================
                /// UPDATE BUTTON
                ///==================================
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: () {},

                    icon: const Icon(Icons.save, color: Colors.white),

                    label: const Text(
                      "Update Order",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff6366F1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(IconData icon, String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Icon(icon, color: Colors.indigo),

        const SizedBox(width: 15),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),

              const SizedBox(height: 5),

              Text(
                value,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
