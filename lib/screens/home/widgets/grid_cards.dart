import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/home/widgets/dashborad_cards.dart';
import 'package:swiftcart_admin/screens/orders/order_screen.dart';
import 'package:swiftcart_admin/screens/product/product_screen.dart';

class GridCards extends StatelessWidget {
  final int gridCount;

  const GridCards({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      crossAxisSpacing: 18,
      mainAxisSpacing: 18,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.35,

      children: [
        /// USERS
        DashboardCard(
          title: "Users",
          value: "1,240",
          icon: Icons.people_rounded,
          color: Colors.blue,

          onTap: () {
            Get.to(
              () => ProductScreen(),

              /// BEAUTIFUL ANIMATION
              transition: Transition.rightToLeftWithFade,

              duration: Duration(milliseconds: 700),

              curve: Curves.easeInOutCubic,
            );
          },
        ),

        /// PRODUCTS
        DashboardCard(
          title: "Products",
          value: "340",
          icon: Icons.shopping_bag_rounded,
          color: Colors.redAccent,

          onTap: () {
            Get.to(
              () => ProductScreen(),

              /// PREMIUM PAGE TRANSITION
              transition: Transition.zoom,

              duration: Duration(milliseconds: 700),

              curve: Curves.fastLinearToSlowEaseIn,
            );
          },
        ),

        /// ORDERS
        DashboardCard(
          title: "Orders",
          value: "890",
          icon: Icons.shopping_cart_checkout_rounded,
          color: Colors.green,

          onTap: () {
            Get.to(
              () => OrdersScreen(),

              transition: Transition.downToUp,

              duration: Duration(milliseconds: 700),

              curve: Curves.easeInOutExpo,
            );
          },
        ),

        /// REVENUE
        DashboardCard(
          title: "Revenue",
          value: "\$12K",
          icon: Icons.attach_money_rounded,
          color: Colors.deepPurple,

          onTap: () {
            Get.to(
              () => ProductScreen(),

              transition: Transition.native,

              duration: Duration(milliseconds: 800),

              curve: Curves.easeInOutBack,
            );
          },
        ),
      ],
    );
  }
}
