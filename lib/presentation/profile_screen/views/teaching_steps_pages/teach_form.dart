import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sourcerers_forge/presentation/UI_kit/widgets/custom_button.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

class SendTeachForm extends StatelessWidget {
  const SendTeachForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: CustomButton(
              ontap: () {
                AutoRouter.of(context).popUntilRoot();
                AutoRouter.of(context).replaceAll([const NavigationPanel()]);
              },
              title: 'Подать заявку',
              width: 330)),
    );
  }
}
