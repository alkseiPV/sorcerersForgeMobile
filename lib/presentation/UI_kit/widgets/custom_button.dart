import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final int? height;
  final String title;
  final int? fs;
  final Color? color;
  final Function() ontap;

  const CustomButton(
      {super.key,
      required this.ontap,
      required this.title,
      this.height,
      this.fs,
      this.color,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: Size(width.w, height == null ? 30.h : height!.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.sp)),
            backgroundColor: color ?? AppColors.activeColor),
        onPressed: ontap,
        child: Text(
          title,
          style: AppText.buttonText
              .copyWith(fontSize: fs == null ? 16.sp : fs!.sp),
        ));
  }
}
