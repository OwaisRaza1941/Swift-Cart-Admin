import 'package:flutter/material.dart';
import 'package:swiftcart_admin/utils/constants/app_color.dart';
import 'package:swiftcart_admin/utils/constants/text_styles.dart';

class CustomTextFields extends StatelessWidget {
  final double? width;
  final double? height;
  final String hintText;
  final String? helperText;
  final TextStyle? hintTextStyle;
  final Widget? suffixIcon; // changed from IconButton? to Widget?
  final Widget? prefexIcon; // changed from IconButton? to Widget?
  final double borderRadius;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obscureText; // <-- add this
  final TextInputType? keyboardType; // <-- add this

  const CustomTextFields({
    super.key,
    this.width,
    this.height,
    required this.hintText,
    this.hintTextStyle,
    this.helperText,
    this.suffixIcon,
    this.prefexIcon,
    this.borderRadius = 12,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false, // default false
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (helperText != null)
          Text(
            helperText!,
            style: AppTextStyle.bodyLarge.copyWith(fontWeight: FontWeight.w600),
          ),
        SizedBox(height: 5),
        Container(
          width: width ?? double.infinity,
          height: height ?? 55,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: AppColors.borderColor),
          ),
          child: TextFormField(
            keyboardType: keyboardType,
            obscureText: obscureText, // <-- use the passed value
            cursorColor: Colors.black,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintTextStyle,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              errorStyle: TextStyle(color: Colors.red, fontSize: 12),
              suffixIcon: suffixIcon,
              prefixIcon: prefexIcon,
              border: InputBorder.none,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
