import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:swiftcart_admin/models/order_model.dart';
import 'package:swiftcart_admin/services/order_services.dart';

class OrderController extends GetxController {
  /// Order Service Instance
  final OrderServices _services = OrderServices();

  /// Flutter Map Controller
  final MapController mapController = MapController();

  RxString selectedStatus = "pending".obs;
  
  void changeStatus(String value) {
    selectedStatus.value = value;
  }

  /// Rider Selected Location
  Rx<LatLng?> riderLocation = Rx<LatLng?>(null);

  /// Orders List
  RxList<OrderModel> orders = <OrderModel>[].obs;

  /// Update Order Status
  @override
  void onInit() {
    super.onInit();
    _services.getAllOrders().listen((event) {
      orders.assignAll(event);
    });
  }

  /// Update Order Status
  Future<void> updateStatus(String orderId, String status) async {
    await _services.updateStatus(orderId, status);
  }

  /// Update Rider Location
  Future<void> updateLocation(String orderId, double lat, double lng) async {
    await _services.updateRiderLocation(orderId, lat, lng);
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      Get.snackbar("Location", "Please enable location service.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    Position position = await Geolocator.getCurrentPosition();

    riderLocation.value = LatLng(position.latitude, position.longitude);

    mapController.move(riderLocation.value!, 16);
  }

  void onMapTap(LatLng point) {
    riderLocation.value = point;
    mapController.move(point, mapController.camera.zoom);
  }

  Future<void> updateOrder({
    required String orderId,
    required String status,
  }) async {
    if (riderLocation.value == null) {
      Get.snackbar("Location Required", "Please select rider location.");
      return;
    }

    await _services.updateOrder(
      orderId: orderId,
      status: status,
      riderLat: riderLocation.value!.latitude,
      riderLng: riderLocation.value!.longitude,
    );

    Get.snackbar("Success", "Order updated successfully.");
  }
}
