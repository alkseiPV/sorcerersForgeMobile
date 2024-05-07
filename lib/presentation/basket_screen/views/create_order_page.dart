import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class CreateOrderPage extends StatelessWidget {
  const CreateOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Оформление заказа',
          style: AppText.heading,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.sp),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Ваш заказ:',
              style: AppText.heading,
            ),
            SizedBox(
              height: 20.h,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'КАТАНА ${index + 1}',
                              style: AppText.title.copyWith(fontSize: 14.sp),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              '1000 руб.',
                              style: AppText.infoText,
                            )
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '1 шт.',
                          style: AppText.title,
                        )
                      ],
                    ),
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: 20),
            SizedBox(
              height: 115.h,
            )
          ]),
        ),
      ),
      bottomSheet: Container(
        height: 115.h,
        color: AppColors.textfieldColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.h),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Товаров: ',
                      style: AppText.infoText.copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '10 шт.',
                      style: AppText.title,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      'Скидка (5%): ',
                      style: AppText.infoText.copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '-${10000 * 0.05} руб.',
                      style: AppText.title,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Text(
                      'Всего: ',
                      style: AppText.infoText.copyWith(fontSize: 15.sp),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      '${10000 * 0.95} руб.',
                      style: AppText.title,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(const CreateCompleteRoute());
              },
              title: 'Оформить',
              width: 120,
              fs: 13,
            )
          ]),
        ),
      ),
    );
  }
}
