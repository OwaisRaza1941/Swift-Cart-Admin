import 'package:get/get.dart';
import 'package:swiftcart_admin/models/order_model.dart';
import 'package:swiftcart_admin/services/order_services.dart';

class OrderController extends GetxController {
  /// Order Service Instance
  final OrderServices _services = OrderServices();

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
}
