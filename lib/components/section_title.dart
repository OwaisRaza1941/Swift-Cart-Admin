import 'package:flutter/material.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';

/// Section Title

Widget sectionTitle({required String title, required IconData icon}) {
  return Row(
    children: [
      Icon(icon, color: Color(0xff6366F1), size: 22),

      SizedBox(width: 8),

      Text(
        title,
        style: AppTextStyle.bodyLarge.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    ],
  );
}
