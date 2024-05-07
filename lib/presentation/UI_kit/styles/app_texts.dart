import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';

class AppText {
  static TextStyle heading = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.textPrimary,
      fontFamily: 'RobotoSlab');

  static TextStyle title = TextStyle(
      fontSize: 14.sp,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      fontFamily: 'RobotoSlab');

  static TextStyle priceText = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'RobotoSlab',
  );

  static TextStyle infoText = TextStyle(
      fontSize: 14.sp,
      color: AppColors.textSecondary,
      fontWeight: FontWeight.w400,
      fontFamily: 'RobotoSlab');

  static TextStyle buttonText = TextStyle(
      fontSize: 11.sp,
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w700,
      fontFamily: 'RobotoSlab');
}
