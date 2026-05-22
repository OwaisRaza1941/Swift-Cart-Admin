import 'package:flutter/material.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Products",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),

        Row(
          children: [
            iconBox(Icons.notifications_none),

            SizedBox(width: 12),

            iconBox(Icons.settings_outlined),
          ],
        ),
      ],
    );
  }
}

/// =========================
/// ICON BOX
/// =========================
Widget iconBox(IconData icon) {
  return Container(
    padding: EdgeInsets.all(10),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),

      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
    ),

    child: Icon(icon),
  );
}
