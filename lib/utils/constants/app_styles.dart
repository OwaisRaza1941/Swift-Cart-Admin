import 'package:flutter/material.dart';

class AppStyles {
  static final productCardList = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(22),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.04),
        blurRadius: 10,
        offset: Offset(0, 4),
      ),
    ],
  );

  static final productImageDecoration = BoxDecoration(
    color: Color(0xffF5F6FA),
    borderRadius: BorderRadius.circular(18),
  );

  static final productStockStyle = BoxDecoration(
    color: Colors.green.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
  );

  static final productEditBtnStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xff4F46E5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  );

  static final productDeleteBtnStyle = BoxDecoration(
    color: Colors.red.withOpacity(0.1),
    borderRadius: BorderRadius.circular(14),
  );
  static final updateProductFormStyle = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(28),
    boxShadow: [
      BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
    ],
  );
}
