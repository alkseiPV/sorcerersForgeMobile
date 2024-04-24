import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/registration/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/registration/event.dart';
import 'package:sourcerers_forge/domains/blocs/registration/state.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/presentation/authorization_screen/providers/authorization_provider.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final read = context.read<AuthorizationProvider>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: BlocConsumer<RegistrationBloc, RegistrationStates>(
            listener: (context, state) {
          if (state is RegisteredState) {
            read.clearRegData();
            AutoRouter.of(context).popAndPush(const LoginRoute());
          }
        }, builder: (context, state) {
          if (state is InitialRegistrationState || state is UnRegisteredState) {
            if (state is UnRegisteredState) {
              print(state.error);
            }
            return Form(
              key: _formKey,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'SOURCERES FORGE',
                      style: AppText.title.copyWith(fontSize: 24.sp),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextField(
                      controller: read.regLoginController,
                      hintText: 'email',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Введите корректный email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: read.regPasswordController,
                      hintText: 'password',
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 6) {
                          return 'Пароль должен быть длиннее 6 символов';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextField(
                      controller: read.confirmPasswordController,
                      hintText: 'Confirm password',
                      validator: (value) {
                        if (value != read.regPasswordController.text ||
                            value == null ||
                            value.isEmpty) {
                          return 'Пароли не совпадают';
                        }
                        return null;
                      },
                    ),
                  ]),
            );
          }
          if (state is LoadingRegistrationState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const SizedBox.shrink();
        }),
      ),
      bottomSheet: Container(
          color: AppColors.background,
          height: 120.h,
          width: double.infinity,
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              child: CustomButton(
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<RegistrationBloc>().add(RegisterEvent(user: {
                          'email': read.regLoginController.text,
                          'password': read.confirmPasswordController.text
                        }));
                  }
                },
                title: 'Регистрация',
                width: 175,
              ))),
    );
  }
}
