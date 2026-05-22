import 'package:flutter/material.dart';

/// =========================
/// CUSTOM FIELD
/// =========================

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

      TextField(
        maxLines: maxLines,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Color(0xffF5F6FA),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(color: Color(0xff4F46E5)),
          ),
        ),
      ),
    ],
  );
}
