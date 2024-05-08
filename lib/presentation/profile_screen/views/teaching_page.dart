import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sourcerers_forge/presentation/profile_screen/views/teaching_steps_pages/step_1.dart';
import 'package:sourcerers_forge/presentation/profile_screen/views/teaching_steps_pages/step_2.dart';
import 'package:sourcerers_forge/presentation/profile_screen/views/teaching_steps_pages/step_3.dart';
import 'package:sourcerers_forge/presentation/profile_screen/views/teaching_steps_pages/step_4.dart';
import 'package:sourcerers_forge/presentation/profile_screen/views/teaching_steps_pages/teach_form.dart';

@RoutePage()
class TeachingPage extends StatelessWidget {
  const TeachingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const Step1Teach(),
          const Step2Teach(),
          const Step3Teach(),
          const Step4Teach(),
          SendTeachForm()
        ],
      ),
    );
  }
}
