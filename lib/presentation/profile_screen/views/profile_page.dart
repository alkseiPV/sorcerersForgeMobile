import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Center(
          child: Column(children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.sp),
                  color: AppColors.activeColor),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(MyDataRoute());
              },
              title: 'мои данные',
              width: 320,
              height: 45,
              color: AppColors.textfieldColor,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(PersonalOrderRoute());
              },
              title: 'Заказать изделие',
              width: 320,
              height: 45,
              color: AppColors.textfieldColor,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(TeachingRoute());
              },
              title: 'Обучение',
              width: 320,
              height: 45,
              color: AppColors.textfieldColor,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(SecurityRoute());
              },
              title: 'Безопасность',
              width: 320,
              height: 45,
              color: AppColors.textfieldColor,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(AboutUsRoute());
              },
              title: 'О нас',
              width: 320,
              height: 45,
              color: AppColors.textfieldColor,
            ),
            Spacer(),
            CustomButton(
              ontap: () {
                AutoRouter.of(context).push(LoginRoute());
              },
              title: 'Выйти',
              width: 320,
              height: 45,
              color: Colors.red.withOpacity(0.4),
            ),
          ]),
        ),
      ),
    );
  }
}
