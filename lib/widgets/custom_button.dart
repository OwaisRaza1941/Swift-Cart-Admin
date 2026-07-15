import 'package:flutter/material.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double? width;
  final double height;
  final double borderRadius;
  final double? sizedBoxedWidht;
  final IconData? icon; // icon support
  final String? imagePath; // image support
  final double iconSize;
  final bool? isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.borderColor,
    this.width,
    this.height = 50,
    this.borderRadius = 12,
    this.sizedBoxedWidht,
    this.icon,
    this.imagePath,
    this.iconSize = 20,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          side: borderColor != null
              ? BorderSide(color: borderColor!)
              : BorderSide.none,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Agar image diya gaya hai
            if (imagePath != null) ...[
              Image.asset(imagePath!, height: iconSize, width: iconSize),
              SizedBox(width: 8),
            ],

            SizedBox(width: sizedBoxedWidht ?? 0),

            isLoading == true
                ? Center(child: CircularProgressIndicator(strokeWidth: 2))
                : SizedBox.shrink(),

            // Text
            Text(
              text,
              style: AppTextStyle.buttonMedium.copyWith(color: textColor),
            ),
            SizedBox(width: sizedBoxedWidht ?? 0),
            // Agar icon diya gaya hai
            if (icon != null) ...[
              Icon(icon, size: iconSize, color: textColor),
              SizedBox(width: 8),
            ],
          ],
        ),
      ),
    );
  }
}
