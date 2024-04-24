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
class SecurityPage extends StatelessWidget {
  const SecurityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<ProfileProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Безопасность',
          style: AppText.heading,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(children: [
          Text(
            'Новый пароль',
            style: AppText.title.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: read.newPassController,
            hintText: 'Enter',
          ),
          SizedBox(height: 5.h),
          Row(
            children: [
              const Spacer(),
              InkWell(
                onTap: () {},
                child: Text(
                  'получить код',
                  style:
                      AppText.priceText.copyWith(color: AppColors.activeColor),
                ),
              )
            ],
          ),
          SizedBox(height: 15.h),
          Text(
            'код подтверждения',
            style: AppText.title.copyWith(fontSize: 18.sp),
          ),
          SizedBox(height: 10.h),
          CustomTextField(
            controller: read.smsController,
            hintText: 'Enter',
          ),
          const Spacer(),
          CustomButton(
            ontap: () {},
            title: 'Сменить',
            width: 330,
            height: 45,
          )
        ]),
      ),
    );
  }
}
