 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swiftcart_admin/utils/constants/app_color.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';
import 'package:swiftcart_admin/widgets/custom_button.dart';
import 'package:swiftcart_admin/widgets/custom_outlinebutton.dart';

void logoutDailog({
  required VoidCallback onPressed,
  String? messegeTitle,
  String? messegeSubTitle,
}) {
  Get.dialog(
    Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.myRed.withOpacity(0.4),
                shape: BoxShape.circle,
                border: BoxBorder.all(color: AppColors.myRed, width: 3),
              ),
              child: Center(
                child: Icon(Icons.error, size: 30, color: AppColors.myRed),
              ),
            ),
            SizedBox(height: 10),
            Text(
              messegeTitle ?? '',
              style: AppTextStyle.bodyLarge.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              messegeSubTitle ?? '',
              style: AppTextStyle.bodyLarge.copyWith(
                color: AppColors.textLabelColor,
              ),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Yes,Logout',
              onPressed: onPressed,
              backgroundColor: AppColors.myRed,
              textColor: Colors.white,
            ),
            SizedBox(height: 10),
            CustomOutlineButton(
              text: 'No,Cnacel',
              onPressed: () => Get.back(),
              textColor: Colors.black,
              borderColor: AppColors.borderColor,
            ),
          ],
        ),
      ),
    ),
    barrierDismissible: false,
  );
}
