import 'package:flutter/material.dart';

/// =========================
/// DASHBOARD CARD
/// =========================
Widget dashboardCard({
  required String title,
  required String value,
  required IconData icon,
  required Color color,
}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      double width = constraints.maxWidth;

      // scaling logic
      double iconSize = width < 150 ? 18 : 24;
      double valueSize = width < 150 ? 18 : 22;
      double titleSize = width < 150 ? 11 : 13;

      return Container(
        padding: EdgeInsets.all(width < 150 ? 12 : 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(width < 150 ? 8 : 12),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: Colors.white, size: iconSize),
            ),

            SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: valueSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  Text(
                    title,
                    style: TextStyle(fontSize: titleSize),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
