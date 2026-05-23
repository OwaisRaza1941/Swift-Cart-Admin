import 'package:flutter/material.dart';
import 'package:swiftcart_admin/screens/home/widgets/dashborad_cards.dart';

class GridCards extends StatelessWidget {
  final int gridCount;
  const GridCards({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      childAspectRatio: 1.4,
      children: [
        DashboardCard(
          title: "Users",
          value: "1,240",
          icon: Icons.people,
          color: Colors.blue,
        ),
        DashboardCard(
          title: "Products",
          value: "340",
          icon: Icons.shopping_bag,
          color: Colors.orange,
        ),
        DashboardCard(
          title: "Orders",
          value: "890",
          icon: Icons.shopping_cart,
          color: Colors.green,
        ),
        DashboardCard(
          title: "Revenue",
          value: "\$12K",
          icon: Icons.attach_money,
          color: Colors.purple,
        ),
      ],
    );
  }
}
