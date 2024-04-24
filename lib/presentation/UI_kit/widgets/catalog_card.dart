import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';

class Catalogcard extends StatelessWidget {
  final String? imgURL;
  final double? price;
  final int? count;
  final String? title;
  final int? countFeedBacks;
  final double? raiting;
  const Catalogcard(
      {super.key,
      required this.count,
      required this.countFeedBacks,
      required this.imgURL,
      required this.price,
      required this.raiting,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 250.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imgURL!.contains('png'))
              Image.network(
                'http://95.165.64.208:6565$imgURL',
                width: 175.w,
                height: 140.h,
              )
            else
              Container(
                width: 175.w,
                height: 140.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.sp),
                    color: AppColors.activeColor),
              ),
            SizedBox(height: 10.h),
            Text(
              '$price руб',
              style: AppText.priceText,
            ),
            SizedBox(height: 10.h),
            Text(
              'В наличии: $count шт.',
              style: AppText.infoText,
            ),
            SizedBox(height: 12.h),
            Text(
              title!,
              style: AppText.heading,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Icon(Icons.star, color: AppColors.activeColor),
                SizedBox(width: 6.h),
                Text(
                  '$raiting',
                  style: AppText.infoText,
                ),
                SizedBox(width: 6.h),
                SvgPicture.asset(
                  'assets/svg/comment.svg',
                  colorFilter: const ColorFilter.mode(
                      AppColors.textSecondary, BlendMode.color),
                ),
                SizedBox(width: 6.h),
                Text(
                  '$countFeedBacks отзывов',
                  style: AppText.infoText,
                ),
              ],
            ),
            SizedBox(height: 10.h),
          ],
        ),
        Positioned(
            bottom: 0,
            child: CustomButton(ontap: () {}, title: 'В корзину', width: 175))
      ],
    );
  }
}
