import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class CreateCompletePage extends StatelessWidget {
  const CreateCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Вы успешно создали заказ!',
            style: AppText.heading,
            textAlign: TextAlign.center,
          ),
          Text(
            'В скором времени с вами свяжутся\nдля уточнения деталей',
            style: AppText.infoText.copyWith(fontSize: 15.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.h),
          CustomButton(
              ontap: () {
                AutoRouter.of(context).replaceAll([const NavigationPanel()]);
              },
              title: 'На главную!',
              width: 150)
        ],
      )),
    );
  }
}
