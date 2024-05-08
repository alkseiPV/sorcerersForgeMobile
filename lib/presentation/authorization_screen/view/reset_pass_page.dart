import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/security/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/security/event.dart';
import 'package:sourcerers_forge/domains/blocs/security/state.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/presentation/authorization_screen/providers/authorization_provider.dart';

@RoutePage()
class ResetPassPage extends StatelessWidget {
  const ResetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<AuthorizationProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Восстановление пароля',
          style: AppText.heading,
        ),
      ),
      body: BlocConsumer<SecurityBloc, SecurityStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is LoadingSecurityState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is LoadedSecurityState) {
              read.resetPassnewPassController.clear();
              read.resetPassConfirmCodeController.clear();
              read.resetpassEmailController.clear();
            }
            return Padding(
              padding: EdgeInsets.all(15.sp),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Почта',
                      style: AppText.title.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: read.resetpassEmailController,
                      hintText: 'Enter',
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Новый пароль',
                      style: AppText.title.copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      obscuretext: true,
                      controller: read.resetPassnewPassController,
                      hintText: 'Enter',
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        const Spacer(),
                        InkWell(
                          onTap: () async {
                            context.read<SecurityBloc>().add(GetCodeEvent(
                                email: read.resetpassEmailController.text));
                          },
                          child: Text(
                            'получить код',
                            style: AppText.priceText
                                .copyWith(color: AppColors.activeColor),
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
                      controller: read.resetPassConfirmCodeController,
                      hintText: 'Enter',
                    ),
                    const Spacer(),
                    Center(
                      child: CustomButton(
                        ontap: () {
                          context
                              .read<SecurityBloc>()
                              .add(ResetPassEvent(isprofile: false, data: {
                                "email": read.resetpassEmailController.text,
                                "emailcode":
                                    read.resetPassConfirmCodeController.text,
                                "password": read.resetPassnewPassController.text
                              }));
                        },
                        title: 'Сменить',
                        width: 330,
                        height: 45,
                      ),
                    )
                  ]),
            );
          }),
    );
  }
}
