import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:swiftcart_admin/models/order_model.dart';
import 'package:swiftcart_admin/screens/orders/controller/order_controller.dart';

class MapPreview extends StatelessWidget {
  final OrderModel order;

  MapPreview({super.key, required this.order});

  final OrderController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              Text(
                "Rider Location",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              SizedBox(
                height: 320,
                child: Obx(() {
                  return FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      initialCenter: LatLng(
                        order.deliveryLat,
                        order.deliveryLng,
                      ),
                      initialZoom: 15,

                      onTap: (_, point) {
                        controller.onMapTap(point);
                      },
                    ),

                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}{r}.png',
                        subdomains: ['a', 'b', 'c', 'd'],
                        userAgentPackageName: 'com.example.swiftcart_admin',
                      ),

                      MarkerLayer(
                        markers: [
                          /// Customer Marker
                          Marker(
                            point: LatLng(order.deliveryLat, order.deliveryLng),
                            width: 45,
                            height: 45,
                            child:   Icon(
                              Icons.location_pin,
                              color: Colors.red,
                              size: 45,
                            ),
                          ),

                          /// Rider Marker
                          if (controller.riderLocation.value != null)
                            Marker(
                              point: controller.riderLocation.value!,
                              width: 45,
                              height: 45,
                              child:   Icon(
                                Icons.delivery_dining,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () async {
                    await controller.getCurrentLocation();
                  },
                  icon:   Icon(Icons.my_location),
                  label:   Text("Use Current GPS"),
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
        SizedBox(height: 30),
      ],
    );
  }
}
