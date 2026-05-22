import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/product/controller/product_screen_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // User/Auth

    // Home
    Get.put(ProductController(), permanent: true);
  }
}
