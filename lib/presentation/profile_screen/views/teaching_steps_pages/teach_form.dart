import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sourcerers_forge/domains/usecases/profile_usecases.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_textfield.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

class SendTeachForm extends StatelessWidget {
  SendTeachForm({super.key});
  final _formkey = GlobalKey<FormState>();
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Center(
            child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                child: CustomTextField(
                  hintText: 'Сообщение нам',
                  controller: controller,
                  validator: (val) {
                    if (val!.isEmpty || val.length < 10) {
                      return 'Обращение слишком короткое!';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  ontap: () async {
                    if (_formkey.currentState!.validate()) {
                      bool ans = await locator<ProfileUseCases>()
                          .sendRequestLearning(controller.text);
                      if (ans) {
                        AutoRouter.of(context).popUntilRoot();
                        AutoRouter.of(context)
                            .replaceAll([const NavigationPanel()]);
                      }
                    }
                  },
                  title: 'Подать заявку',
                  width: 350.w),
            ],
          ),
        )),
      ),
    );
  }
}
