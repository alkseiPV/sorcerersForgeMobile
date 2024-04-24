import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/purchase_card.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Корзина'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      PurchaseCard(count: 1, price: 1000, title: 'КАТАНА'),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: 10),
              SizedBox(
                height: 100.h,
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 100.h,
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
                      style: AppText.heading,
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
                      '10 000 руб.',
                      style: AppText.heading,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(CreateOrderRoute());
              },
              title: 'Заказать',
              width: 120,
              fs: 13,
            )
          ]),
        ),
      ),
    );
  }
}
