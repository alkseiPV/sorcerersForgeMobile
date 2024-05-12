import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/registration/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/registration/event.dart';
import 'package:sourcerers_forge/domains/blocs/registration/state.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/flushbar.dart';
import 'package:sourcerers_forge/presentation/authorization_screen/providers/authorization_provider.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class ConfirmCodePage extends StatelessWidget {
  const ConfirmCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<AuthorizationProvider>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<RegistrationBloc, RegistrationStates>(
          listener: (context, state) {
        if (state is RegisteredState) {
          AutoRouter.of(context).replace(const LoginRoute());
        }
      }, builder: (context, state) {
        if (state is LoadingRegistrationState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: EdgeInsets.all(20.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Подтверждение почты',
                style: AppText.title,
              ),
              SizedBox(
                height: 20.h,
              ),
              if (state is UnRegisteredState)
                Text(
                  state.error.contains('invalid')
                      ? 'Неверный код!'
                      : state.error.contains('duplicate')
                          ? "Такой пользователь уже существует!"
                          : '',
                  style: AppText.infoText.copyWith(color: Colors.red),
                ),
              if (state is UnRegisteredState)
                SizedBox(
                  height: 20.h,
                ),
              CustomTextField(
                controller: read.confirmRegCodeController,
                hintText: 'Код подтверждения',
              )
            ],
          ),
        );
      }),
      bottomSheet: Container(
          color: AppColors.background,
          height: 120.h,
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              child: CustomButton(
                ontap: () {
                  if (read.confirmRegCodeController.text.isEmpty) {
                    Flushbar.warning(title: 'Введите код!').show();
                  } else {
                    context.read<RegistrationBloc>().add(RegisterEvent(user: {
                          'email': read.regLoginController.text,
                          'password': read.confirmPasswordController.text,
                          'emailCode': read.confirmRegCodeController.text,
                        }));
                  }
                },
                title: 'Регистрация',
                width: 175,
              ))),
    );
  }
}
