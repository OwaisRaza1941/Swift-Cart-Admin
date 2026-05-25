import 'package:flutter/material.dart';

/// Beautiful Input Field
Widget buildField({
  required TextEditingController controller,
  required String hint,
  required IconData icon,
  int maxLines = 1,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Color(0xffF8FAFC),
      borderRadius: BorderRadius.circular(18),
      border: Border.all(color: Colors.grey.shade300),
    ),

    child: TextField(
      controller: controller,
      maxLines: maxLines,

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon, color: Color(0xff6366F1)),

        border: InputBorder.none,

        contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      ),
    ),
  );
}
