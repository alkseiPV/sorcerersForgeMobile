import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/presentation/profile_screen/provider/profile_provider.dart';

@RoutePage()
class PersonalOrderPage extends StatelessWidget {
  const PersonalOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Описание заказа',
                style: AppText.heading,
              ),
              SizedBox(height: 10.h),
              CustomTextField(
                controller: read.descriptionPersonalOrder,
                maxlines: 5,
              ),
              Row(
                children: [
                  Text(
                    'Можно позвонить',
                    style: AppText.title,
                  ),
                  Checkbox(
                      value: context.watch<ProfileProvider>().phoneEnable,
                      onChanged: (val) {
                        read.phoneEnable = val!;
                      }),
                ],
              ),
            ]),
      ),
      bottomSheet: Container(
        color: AppColors.background,
        child: Padding(
          padding: EdgeInsets.all(30.sp),
          child: CustomButton(
              ontap: () {
                AutoRouter.of(context).popUntilRoot();
                read.clearpersonalOrder();
              },
              title: 'Отправить заявку',
              width: 330),
        ),
      ),
    );
  }
}
