import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final Widget? titleIcon;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscuretext;
  final List<TextInputFormatter>? formattes;
  final TextInputType? textInputType;

  final String hintText;
  final int? maxlines;
  const CustomTextField({
    this.obscuretext = false,
    super.key,
    this.title,
    required this.controller,
    this.icon,
    this.hintText = 'Enter',
    this.maxlines = 1,
    this.titleIcon,
    this.validator,
    this.formattes,
    this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      inputFormatters: formattes,
      obscureText: obscuretext,
      validator: validator,
      maxLines: maxlines,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15.w),
        filled: true,
        fillColor: AppColors.textfieldColor,
        hintText: hintText,
        hintStyle: AppText.infoText
            .copyWith(fontSize: 14.sp, color: AppColors.textSecondary),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.red,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.activeColor,
          ),
        ),
        suffixIcon: icon,
      ),
    );
  }
}
