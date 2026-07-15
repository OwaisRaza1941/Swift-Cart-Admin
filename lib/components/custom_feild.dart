import 'package:flutter/material.dart';

// /// =========================
// /// CUSTOM FIELD
// /// =========================

Widget customField({
  required String title,
  required String hint,
  required IconData icon,
  int maxLines = 1,
  TextEditingController? controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
      SizedBox(height: 10),

      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: TextField(
          maxLines: maxLines,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, size: 22),
            border: InputBorder.none,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
          ),
        ),
      ),
    ],
  );
}
