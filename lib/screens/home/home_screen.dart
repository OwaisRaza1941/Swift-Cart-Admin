import 'package:flutter/material.dart';
import 'package:swiftcart_admin/screens/home/widgets/admin_drawer.dart';
import 'package:swiftcart_admin/screens/home/widgets/dahborad_topbar.dart';
import 'package:swiftcart_admin/screens/home/widgets/grid_cards.dart';
import 'package:swiftcart_admin/screens/home/widgets/recent_order_card.dart';
import 'package:swiftcart_admin/screens/home/widgets/sales_analytics.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width > 900;
    final bool isTablet = width > 600;

    int gridCount = 2;

    if (isDesktop) {
      gridCount = 4;
    } else if (isTablet) {
      gridCount = 3;
    }

    return Scaffold(
      backgroundColor: Color(0xfff5f7fb),
      /// Drawer
      drawer: isDesktop ? null : AdminDrawer(),

      body: Row(
        children: [
          /// Desktop Sidebar
          if (isDesktop) SizedBox(width: 260, child: AdminDrawer()),

          /// Main Content
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Top Bar
                      DashboardTopBar(isDesktop: isDesktop),
                      SizedBox(height: 30),

                      /// Statistics Cards
                      GridCards(gridCount: gridCount),
                      SizedBox(height: 30),

                      /// Sales Analytics
                      SalesAnalytics(),
                      SizedBox(height: 30),

                      /// Recent Orders
                      RecentOrderCard(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
