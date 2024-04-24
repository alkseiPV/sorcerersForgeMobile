import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';

class PurchaseCard extends StatelessWidget {
  final String title;
  final double price;
  final int count;
  const PurchaseCard(
      {super.key,
      required this.count,
      required this.price,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.h,
      child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Container(
          height: 100,
          width: 100,
          color: AppColors.activeColor,
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppText.title,
            ),
            const Spacer(),
            Text(
              '$price руб.',
              style: AppText.infoText.copyWith(fontSize: 14.sp),
            )
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove,
                      color: AppColors.textPrimary,
                    )),
                Text(
                  '1',
                  style: AppText.infoText.copyWith(fontSize: 15),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add,
                      color: AppColors.textPrimary,
                    )),
              ],
            ),
            Spacer(),
            CustomButton(
              ontap: () {},
              title: 'удалить',
              width: 100,
              fs: 12,
            ),
          ],
        )
      ]),
    );
  }
}
