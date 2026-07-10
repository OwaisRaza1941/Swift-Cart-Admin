import 'package:get/get.dart';
import 'package:swiftcart_admin/models/order_model.dart';
import 'package:swiftcart_admin/services/order_services.dart';

class OrderController extends GetxController {
  final OrderServices _services = OrderServices();

  RxList<OrderModel> orders = <OrderModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    _services.getAllOrders().listen((event) {
      orders.assignAll(event);
    });
  }

  Future<void> updateStatus(String orderId, String status) async {
    await _services.updateStatus(orderId, status);
  }

  Future<void> updateLocation(String orderId, double lat, double lng) async {
    await _services.updateRiderLocation(orderId, lat, lng);
  }
}
