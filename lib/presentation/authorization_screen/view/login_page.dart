import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/blocs/authorization/bloc.dart';
import 'package:sourcerers_forge/domains/blocs/authorization/event.dart';
import 'package:sourcerers_forge/domains/blocs/authorization/state.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_colors.dart';
import 'package:sourcerers_forge/presentation/UI_kit/styles/app_texts.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/presentation/authorization_screen/providers/authorization_provider.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final read = context.read<AuthorizationProvider>();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15.sp),
        child: BlocConsumer<AuthorizationBloc, AuthorizationState>(
            listener: (context, state) {
          if (state is AuthenticatedState) {
            read.clearLoginData();
            AutoRouter.of(context).replace(const NavigationPanel());
          }
        }, builder: (context, state) {
          if (state is InitAuthorizationState ||
              state is UnauthenticatedState) {
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
                        controller: read.loginController,
                        hintText: 'email',
                        validator: (val) {
                          if (val == null ||
                              val.isEmpty ||
                              !val.contains('@')) {
                            return 'Введите корректный e-mail!';
                          }
                          return null;
                        }),
                    SizedBox(height: 10.h),
                    CustomTextField(
                        controller: read.passwordController,
                        hintText: 'password',
                        validator: (val) {
                          if (val == null || val.isEmpty || val.length < 6) {
                            return 'Введите корректный password';
                          }
                          return null;
                        }),
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'или  ',
                          style: AppText.infoText,
                        ),
                        InkWell(
                          onTap: () {
                            AutoRouter.of(context).push(RegistrationRoute());
                          },
                          child: Text(
                            'Зарегистрируйтесь',
                            style: AppText.buttonText
                                .copyWith(color: AppColors.activeColor),
                          ),
                        )
                      ],
                    )
                  ]),
            );
          }
          if (state is AuthenticatedState) {
            return const SizedBox.shrink();
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
                  context.read<AuthorizationBloc>().add(LogInEvent(user: {
                        'email': read.loginController.text,
                        'password': read.passwordController.text
                      }));
                } else {}
              },
              title: 'Войти',
              width: 175,
            )),
      ),
    );
  }
}
