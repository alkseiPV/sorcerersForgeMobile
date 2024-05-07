// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:sourcerers_forge/data/dio_service.dart';
import 'package:sourcerers_forge/locator.dart';
import 'package:sourcerers_forge/routes/app_route.gr.dart';

@RoutePage()
class App extends StatelessWidget {
  const App({super.key});

  checkAuth(BuildContext context) async {
    String? check = await locator<DioService>().getToken();
    if (check == null || check.isEmpty) {
      AutoRouter.of(context).replace(const LoginRoute());
    } else {
      AutoRouter.of(context).replace(const NavigationPanel());
    }
  }

  @override
  Widget build(BuildContext context) {
    checkAuth(context);
    return Container();
  }
}
