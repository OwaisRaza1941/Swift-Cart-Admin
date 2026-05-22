import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/screens/product/product_screen.dart';

/// Drawer
class AdminDrawer extends StatelessWidget {
  const AdminDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xff111827),
      child: Column(
        children: [
          SizedBox(height: 70),

          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 50, color: Colors.black),
          ),

          SizedBox(height: 15),

          Text(
            "Admin Panel",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 40),

          drawerItem(Icons.dashboard, "Dashboard", () {}),
          drawerItem(Icons.people, "Users", () {}),
          drawerItem(Icons.shopping_bag, "Products", () {
            Get.to(ProductScreen());
          }),
          drawerItem(Icons.receipt_long, "Orders", () {}),
          drawerItem(Icons.bar_chart, "Analytics", () {}),
          drawerItem(Icons.settings, "Settings", () {}),

          Spacer(),

          drawerItem(Icons.logout, "Logout", () {}),

          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: onTap,
    );
  }
}
