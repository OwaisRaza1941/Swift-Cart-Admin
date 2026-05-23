import 'package:flutter/material.dart';
import 'package:swiftcart_admin/components/dashboard_cards.dart';

class TotalProductsOutOfStock extends StatelessWidget {
  const TotalProductsOutOfStock({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmall = constraints.maxWidth < 600;

        return Row(
          children: [
            Expanded(
              child: dashboardCard(
                title: "Total Products",
                value: "120",
                icon: Icons.shopping_bag_outlined,
                color: Color(0xff4F46E5),
              ),
            ),

            SizedBox(width: isSmall ? 10 : 15),

            Expanded(
              child: dashboardCard(
                title: "Out of Stock",
                value: "08",
                icon: Icons.warning_amber_rounded,
                color: Colors.redAccent,
              ),
            ),
          ],
        );
      },
    );
  }
}
